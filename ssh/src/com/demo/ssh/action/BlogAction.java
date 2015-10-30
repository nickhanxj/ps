package com.demo.ssh.action;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import com.demo.ssh.base.BaseAction;
import com.demo.ssh.entity.Blog;
import com.demo.ssh.entity.BlogComment;
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
	private String authorName;
	private String message;

	// 新增
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
		ActionContext.getContext().put(MESSAGE,
				"Create blog [" + blog.getTitle() + "] success!");
		return SUCCESS;
	}

	// 更新
	public String updateBlog() {
		Blog persistenceBlog = blogService.blogDetail(blog.getId());
		persistenceBlog.setTitle(blog.getTitle());
		persistenceBlog.setContent(blog.getContent());
		persistenceBlog.setCategory(blog.getCategory());
		persistenceBlog.setAuth(blog.getAuth());
		persistenceBlog.setLastEditDate(new Date());
		try {
			blogService.updateBlog(persistenceBlog);
		} catch (Exception e) {
			// TODO: handle exception
			ActionContext.getContext().put("error", e.getMessage());
			return ERROR;
		}
		message = "Edit blog [" + blog.getTitle() + "] success!</span><a style='color: gray; margin-left:20px;' title='quick view' href='/view/blogdetail.html?blogId="+blog.getId()+" '><span class='glyphicon glyphicon-list-alt'></a>";
		return SUCCESS;
	}

	// 列表
	public String list() {
		User sessionUser = getSessionUser();
		List<Blog> blogs = blogService.selectMyBlogs(sessionUser.getId());
		ActionContext.getContext().put("blogList", blogs);
		ActionContext.getContext().put(MESSAGE,message);
		LoggerManager.info("加载博客列表成功！");
		return LIST;
	}

	// 评论
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

	// 收藏
	public String enshrine() {
		Map<String, Object> result = new HashMap<String, Object>();
		EnshrineBlog enshrineBlog = new EnshrineBlog();
		Blog blog = blogService.blogDetail(id);
		enshrineBlog.setBlog(blog);
		User sessionUser = getSessionUser();
		// 判断博客是否是当前用户的
		if (sessionUser.getUserName().equals(authorName)) {
			result.put(MESSAGE, "You can not enshrine your own blog!");
			result.put(STATUS, STATUS_ERROR);
		} else {
			// 验证是否收藏过
			boolean hasEnshrined = enshrineBlogService.hasEnshrined(id,
					sessionUser.getId());
			if (hasEnshrined) {
				result.put(STATUS, STATUS_ERROR);
				result.put(MESSAGE, "You have enshrined this blog!");
			} else {
				enshrineBlog.setUser(sessionUser);
				try {
					enshrineBlogService.saveEnshrine(enshrineBlog);
					int enshrined = enshrineBlogService.countEnshrined(id);
					blog.setEnshrineTimes(enshrined);
					blogService.updateBlog(blog);
					result.put("enshrinedTimes", enshrined);
					result.put(STATUS, STATUS_SUCCESS);
				} catch (Exception e) {
					result.put(STATUS, STATUS_ERROR);
				}
			}
		}
		ActionContext.getContext().put(JSONDATA, result);
		return JSON;
	}

	public String edit() {
		Blog blogDetail = blogService.blogDetail(id);
		ActionContext.getContext().put("blog", blogDetail);
		return "edit";
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

	public String getAuthorName() {
		return authorName;
	}

	public void setAuthorName(String authorName) {
		this.authorName = authorName;
	}

	public String getMessage() {
		return message;
	}

	public void setMessage(String message) {
		this.message = message;
	}

}
