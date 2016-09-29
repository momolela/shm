/**   
 * @Title: UserServiceImpl.java  
 * @Package com.momolela.service.impl  
 * @Description: TODO  
 * @author momolela   
 * @date 2016-5-12 下午6:17:42  
 * @version V1.0   
 */
package com.momolela.service.impl;

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
}
