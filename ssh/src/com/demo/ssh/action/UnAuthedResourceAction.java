package com.demo.ssh.action;

import java.util.List;

import javax.annotation.Resource;

import com.demo.ssh.base.BaseAction;
import com.demo.ssh.entity.Blog;
import com.demo.ssh.service.BlogService;
import com.opensymphony.xwork2.ActionContext;

public class UnAuthedResourceAction extends BaseAction {
	private static final long serialVersionUID = 1L;
	@Resource
	private BlogService blogService;

	// 返回json 供首页获取列表
	public String listAll() {
		List<Blog> blogs = blogService.selectList();
		ActionContext.getContext().put(JSONDATA, blogs);
		return JSON;
	}
	
	public String homepage(){
		return "homepage";
	}
	
	public String login(){
		return LOGIN;
	}
	
	public String register(){
		return REGISTER;
	}
}
