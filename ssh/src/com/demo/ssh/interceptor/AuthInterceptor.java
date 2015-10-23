package com.demo.ssh.interceptor;


import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.ServletActionContext;

import com.demo.ssh.action.UserAction;
import com.demo.ssh.entity.User;
import com.demo.ssh.util.LoggerManager;
import com.opensymphony.xwork2.Action;
import com.opensymphony.xwork2.ActionInvocation;
import com.opensymphony.xwork2.interceptor.AbstractInterceptor;

/**
 * 权限拦截器
 * @author john
 *
 */
public class AuthInterceptor extends AbstractInterceptor{
	private static final long serialVersionUID = 1L;
	private String authUser = "authUser";
	
	@Override
	public String intercept(ActionInvocation invocation) throws Exception {
		// TODO Auto-generated method stub
		Action action = (Action) invocation.getAction();
		if(action instanceof UserAction){//如果是userAction则直接放行
			String method = invocation.getProxy().getMethod();
			if("register".equals(method) || "login".equals(method)){
				return invocation.invoke();
			}else{
				Map<String, Object> session = invocation.getInvocationContext().getSession();
				User user = (User) session.get(authUser);
				if(user == null){
					HttpServletRequest request = (HttpServletRequest) invocation.getInvocationContext().get(ServletActionContext.HTTP_REQUEST);
					LoggerManager.warn("警告：["+request.getRemoteAddr()+"] 在未登录状态尝试访问资源：["+invocation.getProxy().getActionName()+":"+invocation.getProxy().getMethod()+"] >>> 失败！");
					return Action.LOGIN;
				}
			}
		}else{
			Map<String, Object> session = invocation.getInvocationContext().getSession();
			User user = (User) session.get(authUser);
			if(user == null){
				HttpServletRequest request = (HttpServletRequest) invocation.getInvocationContext().get(ServletActionContext.HTTP_REQUEST);
				LoggerManager.warn("警告：["+request.getRemoteAddr()+"] 在未登录状态尝试访问资源：["+invocation.getProxy().getActionName()+":"+invocation.getProxy().getMethod()+"] >>> 失败！");
				return Action.LOGIN;
			}
		}
		return invocation.invoke();
	}

}
