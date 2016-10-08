/**   
 * @Title: RoomManageAction.java  
 * @Package com.momolela.web.user  
 * @Description: TODO  
 * @author momolela   
 * @date 2016-9-18 上午11:30:21  
 * @version V1.0   
 */
package com.momolela.web.user;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.interceptor.ServletRequestAware;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import com.momolela.core.action.BaseAction;
import com.momolela.model.Service;
import com.momolela.service.IServiceService;

/**
 * 
 * @ClassName: ServiceManageAction
 * @Description: 消费管理的模块
 * @author: momolela
 * @date 2016-9-18 上午11:30:21
 * 
 */
@Controller("serviceManageAction")
@Scope("prototype")
public class ServiceManageAction extends BaseAction implements ServletRequestAware{
	private Map<String, Object> datamap = new HashMap<String, Object>();
	HttpServletRequest request;
	
	@Autowired
	private IServiceService serviceService;

	public Map<String, Object> getDatamap() {
		return datamap;
	}

	public void setDatamap(Map<String, Object> datamap) {
		this.datamap = datamap;
	}
	
	public String queryAllServiceStyle(){
		List<Service> serviceList = serviceService.queryAllService();
		datamap.put("serviceList", serviceList);
		result = "success";
		return AJAX_SUCCESS;
	}
	

	public void setServletRequest(HttpServletRequest request) {
		this.request = request;
	}
}
