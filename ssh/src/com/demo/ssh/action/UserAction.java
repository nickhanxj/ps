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
	private String pendingUrl;

	public String register() {
		LoggerManager.info("���û�ע��...");
		if (StringUtils.isBlank(user.getUserName())
				|| StringUtils.isBlank(user.getPassword())) {
			addActionError("�û����������벻��Ϊ�գ�");
			LoggerManager.error("���û���" + user.getUserName() + "��ע��ʧ�ܣ���Ϣ��������");
		} else {
			boolean hasExist = userService.hasExist(user.getUserName());
			if (hasExist) {
				addActionError("���û����Ѵ��ڣ���ʹ�������û�����");
				LoggerManager.error("���û���" + user.getUserName()
						+ "��ע��ʧ�ܣ��û����Ѵ��ڣ�");
			} else {
				try {
					user.setRegisterDate(new Date());
					String md5Hex = DigestUtils.md5Hex(user.getPassword());
					user.setPassword(md5Hex);
					userService.addUser(user);
					addActionMessage("ע��ɹ���");
					LoggerManager.info("���û�ע��ɹ�����" + user.getUserName() + "--"
							+ user.getEmail() + "��");
				} catch (Exception e) {
					addActionError(e.getMessage());
					e.printStackTrace();
					LoggerManager.error("���û���" + user.getUserName() + "��ע��ʧ�ܣ�"
							+ e.getMessage());
					return REGISTER;
				}
			}
		}
		return SUCCESS;
	}

	public String login() {
		//��ȡ��½ǰ׼�����ʵ�url
		int index = pendingUrl.indexOf("/");
		pendingUrl = pendingUrl.substring(index+2);
		pendingUrl = pendingUrl.substring(pendingUrl.indexOf("/"));
		if(pendingUrl.indexOf("login") > 0 || pendingUrl.indexOf("logout") > 0){
			pendingUrl = "/view/homepage.html";
		}
		HttpServletRequest request = ServletActionContext.getRequest();
		user.setPassword(DigestUtils.md5Hex(user.getPassword()));
		if (StringUtils.isBlank(user.getUserName())
				|| StringUtils.isBlank(user.getPassword())) {
			addActionError("�û����������벻��Ϊ�գ�");
			LoggerManager.error("�û���" + user.getUserName() + "����¼ʧ�ܣ�"
					+ new Date() + "����ԭ�򣺵�¼��Ϣ��������");
			return LOGIN;
		}
		User authUser = userService.authUser(user);
		if (authUser == null) {
			addActionError("�û������������");
			// user = authUser;
			LoggerManager.error("�û���" + user.getUserName() + "����¼ʧ�ܣ�"
					+ new Date() + "����ԭ���û��������벻ƥ�䡣");
			return LOGIN;
		}
		ActionContext.getContext().getSession().put("authUser", authUser);
		// �����û���Ϣ
		authUser.setLastLoginDate(authUser.getCurLoginDate());
		authUser.setCurLoginDate(new Date());
		authUser.setLastLoginIp(authUser.getCurLoginIp());
		authUser.setCurLoginIp(request.getRemoteAddr());
		userService.updateUser(authUser);
		LoggerManager.info("�û���" + user.getUserName() + "����¼�ɹ�(" + new Date()
				+ ")��");
		return SUCCESS;
	}
	
	public String ajaxLogin(){
		Map<String,Object> result = new HashMap<String,Object>();
		//��ȡ��½ǰ׼�����ʵ�url
		int index = pendingUrl.indexOf("/");
		pendingUrl = pendingUrl.substring(index+2);
		pendingUrl = pendingUrl.substring(pendingUrl.indexOf("/"));
		if(pendingUrl.indexOf("login") > 0 || pendingUrl.indexOf("logout") > 0){
			pendingUrl = "/view/homepage.html";
		}
		HttpServletRequest request = ServletActionContext.getRequest();
		user.setPassword(DigestUtils.md5Hex(user.getPassword()));
		if (StringUtils.isBlank(user.getUserName())
				|| StringUtils.isBlank(user.getPassword())) {
			addActionError("�û����������벻��Ϊ�գ�");
			LoggerManager.error("�û���" + user.getUserName() + "����¼ʧ�ܣ�"
					+ new Date() + "����ԭ�򣺵�¼��Ϣ��������");
			result.put(STATUS, STATUS_ERROR);
			result.put(MESSAGE, "�û����������벻��Ϊ�գ�");
			putContext(JSONDATA, result);
			return JSON;
		}
		User authUser = userService.authUser(user);
		if (authUser == null) {
			addActionError("�û������������");
			// user = authUser;
			LoggerManager.error("�û���" + user.getUserName() + "����¼ʧ�ܣ�"
					+ new Date() + "����ԭ���û��������벻ƥ�䡣");
			result.put(STATUS, STATUS_ERROR);
			result.put(MESSAGE, "�û������������");
			putContext(JSONDATA, result);
			return JSON;
		}
		ActionContext.getContext().getSession().put("authUser", authUser);
		// �����û���Ϣ
		authUser.setLastLoginDate(authUser.getCurLoginDate());
		authUser.setCurLoginDate(new Date());
		authUser.setLastLoginIp(authUser.getCurLoginIp());
		authUser.setCurLoginIp(request.getRemoteAddr());
		userService.updateUser(authUser);
		LoggerManager.info("�û���" + user.getUserName() + "����¼�ɹ�(" + new Date()
				+ ")��");
		result.put(STATUS, STATUS_SUCCESS);
		putContext(JSONDATA, result);
		return JSON;
	}

	public String logout() {
		ActionContext.getContext().getSession().put("authUser", null);
		return LOGIN;
	}

	public String updateUser() {
		User selectedUser = userService.getUserByid(id);
		selectedUser.setUserName(user.getUserName());
		selectedUser.setEmail(user.getEmail());
		selectedUser.setPhoneNumber(user.getPhoneNumber());
		selectedUser.setSex(user.getSex());
		userService.updateUser(selectedUser);
		LoggerManager.info("�û���" + user.getUserName() + "�����¸�����Ϣ�ɹ�("
				+ new Date() + ")��");
		return "reloadInfo";
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

}
