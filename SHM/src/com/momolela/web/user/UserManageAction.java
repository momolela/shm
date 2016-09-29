/**   
 * @Title: RoomManageAction.java  
 * @Package com.momolela.web.user  
 * @Description: TODO  
 * @author momolela   
 * @date 2016-9-18 上午11:30:21  
 * @version V1.0   
 */
package com.momolela.web.user;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.interceptor.ServletRequestAware;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import com.momolela.core.action.BaseAction;
import com.momolela.model.User;
import com.momolela.service.IUserService;
import com.momolela.util.SunDateUtil;

/**
 * 
 * @ClassName: UserManageAction
 * @Description: 用户管理的模块
 * @author: momolela
 * @date 2016-9-18 上午11:30:21
 * 
 */
@Controller("userManageAction")
@Scope("prototype")
public class UserManageAction extends BaseAction implements ServletRequestAware{
	private Map<String, Object> datamap = new HashMap<String, Object>();
	HttpServletRequest request;
	
	@Autowired
	private IUserService userService;

	public Map<String, Object> getDatamap() {
		return datamap;
	}

	public void setDatamap(Map<String, Object> datamap) {
		this.datamap = datamap;
	}
	
	/**
	 * 查询所有的用户
	 * @return String
	 */
	public String findAllUser(){
		List<User> userList = userService.findAllUser();
		Map<String, Object> userMap = null;
		List<Map<String, Object>> userMapList = new ArrayList<Map<String,Object>>();
		for(User user:userList){
			userMap = new HashMap<String, Object>();
			// 查询所有的列
			userMap.put("id", user.getId().toString());
			userMap.put("username", user.getUserName());
			userMap.put("realname", user.getRealName());
			userMap.put("sex", user.getSex());
			userMap.put("idcard", user.getIdCard());
			userMap.put("phonenum", user.getPhoneNum());
			userMap.put("status", user.getStatus());
			userMap.put("email", user.getEmail());
			userMap.put("createtime", SunDateUtil.dateFormatDay(user.getCreateTime()));
			userMap.put("expanded", true);
			userMapList.add(userMap);
		}
		datamap.put("userMapList", userMapList);
		result = "success";
		return AJAX_SUCCESS;
	}
	
	/**
	 * 前台直接添加顾客
	 * @return
	 */
	public String addCustomer(){
		String realname = request.getParameter("realname");
		String sex = request.getParameter("sex");
		String idcard = request.getParameter("idcard");
		String phonenum = request.getParameter("phonenum");
		
		User customer = new User();
		customer.setRealName(realname);
		customer.setSex(sex);
		customer.setIdCard(idcard);
		customer.setPhoneNum(phonenum);
		customer.setPicUrl("images/user/boy.jpg");
		customer.setPassWord("123456");
		customer.setUserName(realname);
		customer.setStatus(1);
		
		// 酒店前台直接注册的是顾客
		userService.addUser1(customer);
		result = "success";
		return AJAX_SUCCESS;
	}

	/**
	 * 检查客房类型名是否已经用过了
	 * @return
	 */
	/*public String checkRoomStyle(){
		String roomStyleNmae = request.getParameter("roomStyleName");
		RoomStyle roomStyle = iRoomService.queryRoomStyleByName(roomStyleNmae);
		if(roomStyle!=null){
			result = "success";
		}
		return AJAX_SUCCESS;
	}*/
	
	public void setServletRequest(HttpServletRequest request) {
		this.request = request;
	}
}
