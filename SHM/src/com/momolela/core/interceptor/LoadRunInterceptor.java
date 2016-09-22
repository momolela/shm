package com.momolela.core.interceptor;

import java.util.HashMap;
import java.util.Map;

import org.springframework.stereotype.Component;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionInvocation;
import com.opensymphony.xwork2.interceptor.AbstractInterceptor;

/**
 * 
 * @ClassName: LoadRunInterceptor
 * @Description: 加载运行环境的拦截器
 * @author: momolela
 * @date 2016-6-13 下午2:46:04
 * 
 */
@Component("loadRunInterceptor")
public class LoadRunInterceptor extends AbstractInterceptor{
	private static final long serialVersionUID = 1L;
	@Override
	public String intercept(ActionInvocation invocation) throws Exception {
		
		Map<String, Object> runtimeMap = new HashMap<String, Object>();
		
		String vmName = System.getProperty("java.vm.name");
		String runtimeV = System.getProperty("java.runtime.version");
		String vmVendor = System.getProperty("java.vm.vendor");
		String os = System.getProperty("os.name")+" - "+System.getProperty("os.arch")+" - "+System.getProperty("os.version");
		String timeZone = System.getProperty("user.timezone");
		String language = System.getProperty("user.language");
		
		runtimeMap.put("vmName", vmName);
		runtimeMap.put("runtimeV", runtimeV);
		runtimeMap.put("vmVendor", vmVendor);
		runtimeMap.put("os", os);
		runtimeMap.put("timeZone", timeZone);
		runtimeMap.put("language", language);
		
		ActionContext.getContext().getSession().put("runtimeMap", runtimeMap);
		
		return invocation.invoke();
	}
}
