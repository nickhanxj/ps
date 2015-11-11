package com.demo.ssh.action;

import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.apache.commons.codec.digest.DigestUtils;
import org.apache.commons.lang.StringUtils;
import org.apache.struts2.ServletActionContext;

import com.demo.ssh.base.BaseAction;
import com.demo.ssh.entity.User;
import com.demo.ssh.service.UserService;
import com.demo.ssh.util.LoggerManager;
import com.opensymphony.xwork2.ActionContext;

public class UserAction extends BaseAction {
	private static final long serialVersionUID = 1L;

	@Resource
	private UserService userService;
	private User user;
	private String id;
	private String pendingUrl = "/view/homepage.html";
	private String email;
	private String password;
	// 修改密码时所需参数
	private String phone;
	private String trueName;
	private String originPassword;

	public String register() {
		LoggerManager.info("新用户注册...");
		if (StringUtils.isBlank(user.getUserName())
				|| StringUtils.isBlank(user.getPassword())) {
			addActionError("用户名或者密码不能为空！");
			LoggerManager.error("新用户【" + user.getUserName() + "】注册失败：信息不完整！");
		} else {
			boolean hasExist = userService.hasExist(user.getUserName());
			boolean trueNameHasExist = userService.trueNameHasExist(user
					.getTrueName());
			if (hasExist) {
				addActionError("该用户名已存在，请使用其他用户名！");
				LoggerManager.error("新用户【" + user.getUserName()
						+ "】注册失败：用户名已存在！");
				return REGISTER;
			} else if (trueNameHasExist) {
				addActionError("该真实姓名已经注册过！");
				LoggerManager.error("【" + user.getTrueName()
						+ "】注册失败：该真实姓名已注册过！");
				return REGISTER;
			} else {
				try {
					user.setRegisterDate(new Date());
					String md5Hex = DigestUtils.md5Hex(user.getPassword());
					user.setPassword(md5Hex);
					userService.addUser(user);
					addActionMessage("注册成功！");
					LoggerManager.info("新用户注册成功：【" + user.getUserName() + "--"
							+ user.getEmail() + "】");
					User queryedUser = userService.getUserByName(user
							.getUserName());
					ActionContext.getContext().getSession()
							.put("authUser", queryedUser);
				} catch (Exception e) {
					addActionError(e.getMessage());
					e.printStackTrace();
					LoggerManager.error("新用户【" + user.getUserName() + "】注册失败："
							+ e.getMessage());
					return REGISTER;
				}
			}
		}
		return SUCCESS;
	}

	public String login() {
		// 获取登陆前准备访问的url
		if (StringUtils.isNotBlank(pendingUrl)) {
			int index = pendingUrl.indexOf("/");
			LoggerManager.info("pendingUrl : " + pendingUrl);
			pendingUrl = pendingUrl.substring(index + 2);
			pendingUrl = pendingUrl.substring(pendingUrl.indexOf("/"));
			if (pendingUrl.indexOf("login") > 0
					|| pendingUrl.indexOf("logout") > 0) {
				pendingUrl = "/view/homepage.html";
			}
		}
		HttpServletRequest request = ServletActionContext.getRequest();
		user = new User();
		user.setPassword(DigestUtils.md5Hex(password));
		user.setEmail(email);
		if (StringUtils.isBlank(user.getEmail())
				|| StringUtils.isBlank(user.getPassword())) {
			addActionError("帐号或者密码不能为空！");
			LoggerManager.error("用户【" + user.getEmail() + "】登录失败（" + new Date()
					+ "）。原因：登录信息不完整。");
			return LOGIN;
		}
		User authUser = userService.authUser(user);
		if (authUser == null) {
			addActionError("帐号或密码错误！");
			// user = authUser;
			LoggerManager.error("用户【" + user.getEmail() + "】登录失败（" + new Date()
					+ "）。原因：帐号与密码不匹配。");
			return LOGIN;
		}
		ActionContext.getContext().getSession().put("authUser", authUser);
		// 更新用户信息
		authUser.setLastLoginDate(authUser.getCurLoginDate());
		authUser.setCurLoginDate(new Date());
		authUser.setLastLoginIp(authUser.getCurLoginIp());
		authUser.setCurLoginIp(request.getRemoteAddr());
		userService.updateUser(authUser);
		LoggerManager.info("用户【" + user.getEmail() + "】登录成功(" + new Date()
				+ ")！");
		return SUCCESS;
	}

