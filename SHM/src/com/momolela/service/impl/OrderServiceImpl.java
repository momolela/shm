/**   
 * @Title: UserServiceImpl.java  
 * @Package com.momolela.service.impl  
 * @Description: TODO  
 * @author momolela   
 * @date 2016-5-12 下午6:17:42  
 * @version V1.0   
 */
package com.momolela.service.impl;

import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.momolela.dao.IOrderDao;
import com.momolela.model.Order;
import com.momolela.service.IOrderService;

/**
 * 
 * @ClassName: UserServiceImpl
 * @Description: 
 * @author: momolela
 * @date 2016-6-14 上午11:52:46
 * 
 */
@Service
public class OrderServiceImpl implements IOrderService {

	@Autowired
	private IOrderDao orderDao;

	public List<Order> queryAllOrderByUserId(Integer userid) {
		return orderDao.queryAllOrderByUserId(userid);
	}

	public void addOrder(Order order) {
		orderDao.addOrder(order);
	}

	public void updateOrderStatus(Integer userid, Integer status) {
		orderDao.updateOrderStatus(userid, status);
	}

	public Order queryOrderByBillNowId(Integer billnowid) {
		return orderDao.queryOrderByBillNowId(billnowid);
	}

	public Order queryAllOrderByUserIdAndStatus(Integer userid, Integer i) {
		return orderDao.queryAllOrderByUserIdAndStatus(userid,i);
	}

	public void updateOrderByBillNowId(Integer billnowid) {
		orderDao.updateOrderByBillNowId(billnowid);
	}

	public void updateOrderByOrderId(Integer orderid,Integer billhistoryid) {
		orderDao.updateOrderByOrderId(orderid,billhistoryid);
	}

	public Order queryOrderByBillHistoryId(Integer billhistoryid) {
		return orderDao.queryOrderByBillHistoryId(billhistoryid);
	}

	public Order queryAllOrderByUserIdAndBillNowId(Integer userid) {
		return orderDao.queryAllOrderByUserIdAndBillNowId(userid);
	}

	public void updateOrderByOrderId(Integer roomid,Integer orderid,Integer status) {
		orderDao.updateOrderByOrderId(roomid,orderid,status);
	}

	public void updateOrderExpireTimeByUserId(Date addexpiretime,Integer id, Integer i) {
		orderDao.updateOrderExpireTimeByUserId(addexpiretime,id, i);
	}
}
