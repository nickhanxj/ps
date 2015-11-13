package com.demo.ssh.interceptor;

import java.util.Arrays;
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
	private static final String UNAUTH = "unauth";
	private String redirectLoginMsg = "请先登录！";
	private String authUser = "authUser";
	//消费记录action中需要权限验证的method
	private static final String[] checkAuthMethod= {"addRecord","add","editRecord","update"};
	//可以对消费记录进行增加和修改的用户
	private static final String[] authedUser = {"韩晓军","胡丰盛","李洪亮"};
	//可以对消费记录进行删除与结账的用户
	private static final String[] authedUserForDeleteAndCheckout = {"admin"};
	//用户action中不需要权限拦截的method
	private static final String[] userUnauthMethod= {"register","login","ajaxLogin","validateBaseInfo","resetPassword"};

	@Override
	public String intercept(ActionInvocation invocation) throws Exception {
		Action action = (Action) invocation.getAction();
		// 如果是com.demo.ssh.action.UnAuthedResourceAction则直接放行：公共访问区域
		if (action instanceof UnAuthedResourceAction) {
			return invocation.invoke();
		} else if(action instanceof CostRecordAction){
			String method = invocation.getProxy().getMethod();
			Map<String, Object> session = invocation.getInvocationContext().getSession();
			User user = (User) session.get(authUser);
			if("graphic".equals(method) || "timing".equals(method)){
				return invocation.invoke();
			}
			if(user == null){
				invocation.getInvocationContext().getContext().put(Action.ERROR, redirectLoginMsg);
				return Action.LOGIN;
			}
			if("list".equals(method)){
				if(!Arrays.asList(authedUser).contains(user.getTrueName())){
					return UNAUTH;
				}
			}
			if(Arrays.asList(checkAuthMethod).contains(method)){
				if(user == null || !Arrays.asList(authedUser).contains(user.getTrueName())){
					return UNAUTH;
				}
			}
			if("delete".equals(method) || "checkout".equals(method)){
				if(user == null || !Arrays.asList(authedUser).contains(user.getTrueName())){
					invocation.getInvocationContext().getContext().put(BaseAction.JSONDATA, "未授权的操作!");
					return BaseAction.JSON;
				}
				if(Arrays.asList(authedUserForDeleteAndCheckout).contains(user.getUserName())){
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
			if (Arrays.asList(userUnauthMethod).contains(method)) {
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
					invocation.getInvocationContext().getContext().put(Action.ERROR, redirectLoginMsg);
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
				invocation.getInvocationContext().getContext().put(Action.ERROR, redirectLoginMsg);
				return Action.LOGIN;
			}
		}
		return invocation.invoke();
	}

}
