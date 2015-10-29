package com.demo.ssh.action;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.apache.struts2.ServletActionContext;

import com.demo.ssh.base.BaseAction;
import com.demo.ssh.entity.Blog;
import com.demo.ssh.entity.BlogComment;
import com.demo.ssh.entity.BlogPraise;
import com.demo.ssh.entity.User;
import com.demo.ssh.service.BlogCommentService;
import com.demo.ssh.service.BlogPraiseService;
import com.demo.ssh.service.BlogService;
import com.nick.page.pageutil.Page;
import com.opensymphony.xwork2.ActionContext;

public class UnAuthedResourceAction extends BaseAction {
	private static final long serialVersionUID = 1L;
	@Resource
	private BlogService blogService;
	@Resource
	private BlogCommentService commentService;
	@Resource
	private BlogPraiseService praiseService;
	private Long blogId;
	private int type;
	private String authorName;
	private int currentPage = 1;
	private int pageSize = 3;

	// 博客 详情
	public String blogdetail() {
		Blog detail = blogService.blogDetail(blogId);
		detail.setReadedTimes(detail.getReadedTimes() + 1);
		blogService.updateBlog(detail);
		ActionContext.getContext().put("blog", detail);
		List<BlogComment> comments = commentService.getCommentsByBlogId(blogId);
		ActionContext.getContext().put("comments", comments);
		return DETAIL;
	}

	// 点赞或反对 tyep 1点赞 2反对
	public String praise() {
		Map<String, Object> result = new HashMap<String, Object>();
		User currentUser = (User) ActionContext.getContext().getSession()
				.get("authUser");
		// 未登录用户点赞
		if (currentUser == null) {
			String remoteAddr = ServletActionContext.getRequest()
					.getRemoteAddr();
			//判断匿名用户是否点赞： 根据ip判断
			boolean anonymousPraised = praiseService.anonymousPraised(blogId, remoteAddr, type);
			if(anonymousPraised){
				if (type == 1) {
					result.put(MESSAGE,
							"Can not repraise! You have praised this blog!");
				} else if (type == 2) {
					result.put(MESSAGE,
							"Can not Dissuggest twice! You have dissuggested this blog!");
				}
				result.put(STATUS, STATUS_ERROR);
			}else{
				int countPraise = saveComment(null,remoteAddr);
				result.put(STATUS, STATUS_SUCCESS);
				result.put("praisedTimes", countPraise);
			}
			ActionContext.getContext().put(JSONDATA, result);
			return JSON;
		}
		// 判断博客是否是当前用户的
		if (currentUser.getUserName().equals(authorName)) {
			if (type == 1) {
				result.put(MESSAGE, "You can not praise your own blog!");
			} else if (type == 2) {
				result.put(MESSAGE, "You can not dissuggested your own blog!");
			}
			result.put(STATUS, STATUS_ERROR);
		} else {
			// 检测当前用户是否已经点赞
			boolean praised = praiseService.hasPraised(blogId, currentUser.getId(),
					type);
			if (praised) {
				if (type == 1) {
					result.put(MESSAGE,
							"Can not repraise! You have praised this blog!");
				} else if (type == 2) {
					result.put(MESSAGE,
							"Can not Dissuggest twice! You have dissuggested this blog!");
				}
				result.put(STATUS, STATUS_ERROR);
			} else {
				int countPraise = saveComment(currentUser,null);
				result.put(STATUS, STATUS_SUCCESS);
				result.put("praisedTimes", countPraise);
			}
		}
		ActionContext.getContext().put(JSONDATA, result);
		return JSON;
	}

	private int saveComment(User currentUser,String anonymousIp) {
		BlogPraise blogPraise = new BlogPraise();
		Blog blog = blogService.blogDetail(blogId);
		blogPraise.setBlog(blog);
		blogPraise.setUser(currentUser);
		blogPraise.setType(type);
		blogPraise.setAnonymousIp(anonymousIp);
		praiseService.savePraise(blogPraise);
		int countPraise = praiseService.countPraise(blogId, type);
		if (type == 1) {
			blog.setPraisedTimes(countPraise);
		} else {
			blog.setDisSuggestTimes(countPraise);
		}
		blogService.updateBlog(blog);
		return countPraise;
	}

	public String homepage() {
		Page<Blog> blogs = blogService.selectListByPage(currentPage, pageSize);
		Page<Blog> hotBlog = blogService.selectHotBlogsByPage(currentPage, pageSize);
		ActionContext.getContext().put("blogList", blogs.getRows());
		ActionContext.getContext().put("hotList", hotBlog.getRows());
		return "homepage";
	}
	
	public String login() {
		return LOGIN;
	}

	public String register() {
		return REGISTER;
	}

	public Long getBlogId() {
		return blogId;
	}

	public void setBlogId(Long blogId) {
		this.blogId = blogId;
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

	public int getCurrentPage() {
		return currentPage;
	}

	public void setCurrentPage(int currentPage) {
		this.currentPage = currentPage;
	}

	public int getPageSize() {
		return pageSize;
	}

	public void setPageSize(int pageSize) {
		this.pageSize = pageSize;
	}

}
