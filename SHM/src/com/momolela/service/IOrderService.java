/**   
 * @Title: IUserService.java  
 * @Package com.momolela.service  
 * @Description: TODO  
 * @author momolela   
 * @date 2016-9-26 下午4:13:47  
 * @version V1.0   
 */
package com.momolela.service;

import java.util.List;

import com.momolela.model.Order;


/**
 * 
 * @ClassName: IOrderService
 * @Description: 
 * @author: momolela
 * @date 2016-9-26 下午4:13:47
 * 
 */
public interface IOrderService {

	List<Order> queryAllOrderByUserId(Integer id);
	void addOrder(Order order);
	void updateOrderStatus(Integer userid, Integer status);
	Order queryOrderByBillNowId(Integer billnowid);
	Order queryAllOrderByUserIdAndStatus(Integer userid, Integer i);
	void updateOrderByBillNowId(Integer billnowid);
	void updateOrderByOrderId(Integer orderid,Integer billhistoryid);
}
