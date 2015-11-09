package com.demo.ssh.interceptor;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.ServletActionContext;

import com.demo.ssh.action.CostRecordAction;
import com.demo.ssh.action.UnAuthedResourceAction;
import com.demo.ssh.action.UserAction;
import com.demo.ssh.base.BaseAction;
import com.demo.ssh.entity.User;
import com.demo.ssh.util.LoggerManager;
import com.opensymphony.xwork2.Action;
import com.opensymphony.xwork2.ActionInvocation;
import com.opensymphony.xwork2.interceptor.AbstractInterceptor;

/**
 * 权限拦截器
 * 
 * @author john
 * 
 */
@SuppressWarnings("all")
public class AuthInterceptor extends AbstractInterceptor {
	private static final long serialVersionUID = 1L;
	private String authUser = "authUser";

	@Override
	public String intercept(ActionInvocation invocation) throws Exception {
		Action action = (Action) invocation.getAction();
		// 如果是com.demo.ssh.action.UnAuthedResourceAction则直接放行：公共访问区域
		if (action instanceof UnAuthedResourceAction) {
			return invocation.invoke();
		} else if(action instanceof CostRecordAction){
			String method = invocation.getProxy().getMethod();
			if("delete".equals(method) || "checkout".equals(method)){
				Map<String, Object> session = invocation.getInvocationContext()
						.getSession();
				User user = (User) session.get(authUser);
				if(user == null){
					invocation.getInvocationContext().getContext().put(BaseAction.JSONDATA, "未授权的操作!");
					return BaseAction.JSON;
				}
				if("admin".equals(user.getUserName())){
					return invocation.invoke();
				}else{
					invocation.getInvocationContext().getContext().put(BaseAction.JSONDATA, "未授权的操作!");
				}
				return BaseAction.JSON;
			}else{
				return invocation.invoke();
			}
		}else if (action instanceof UserAction) {
			String method = invocation.getProxy().getMethod();
			if ("register".equals(method) || "login".equals(method) || "ajaxLogin".equals(method)) {// 如果是登录或注册则直接放行
				return invocation.invoke();
			} else {
				Map<String, Object> session = invocation.getInvocationContext()
						.getSession();
				User user = (User) session.get(authUser);
				if (user == null) {
					HttpServletRequest request = (HttpServletRequest) invocation
							.getInvocationContext().get(
									ServletActionContext.HTTP_REQUEST);
					LoggerManager.warn("警告：[" + request.getRemoteAddr()
							+ "] 在未登录状态尝试访问资源：["
							+ invocation.getProxy().getActionName() + ":"
							+ invocation.getProxy().getMethod() + "] >>> 失败！");
					invocation.getInvocationContext().getContext().put(Action.ERROR, "请登录!");
					return Action.LOGIN;
				}
			}
		} else {
			Map<String, Object> session = invocation.getInvocationContext()
					.getSession();
			User user = (User) session.get(authUser);
			if (user == null) {
				HttpServletRequest request = (HttpServletRequest) invocation
						.getInvocationContext().get(
								ServletActionContext.HTTP_REQUEST);
				LoggerManager.warn("警告：[" + request.getRemoteAddr()
						+ "] 在未登录状态尝试访问资源：["
						+ invocation.getProxy().getActionName() + ":"
						+ invocation.getProxy().getMethod() + "] >>> 失败！");
				invocation.getInvocationContext().getContext().put(Action.ERROR, "请登录!");
				return Action.LOGIN;
			}
		}
		return invocation.invoke();
	}

}
