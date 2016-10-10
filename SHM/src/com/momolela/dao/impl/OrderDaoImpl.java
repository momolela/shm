/**   
 * @Title: UserDaoImpl.java  
 * @Package com.momolela.dao.impl  
 * @Description: TODO  
 * @author momolela   
 * @date 2016-5-12 下午6:23:51  
 * @version V1.0   
 */
package com.momolela.dao.impl;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.transaction.Transactional;

import org.hibernate.Query;
import org.springframework.stereotype.Repository;

import com.momolela.core.dao.BaseDaoImpl;
import com.momolela.dao.IOrderDao;
import com.momolela.model.Order;

@Repository
@Transactional
public class OrderDaoImpl extends BaseDaoImpl implements IOrderDao {

	public List<Order> queryAllOrderByUserId(Integer userid) {
		List<Order> orderList = new ArrayList<Order>();
		String hql = "FROM Order o WHERE o.userId = ?";
		Query query = getSession().createQuery(hql);
		query.setInteger(0, userid);
		orderList = query.list();
		return orderList;
	}

	public void addOrder(Order order) {
		getSession().save(order);
	}

	public void updateOrderStatus(Integer userid, Integer status) {
		String hql = "UPDATE Order o SET o.orderStatus=? WHERE o.userId = ?";
		Query query = getSession().createQuery(hql);
		query.setInteger(0, status);
		query.setInteger(1, userid);
		query.executeUpdate();
	}

	public Order queryOrderByBillNowId(Integer billnowid) {
		Order order = new Order();
		String hql = "FROM Order o WHERE o.billnowid = ?";
		Query query = getSession().createQuery(hql);
		query.setInteger(0, billnowid);
		order = (Order) query.uniqueResult();
		return order;
	}

	public Order queryAllOrderByUserIdAndStatus(Integer userid, Integer i) {
		Order order = new Order();
		String hql = "FROM Order o WHERE o.userId=? AND o.orderStatus != ?";
		Query query = getSession().createQuery(hql);
		query.setInteger(0, userid);
		query.setInteger(1, i);
		order = (Order) query.uniqueResult();
		return order;
	}

	public void updateOrderByBillNowId(Integer billnowid) {
		String hql = "UPDATE Order o SET o.billnowid=null WHERE o.billnowid = ?";
		Query query = getSession().createQuery(hql);
		query.setInteger(0, billnowid);
		query.executeUpdate();
	}

	public void updateOrderByOrderId(Integer orderid,Integer billhistoryid) {
		String hql = "UPDATE Order o SET o.orderStatus='2',o.billhistoryid=? WHERE o.id = ?";
		Query query = getSession().createQuery(hql);
		query.setInteger(0, billhistoryid);
		query.setInteger(1, orderid);
		query.executeUpdate();
	}

	public Order queryOrderByBillHistoryId(Integer billhistoryid) {
		Order order = new Order();
		String hql = "FROM Order o WHERE o.billhistoryid = ?";
		Query query = getSession().createQuery(hql);
		query.setInteger(0, billhistoryid);
		order = (Order) query.uniqueResult();
		return order;
	}

	public Order queryAllOrderByUserIdAndBillNowId(Integer userid) {
		Order order = new Order();
		String hql = "FROM Order o WHERE o.userId = ? AND o.billnowid != null";
		Query query = getSession().createQuery(hql);
		query.setInteger(0, userid);
		order = (Order) query.uniqueResult();
		return order;
	}

	public void updateOrderByOrderId(Integer roomid,Integer orderid,Integer status) {
		String hql = "UPDATE Order o SET o.orderStatus=?,o.roomId=? WHERE o.id = ?";
		Query query = getSession().createQuery(hql);
		query.setInteger(0, status);
		query.setInteger(1, roomid);
		query.setInteger(2, orderid);
		query.executeUpdate();
	}

	public void updateOrderExpireTimeByUserId(Date addexpiretime,Integer id, Integer i) {
		String hql = "UPDATE Order o SET o.expireTime=?, o.orderStatus=? WHERE o.id = ?";
		Query query = getSession().createQuery(hql);
		query.setDate(0, addexpiretime);
		query.setInteger(1, i);
		query.setInteger(2, id);
		query.executeUpdate();
	}
}
