package com.demo.ssh.action;

import java.util.Date;
import java.util.List;

import javax.annotation.Resource;

import com.demo.ssh.base.BaseAction;
import com.demo.ssh.entity.Blog;
import com.demo.ssh.entity.BlogComment;
import com.demo.ssh.entity.User;
import com.demo.ssh.service.BlogCommentService;
import com.demo.ssh.service.BlogService;
import com.demo.ssh.util.LoggerManager;
import com.opensymphony.xwork2.ActionContext;

public class BlogAction extends BaseAction {
	private static final long serialVersionUID = 1L;
	@Resource
	private BlogService blogService;
	@Resource
	private BlogCommentService commentService;
	private Blog blog;
	private int P;// 保存时是否发布
	private Long id;
	private BlogComment comment;

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

	public String list() {
		List<Blog> blogs = blogService.selectList();
		ActionContext.getContext().put("blogList", blogs);
		LoggerManager.info("加载博客列表成功！");
		return LIST;
	}

	public String detail() {
		Blog detail = blogService.blogDetail(id);
		detail.setReadedTimes(detail.getReadedTimes() + 1);
		blogService.updateBlog(detail);
		ActionContext.getContext().put("blog", detail);
		List<BlogComment> comments = commentService.getCommentsByBlogId(id);
		ActionContext.getContext().put("comments", comments);
		return DETAIL;
	}

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
		return "blogDetail";
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

}
