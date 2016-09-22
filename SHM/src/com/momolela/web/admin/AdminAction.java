package com.momolela.web.admin;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.struts2.interceptor.ServletRequestAware;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import com.momolela.core.action.BaseAction;
import com.momolela.model.Admin;
import com.momolela.service.IAdminService;
import com.momolela.util.TzConstanst;
import com.momolela.util.TzStringUtils;
import com.opensymphony.xwork2.ActionContext;

/**
 * 
 * @ClassName: AdminAction
 * @Description: 
 * @author: momolela
 * @date 2016-6-8 下午2:31:39
 * 
 */
@Controller("adminAction")
@Scope("prototype")
public class AdminAction extends BaseAction implements ServletRequestAware {

	private HttpServletRequest request;
	private Map<String, Object> datamap = new HashMap<String, Object>();
	
	@Autowired
	private IAdminService AdminService;

	public Map<String, Object> getDatamap() {
		return datamap;
	}

	public void setDatamap(Map<String, Object> datamap) {
		this.datamap = datamap;
	}
	
	/**
	 * 管理员登录
	 * @return
	 */
	public String login(){
		String account = request.getParameter("account");
		String password = request.getParameter("password");
		String checkcode = request.getParameter("checkcode");
		String securityCode = request.getSession().getAttribute("securityCode").toString();
		if (TzStringUtils.isNotEmpty(account) && TzStringUtils.isNotEmpty(password)) {
			Admin a = AdminService.findAdmin(account, password);
			if (TzStringUtils.isNotEmpty(securityCode) && checkcode.equals(securityCode)) {
				if (a != null) {
					ActionContext.getContext().getSession().put(TzConstanst.SESSION_ADMINKEY, a);
					result = "success";
				} else {
					result = "fail";
					message = "用户名或者密码错误";
				}
			} else {
				result = "fail";
				message = "验证码填写错误";
			}
		}
		return AJAX_SUCCESS;
	}
	
	/**
	 * 管理员注销
	 * @return
	 */
	public String logout(){
		// request.getSession(true)：若存在会话则返回该会话，否则新建一个会话。
		// request.getSession(false)：若存在会话则返回该会话，否则返回NULL
		HttpSession session = request.getSession(false);
		if(session!=null){
			session.invalidate();	// 注销整个session，但是如果前后台共用同一个session，则不能直接注销。
			return "adminlogin";
		}else{
			return null;
		}
	}
	
	public void setServletRequest(HttpServletRequest request) {
		this.request = request;
	}
	
}
