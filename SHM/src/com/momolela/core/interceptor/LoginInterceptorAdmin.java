package com.momolela.core.interceptor;

import org.springframework.stereotype.Component;

import com.momolela.model.Admin;
import com.momolela.util.TzConstanst;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionInvocation;
import com.opensymphony.xwork2.interceptor.AbstractInterceptor;

/**
 * 
 * @ClassName: LoginInterceptor
 * @Description: 登录拦截器
 * @author: momolela
 * @date 2016-5-12 下午5:04:31
 * 
 */
@Component("loginInterceptorAdmin")
public class LoginInterceptorAdmin extends AbstractInterceptor{
	private static final long serialVersionUID = 1L;
	@Override
	public String intercept(ActionInvocation invocation) throws Exception {
		//System.out.println("您当前执行的Action是:"+invocation.getAction().getClass().getName());
		//System.out.println("您当前执行的方法是"+invocation.getProxy().getMethod());
		//获取Action的上下文
		
		// String requestType = ServletActionContext.getRequest().getHeader("X-Requested-With");
		ActionContext context = invocation.getInvocationContext();
		//获取Session里面的值
		Admin admin = (Admin) context.getSession().get(TzConstanst.SESSION_ADMINKEY);
		if(admin!=null){
			return invocation.invoke();
		}else{
			return "toIndex";
		}
	}
}
