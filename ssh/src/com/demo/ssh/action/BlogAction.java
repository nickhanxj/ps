package com.demo.ssh.action;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import com.demo.ssh.base.BaseAction;
import com.demo.ssh.entity.Blog;
import com.demo.ssh.entity.BlogComment;
import com.demo.ssh.entity.BlogPraise;
import com.demo.ssh.entity.EnshrineBlog;
import com.demo.ssh.entity.User;
import com.demo.ssh.service.BlogCommentService;
import com.demo.ssh.service.BlogPraiseService;
import com.demo.ssh.service.BlogService;
import com.demo.ssh.service.EnshrineBlogService;
import com.demo.ssh.util.LoggerManager;
import com.opensymphony.xwork2.ActionContext;

public class BlogAction extends BaseAction {
	private static final long serialVersionUID = 1L;
	private static final String BLOGDETAIL = "blogDetail";
	@Resource
	private BlogService blogService;
	@Resource
	private BlogCommentService commentService;
	@Resource
	private BlogPraiseService praiseService;
	@Resource
	private EnshrineBlogService enshrineBlogService;
	private Blog blog;
	private int P;// 保存时是否发布
	private Long id;
	private BlogComment comment;
	private int type;

	//新增
	public String saveBlog() {
		// 设置相关信息
		User currentUser = (User) ActionContext.getContext().getSession()
				.get("authUser");
		blog.setUser(currentUser);
		blog.setPublishDate(new Date());
		try {
			blogService.saveBlog(blog);
			LoggerManager.info("用户【" + currentUser.getUserName() + "】新增博客【"
					+ blog.getTitle() + "】成功！");
		} catch (Exception e) {
			e.printStackTrace();
			LoggerManager.info("用户【" + currentUser.getUserName() + "】新增博客失败："
					+ e.getMessage());
			ActionContext.getContext().put("error", e.getMessage());
			return ERROR;
		}
		return SUCCESS;
	}

	//列表
	public String list() {
		List<Blog> blogs = blogService.selectList();
		ActionContext.getContext().put("blogList", blogs);
		LoggerManager.info("加载博客列表成功！");
		return LIST;
	}

	//详情
	public String detail() {
		Blog detail = blogService.blogDetail(id);
		detail.setReadedTimes(detail.getReadedTimes() + 1);
		detail.setPraisedTimes(praiseService.countPraise(id, 1));
		detail.setDisSuggestTimes(praiseService.countPraise(id, 2));
		detail.setEnshrineTimes(enshrineBlogService.countEnshrined(id));
		blogService.updateBlog(detail);
		ActionContext.getContext().put("blog", detail);
		List<BlogComment> comments = commentService.getCommentsByBlogId(id);
		ActionContext.getContext().put("comments", comments);
		return DETAIL;
	}

	//评论
	public String saveCommnets() {
		Blog blog = new Blog();
		blog.setId(id);
		comment.setBlog(blog);
		comment.setPubTime(new Date());
		User currentUser = (User) ActionContext.getContext().getSession()
				.get("authUser");
		comment.setUser(currentUser);
		try {
			commentService.saveComments(comment);
		} catch (Exception e) {
			ActionContext.getContext().put("error", e.getMessage());
			return ERROR;
		}
		return BLOGDETAIL;
	}

	//点赞或反对 tyep  1点赞  2反对
	public String praise() {
		User currentUser = (User) ActionContext.getContext().getSession()
				.get("authUser");
		// 检测当前用户是否已经点赞
		boolean praised = praiseService.hasPraised(id, currentUser.getId(), type);
		Map<String, Object> result = new HashMap<String, Object>();
		if(praised){
			result.put(STATUS, STATUS_ERROR);
		}else{
			BlogPraise blogPraise = new BlogPraise();
			Blog blog = new Blog();
			blog.setId(id);
			blogPraise.setBlog(blog);
			blogPraise.setUser(currentUser);
			blogPraise.setType(type);
			praiseService.savePraise(blogPraise);
			int countPraise = praiseService.countPraise(id, type);
			result.put(STATUS, STATUS_SUCCESS);
			result.put("praisedTimes", countPraise);
		}
		ActionContext.getContext().put(JSONDATA, result);
		return JSON;
	}
	
	//收藏
	public String enshrine(){
		Map<String, Object> result = new HashMap<String, Object>();
		EnshrineBlog enshrineBlog = new EnshrineBlog();
		Blog blog = new Blog();
		blog.setId(id);
		enshrineBlog.setBlog(blog);
		User sessionUser = getSessionUser();
		//验证是否收藏过
		boolean hasEnshrined = enshrineBlogService.hasEnshrined(id, sessionUser.getId());
		if(hasEnshrined){
			result.put(STATUS, STATUS_ERROR);
		}else{
			enshrineBlog.setUser(sessionUser);
			try {
				enshrineBlogService.saveEnshrine(enshrineBlog);
				int enshrined = enshrineBlogService.countEnshrined(id);
				result.put("enshrinedTimes", enshrined);
				result.put(STATUS, STATUS_SUCCESS);
			} catch (Exception e) {
				result.put(STATUS, STATUS_ERROR);
			}
		}
		ActionContext.getContext().put(JSONDATA, result);
		return JSON;
	}

	public String writeBlogPage() {
		return "write";
	}

	public Blog getBlog() {
		return blog;
	}

	public void setBlog(Blog blog) {
		this.blog = blog;
	}

	public int getP() {
		return P;
	}

	public void setP(int p) {
		P = p;
	}

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public BlogComment getComment() {
		return comment;
	}

	public void setComment(BlogComment comment) {
		this.comment = comment;
	}

	public int getType() {
		return type;
	}

	public void setType(int type) {
		this.type = type;
	}

}
