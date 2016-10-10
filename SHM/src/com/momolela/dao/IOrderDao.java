/**   
 * @Title: IOrderDao.java  
 * @Package com.momolela.dao  
 * @Description: TODO  
 * @author momolela   
 * @date 2016-9-26 下午5:26:40  
 * @version V1.0   
 */
package com.momolela.dao;

import java.util.Date;
import java.util.List;

import com.momolela.model.Order;

/**
 * @ClassName: IOrderDao
 * @Description: 
 * @author: momolela
 * @date 2016-9-26 下午5:26:40
 * 
 */
public interface IOrderDao {
	List<Order> queryAllOrderByUserId(Integer userid);
	void addOrder(Order order);
	void updateOrderStatus(Integer userid, Integer status);
	Order queryOrderByBillNowId(Integer billnowid);
	Order queryAllOrderByUserIdAndStatus(Integer userid, Integer i);
	void updateOrderByBillNowId(Integer billnowid);
	void updateOrderByOrderId(Integer orderid,Integer billhistoryid);
	Order queryOrderByBillHistoryId(Integer billhistoryid);
	Order queryAllOrderByUserIdAndBillNowId(Integer userid);
	void updateOrderByOrderId(Integer roomid,Integer orderid,Integer status);
	void updateOrderExpireTimeByUserId(Date addexpiretime, Integer id, Integer i);
}
