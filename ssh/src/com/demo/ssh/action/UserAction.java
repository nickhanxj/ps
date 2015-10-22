package com.demo.ssh.action;

import java.util.Date;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.apache.commons.codec.digest.DigestUtils;
import org.apache.commons.lang.StringUtils;
import org.apache.struts2.ServletActionContext;

import com.demo.ssh.entity.User;
import com.demo.ssh.service.UserService;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

public class UserAction extends ActionSupport {
	private static final long serialVersionUID = 1L;

	@Resource
	private UserService userService;
	private User user;
	private String id;

	public String register() {
		if (StringUtils.isBlank(user.getUserName())
				|| StringUtils.isBlank(user.getPassword())) {
			addActionError("用户名或者密码不能为空！");
		} else {
			boolean hasExist = userService.hasExist(user.getUserName());
			if (hasExist) {
				addActionError("该用户名已存在，请使用其他用户名！");
			} else {
				try {
					user.setRegisterDate(new Date());
					String md5Hex = DigestUtils.md5Hex(user.getPassword());
					user.setPassword(md5Hex);
					userService.addUser(user);
					addActionMessage("注册成功！");
				} catch (Exception e) {
					addActionError(e.getMessage());
					e.printStackTrace();
					return "failure";
				}
			}
		}
		return "success";
	}

	public String login() {
		HttpServletRequest request = ServletActionContext.getRequest();
		user.setPassword(DigestUtils.md5Hex(user.getPassword()));
		if (StringUtils.isBlank(user.getUserName())
				|| StringUtils.isBlank(user.getPassword())) {
			addActionError("用户名或者密码不能为空！");
			return "authFailed";
		}
		User authUser = userService.authUser(user);
		if (authUser == null) {
			addActionError("用户名或密码错误！");
			// user = authUser;
			return "authFailed";
		}
		ActionContext.getContext().getSession().put("authUser", authUser);
		// 更新用户信息
		authUser.setLastLoginDate(authUser.getCurLoginDate());
		authUser.setCurLoginDate(new Date());
		authUser.setLastLoginIp(authUser.getCurLoginIp());
		authUser.setCurLoginIp(request.getRemoteAddr());
		userService.updateUser(authUser);
		return "loginSuccess";
	}

	public String logout() {
		ActionContext.getContext().getSession().put("authUser", null);
		return "authFailed";
	}

	public String homePage() {
		return null;
	}

	public String personalCenter() {
		User selectedUser = userService.getUserByid(id);
		ActionContext.getContext().put("selectedUser", selectedUser);
		return "personalCenter";
	}

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}
}
