package com.demo.ssh.action;

import java.util.Date;
import java.util.List;

import javax.annotation.Resource;

import com.demo.ssh.base.BaseAction;
import com.demo.ssh.entity.Blog;
import com.demo.ssh.entity.User;
import com.demo.ssh.service.BlogService;
import com.demo.ssh.util.LoggerManager;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.util.logging.LoggerUtils;

public class BlogAction extends BaseAction {
	private static final long serialVersionUID = 1L;
	@Resource
	private BlogService blogService;
	private Blog blog;
	private int P;// ����ʱ�Ƿ񷢲�
	private Long id;

	public String saveBlog() {
		// ���������Ϣ
		User currentUser = (User) ActionContext.getContext().getSession()
				.get("authUser");
		blog.setUser(currentUser);
		blog.setPublishDate(new Date());
		try {
			blogService.saveBlog(blog);
			LoggerManager.info("�û���" + currentUser.getUserName() + "���������͡�"
					+ blog.getTitle() + "���ɹ���");
		} catch (Exception e) {
			e.printStackTrace();
			LoggerManager.info("�û���" + currentUser.getUserName() + "����������ʧ�ܣ�"
					+ e.getMessage());
			return ERROR;
		}
		return SUCCESS;
	}

	public String list() {
		List<Blog> blogs = blogService.selectList();
		ActionContext.getContext().put("blogList", blogs);
		LoggerManager.info("���ز����б�ɹ���");
		return LIST;
	}

	public String detail() {
		Blog detail = blogService.blogDetail(id);
		ActionContext.getContext().put("blog", detail);
		return DETAIL;
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

}
