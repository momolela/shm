package com.momolela.web.admin;

import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.interceptor.ServletRequestAware;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import com.momolela.core.action.BaseAction;
import com.momolela.model.BillHistory;
import com.momolela.model.BillNow;
import com.momolela.model.Order;
import com.momolela.model.Room;
import com.momolela.model.Service;
import com.momolela.model.ServiceOrder;
import com.momolela.model.User;
import com.momolela.service.IBillHistoryService;
import com.momolela.service.IBillNowService;
import com.momolela.service.IOrderService;
import com.momolela.service.IRoomService;
import com.momolela.service.IServiceOrderService;
import com.momolela.service.IServiceService;
import com.momolela.service.IUserService;
import com.momolela.util.SunDateUtils;

@Controller("checkOutAction")
@Scope("prototype")
public class CheckOutAction extends BaseAction implements ServletRequestAware {
	private Map<String, Object> datamap = new HashMap<String, Object>();
	private HttpServletRequest request;
	
	@Autowired
	private IUserService userService;
	
	@Autowired
	private IRoomService roomService;
	
	@Autowired
	private IServiceOrderService serviceOrderService;
	
	@Autowired
	private IOrderService orderService;
	
	@Autowired
	private IServiceService serviceService;
	
	@Autowired
	private IBillNowService billNowService;
	
	@Autowired
	private IBillHistoryService billHistoryService;
	
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
	
	/**
	 * 前台登记入住
	 */
	public String addOrder(){
		Integer roomId = Integer.parseInt(request.getParameter("roomid"));
		Integer userid = Integer.parseInt(request.getParameter("userid"));
		User user = userService.findAllUserById(userid);
		Room room = roomService.queryRoomById(roomId);
		String checkintime = request.getParameter("checkintime");
		String expiretime = request.getParameter("expiretime");
		BillNow billNow = new BillNow();
		billNow.setCheckintime(SunDateUtils.parseDate(checkintime));
		billNow.setExpiretime(SunDateUtils.parseDate(expiretime));
		billNow.setUserid(user);
		// billnow表加一条记录
		billNowService.addBillNow(billNow);
		BillNow billNowBack = billNowService.queryBillNowByUserId(user.getId());
		Order order = new Order();
		order.setCheckInTime(SunDateUtils.parseDate(checkintime));
		order.setExpireTime(SunDateUtils.parseDate(expiretime));
		order.setRoomId(room);
		order.setUserId(user);
		order.setOrderStatus(1);
		order.setBillnowid(billNowBack);
		// order表加一条记录
		orderService.addOrder(order);
		
		result = "success";
		return AJAX_SUCCESS;
	}
	
	public String updateOrderStatus(){
		Integer userid = Integer.parseInt(request.getParameter("userid"));
		Integer status = Integer.parseInt(request.getParameter("status"));
		orderService.updateOrderStatus(userid,status);
		result = "success";
		return AJAX_SUCCESS;
	}
	
	public String queryBillNowByUserId(){
		Integer userid = Integer.parseInt(request.getParameter("userid"));
		// 先查询所有的顾客信息
		List<User> userList = userService.findAllUser();
		datamap.put("userList", userList);
		BillNow billNow = billNowService.queryBillNowByUserId(userid);
		if(billNow!=null){
			Integer billnowid = billNow.getId();
			Map<String, List<ServiceOrder>> serviceOrderListMap = new HashMap<String, List<ServiceOrder>>();
			Map<String, Order> orderListMap = new HashMap<String, Order>();
			Order order = orderService.queryOrderByBillNowId(billnowid);
			List<ServiceOrder> serviceOrderList = serviceOrderService.queryServiceOrderByBillNowId(billnowid);
			serviceOrderListMap.put(userid.toString(), serviceOrderList);
			orderListMap.put(userid.toString(), order);
			datamap.put("orderListMap", orderListMap);
			datamap.put("serviceOrderListMap", serviceOrderListMap);
			result = "success";
		}else{
			result = "fail";
		}
		return AJAX_SUCCESS;
	}
	
	public String queryBillHistoryByUserId(){
		Integer userid = Integer.parseInt(request.getParameter("userid"));
		List<BillHistory> billHistoryList = billHistoryService.queryBillHistoryByUserId(userid);
		if(billHistoryList!=null){
			List<Map<String, Object>> billMapList = new ArrayList<Map<String, Object>>();
			// 有多少个就有多少个历史账单
			for(BillHistory billHistory:billHistoryList){
				Integer billhistoryid = billHistory.getId();
				Map<String, Object> billMap = new HashMap<String, Object>();
				Order order = orderService.queryOrderByBillHistoryId(billhistoryid);
				List<ServiceOrder> serviceOrderList = serviceOrderService.queryServiceOrderByBillHistoryId(billhistoryid);
				billMap.put("billhistoryid", billhistoryid);
				billMap.put("order", order);
				billMap.put("serviceOrderList", serviceOrderList);
				billMapList.add(billMap);
			}
			datamap.put("billMapList", billMapList);
			result = "success";
		}else{
			result = "fail";
		}
		return AJAX_SUCCESS;
	}
	
	public String delBillNowByUserId(){
		Integer userid = Integer.parseInt(request.getParameter("userid"));
		BillNow billNow = billNowService.queryBillNowByUserId(userid);
		datamap.put("billNowid", billNow.getId());
		billNowService.delBillNowByUserId(userid);
		result = "success";
		return AJAX_SUCCESS;
	}
	
