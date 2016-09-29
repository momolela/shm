package com.momolela.web.admin;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.interceptor.ServletRequestAware;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import com.momolela.core.action.BaseAction;
import com.momolela.model.Order;
import com.momolela.model.ServiceOrder;
import com.momolela.model.User;
import com.momolela.service.IOrderService;
import com.momolela.service.IServiceOrderService;
import com.momolela.service.IUserService;

@Controller("checkOutAction")
@Scope("prototype")
public class CheckOutAction extends BaseAction implements ServletRequestAware {
	private Map<String, Object> datamap = new HashMap<String, Object>();
	private HttpServletRequest request;
	
	@Autowired
	private IUserService userService;
	
	@Autowired
	private IServiceOrderService serviceOrderService;
	
	@Autowired
	private IOrderService orderService;
	
	public Map<String, Object> getDatamap() {
		return datamap;
	}

	public void setDatamap(Map<String, Object> datamap) {
		this.datamap = datamap;
	}

	/**
	 * 查询用户所有的消费
	 * @return
	 */
	public String queryAllCheckOutInfo(){
		// 先查询所有的顾客信息
		List<User> userList = userService.findAllUser();
		datamap.put("userList", userList);
		Map<String, List<ServiceOrder>> serviceOrderListMap = new HashMap<String, List<ServiceOrder>>();
		Map<String, List<Order>> orderListMap = new HashMap<String, List<Order>>();
		for(User user:userList){
			// 获取到用户的id，然后通过id去查询顾客的消费（服务费用和住房费用）
			List<ServiceOrder> serviceOrderList = serviceOrderService.queryAllServiceOrderByUserId(user.getId());
			if(serviceOrderList!=null&&serviceOrderList.size()!=0){
				serviceOrderListMap.put(user.getId().toString(), serviceOrderList);
			}
			datamap.put("serviceOrderListMap", serviceOrderListMap);
			List<Order> orderList = orderService.queryAllOrderByUserId(user.getId());
			if(orderList!=null&&orderList.size()!=0){
				orderListMap.put(user.getId().toString(), orderList);
			}
			datamap.put("orderListMap", orderListMap);
		}
		result = "success";
		return AJAX_SUCCESS;
	}
	
	public void setServletRequest(HttpServletRequest request) {
		this.request = request;
	}
	
}
