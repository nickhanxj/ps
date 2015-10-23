package com.demo.ssh.action;

import java.util.Date;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.apache.commons.codec.digest.DigestUtils;
import org.apache.commons.lang.StringUtils;
import org.apache.struts2.ServletActionContext;

import com.demo.ssh.entity.User;
import com.demo.ssh.service.UserService;
import com.demo.ssh.util.LoggerManager;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

public class UserAction extends ActionSupport {
	private static final long serialVersionUID = 1L;

	@Resource
	private UserService userService;
	private User user;
	private String id;

	public String register() {
		LoggerManager.info("���û�ע��...");
		if (StringUtils.isBlank(user.getUserName())
				|| StringUtils.isBlank(user.getPassword())) {
			addActionError("�û����������벻��Ϊ�գ�");
		} else {
			boolean hasExist = userService.hasExist(user.getUserName());
			if (hasExist) {
				addActionError("���û����Ѵ��ڣ���ʹ�������û�����");
			} else {
				try {
					user.setRegisterDate(new Date());
					String md5Hex = DigestUtils.md5Hex(user.getPassword());
					user.setPassword(md5Hex);
					userService.addUser(user);
					addActionMessage("ע��ɹ���");
					LoggerManager.info("���û�ע��ɹ�����"+user.getUserName()+"--"+user.getEmail()+"��");
				} catch (Exception e) {
					addActionError(e.getMessage());
					e.printStackTrace();
					LoggerManager.error("���û���"+user.getUserName()+"��ע��ʧ�ܣ�"+e.getMessage());
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
			addActionError("�û����������벻��Ϊ�գ�");
			LoggerManager.error("�û���"+user.getUserName()+"����¼ʧ�ܣ�"+new Date()+"����ԭ�򣺵�¼��Ϣ��������");
			return "authFailed";
		}
		User authUser = userService.authUser(user);
		if (authUser == null) {
			addActionError("�û������������");
			// user = authUser;
			LoggerManager.error("�û���"+user.getUserName()+"����¼ʧ�ܣ�"+new Date()+"����ԭ���û��������벻ƥ�䡣");
			return "authFailed";
		}
		ActionContext.getContext().getSession().put("authUser", authUser);
		// �����û���Ϣ
		authUser.setLastLoginDate(authUser.getCurLoginDate());
		authUser.setCurLoginDate(new Date());
		authUser.setLastLoginIp(authUser.getCurLoginIp());
		authUser.setCurLoginIp(request.getRemoteAddr());
		userService.updateUser(authUser);
		LoggerManager.info("�û���"+user.getUserName()+"����¼�ɹ�("+new Date()+")��");
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