	public String addBillHistoryByUserId(){
		Integer userid = Integer.parseInt(request.getParameter("userid"));
		BillHistory billHistory = new BillHistory();
		Order order = orderService.queryAllOrderByUserIdAndStatus(userid,2);
		billHistory.setCheckintime(order.getCheckInTime());
		billHistory.setExpiretime(order.getExpireTime());
		billHistory.setUserid(userService.findAllUserById(userid));
		BillHistory billHistoryBack = billHistoryService.addBillHistory(billHistory);
		datamap.put("billhistoryid", billHistoryBack.getId());
		result = "success";
		return AJAX_SUCCESS;
	}
	
	public String updateServiceOrderByBillNowId(){
		Integer billnowid = Integer.parseInt(request.getParameter("billnowid"));
		List<Integer> ServiceOrderIdList = new ArrayList<Integer>();
		List<ServiceOrder> serviceOrderList = serviceOrderService.queryServiceOrderByBillNowId(billnowid);
		for(ServiceOrder serviceOrder:serviceOrderList){
			ServiceOrderIdList.add(serviceOrder.getId());
		}
		datamap.put("serviceorderidlist", ServiceOrderIdList);
		if((serviceOrderService.queryServiceOrderByBillNowId(billnowid))!=null){
			serviceOrderService.updateServiceOrderByBillNowId(billnowid);
			result = "success";
		}
		return AJAX_SUCCESS;
	}
	
	public String queryBillNowIdByUserId(){
		Integer userid = Integer.parseInt(request.getParameter("userid"));
		BillNow billNow = billNowService.queryBillNowByUserId(userid);
		datamap.put("billnowid", billNow.getId());
		result = "success";
		return AJAX_SUCCESS;
	}
	
	public String updateOrderByBillNowId(){
		Integer billnowid = Integer.parseInt(request.getParameter("billnowid"));
		Order order = orderService.queryOrderByBillNowId(billnowid);
		orderService.updateOrderByBillNowId(billnowid);
		datamap.put("orderid", order.getId());
		result = "success";
		return AJAX_SUCCESS;
	}
	
	public String updateOrderByOrderId(){
		Integer orderid = Integer.parseInt(request.getParameter("orderid"));
		Integer billhistoryid = Integer.parseInt(request.getParameter("billhistoryid"));
		orderService.updateOrderByOrderId(orderid,billhistoryid);
		result = "success";
		return AJAX_SUCCESS;
	}
	
	public String updateServiceOrderByServiceOrderIdList(){
		String[] serviceorderidlist = request.getParameterValues("serviceorderidlist");
		Integer billhistoryid = Integer.parseInt(request.getParameter("billhistoryid"));
		if(serviceorderidlist.length!=0||serviceorderidlist!=null){
			for(String serviceorderid:serviceorderidlist){
				serviceOrderService.updateServiceOrderByServiceOrderId(Integer.parseInt(serviceorderid),billhistoryid);
			}
		}
		result = "success";
		return AJAX_SUCCESS;
	}
	
	public String addServiceOrderByUserId(){
		Integer userid = Integer.parseInt(request.getParameter("userid"));
		User user = userService.findAllUserById(userid);
		Integer serviceid = Integer.parseInt(request.getParameter("serviceid"));
		Service service = serviceService.queryServiceById(serviceid);
		Integer billnowid = Integer.parseInt(request.getParameter("billnowid"));
		BillNow billNow = billNowService.queryBillNowById(billnowid);
		String totalmoney = request.getParameter("totalmoney");
		
		ServiceOrder serviceOrder = new ServiceOrder();
		serviceOrder.setAllMoney(totalmoney);
		serviceOrder.setBillnowid(billNow);
		serviceOrder.setServiceId(service);
		serviceOrder.setStatus(0);
		serviceOrder.setUserId(user);
		
		serviceOrderService.addService(serviceOrder);
		
		result = "success";
		return AJAX_SUCCESS;
	}
	
	public String updateOrderByUserId(){
		Integer userid = Integer.parseInt(request.getParameter("userid"));
		Integer roomid = Integer.parseInt(request.getParameter("roomid"));
		Order order = orderService.queryAllOrderByUserIdAndBillNowId(userid);
		orderService.updateOrderByOrderId(roomid,order.getId(),3);
		result = "success";
		return AJAX_SUCCESS;
	}
	
	public String updateOrderExpireTimeByUserId(){
		Integer userid = Integer.parseInt(request.getParameter("userid"));
		Date addexpiretime = SunDateUtils.parseDate(request.getParameter("addexpiretime"));
		Order order = orderService.queryAllOrderByUserIdAndBillNowId(userid);
		orderService.updateOrderExpireTimeByUserId(addexpiretime,order.getId(),4);
		result = "success";
		return AJAX_SUCCESS;
	}
	
	public String updateBillNowByUserId(){
		Integer userid = Integer.parseInt(request.getParameter("userid"));
		Date addexpiretime = SunDateUtils.parseDate(request.getParameter("addexpiretime"));
		billNowService.updateBillNowByUserId(userid,addexpiretime);
		result = "success";
		return AJAX_SUCCESS;
	}
	
	public void setServletRequest(HttpServletRequest request) {
		this.request = request;
	}
	
}
