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
}