	public String ajaxLogin() {
		Map<String, Object> result = new HashMap<String, Object>();
		// 获取登陆前准备访问的url
		int index = pendingUrl.indexOf("/");
		pendingUrl = pendingUrl.substring(index + 2);
		pendingUrl = pendingUrl.substring(pendingUrl.indexOf("/"));
		if (pendingUrl.indexOf("login") > 0 || pendingUrl.indexOf("logout") > 0) {
			pendingUrl = "/view/homepage.html";
		}
		HttpServletRequest request = ServletActionContext.getRequest();
		user.setPassword(DigestUtils.md5Hex(user.getPassword()));
		if (StringUtils.isBlank(user.getEmail())
				|| StringUtils.isBlank(user.getPassword())) {
			addActionError("用户名或者密码不能为空！");
			LoggerManager.error("用户【" + user.getEmail() + "】登录失败（" + new Date()
					+ "）。原因：登录信息不完整。");
			result.put(STATUS, STATUS_ERROR);
			result.put(MESSAGE, "用户名或者密码不能为空！");
			putContext(JSONDATA, result);
			return JSON;
		}
		User authUser = userService.authUser(user);
		if (authUser == null) {
			addActionError("用户名或密码错误！");
			// user = authUser;
			LoggerManager.error("用户【" + user.getEmail() + "】登录失败（" + new Date()
					+ "）。原因：用户名与密码不匹配。");
			result.put(STATUS, STATUS_ERROR);
			result.put(MESSAGE, "用户名或密码错误！");
			putContext(JSONDATA, result);
			return JSON;
		}
		ActionContext.getContext().getSession().put("authUser", authUser);
		// 更新用户信息
		authUser.setLastLoginDate(authUser.getCurLoginDate());
		authUser.setCurLoginDate(new Date());
		authUser.setLastLoginIp(authUser.getCurLoginIp());
		authUser.setCurLoginIp(request.getRemoteAddr());
		userService.updateUser(authUser);
		LoggerManager.info("用户【" + user.getEmail() + "】登录成功(" + new Date()
				+ ")！");
		result.put(STATUS, STATUS_SUCCESS);
		putContext(JSONDATA, result);
		return JSON;
	}

	public String logout() {
		ActionContext.getContext().getSession().put("authUser", null);
		return "homepage";
	}

	public String updateUser() {
		User selectedUser = userService.getUserByid(id);
		selectedUser.setUserName(user.getUserName());
		selectedUser.setEmail(user.getEmail());
		selectedUser.setPhoneNumber(user.getPhoneNumber());
		selectedUser.setSex(user.getSex());
		selectedUser.setTrueName(user.getTrueName());
		userService.updateUser(selectedUser);
		LoggerManager.info("用户【" + user.getUserName() + "】更新个人信息成功("
				+ new Date() + ")！");
		return "reloadInfo";
	}

	// 验证修改密码时的基础信息
	public String validateBaseInfo() {
		boolean validateResult = userService.validateBaseInfo(email, phone,
				trueName);
		if (validateResult) {
			putJson(STATUS_SUCCESS);
		} else {
			putJson(STATUS_ERROR);
		}
		return JSON;
	}

	// 找回密码
	public String resetPassword() {
		User queryedUser = userService.getUserByEmail(email);
		String newPassword = DigestUtils.md5Hex(password);
		queryedUser.setPassword(newPassword);
		try {
			userService.updateUser(queryedUser);
			putJson(STATUS_SUCCESS);
		} catch (Exception e) {
			e.printStackTrace();
			putJson(STATUS_ERROR);
		}
		return JSON;
	}

	public String validateOriginPasswd() {
		User sessionUser = getSessionUser();
		String originPasswordMd5 = DigestUtils.md5Hex(originPassword);
		if (originPasswordMd5.equals(sessionUser.getPassword())) {
			putJson(STATUS_SUCCESS);
		}else{
			putJson(STATUS_ERROR);
		}
		return JSON;
	}
	
	//登录后修改密码
	public String resetPwd(){
		User sessionUser = getSessionUser();
		String newPassword = DigestUtils.md5Hex(password);
		sessionUser.setPassword(newPassword);
		try {
			userService.updateUser(sessionUser);
			putJson(STATUS_SUCCESS);
			ActionContext.getContext().getSession().put("authUser", null);
		} catch (Exception e) {
			e.printStackTrace();
			putJson(STATUS_ERROR);
		}
		return JSON;
	}

	public String resetPasswordPage() {
		return "resetPassword";
	}

	public String forgetPassword() {
		return "forgetPassword";
	}

	public String editProfile() {
		User selectedUser = userService.getUserByid(id);
		ActionContext.getContext().put("selectedUser", selectedUser);
		return "editProfile";
	}

	public String homePage() {
		return null;
	}

	public String personalCenter() {
		User auser = (User) ActionContext.getContext().getSession()
				.get("authUser");
		User selectedUser = userService.getUserByid(auser.getId() + "");
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

	public String getPendingUrl() {
		return pendingUrl;
	}

	public void setPendingUrl(String pendingUrl) {
		this.pendingUrl = pendingUrl;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getTrueName() {
		return trueName;
	}

	public void setTrueName(String trueName) {
		this.trueName = trueName;
	}

	public String getOriginPassword() {
		return originPassword;
	}

	public void setOriginPassword(String originPassword) {
		this.originPassword = originPassword;
	}

}
