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

import com.momolela.dao.IServiceOrderDao;
import com.momolela.dao.IUserDao;
import com.momolela.model.ServiceOrder;
import com.momolela.model.User;
import com.momolela.service.IServiceOrderService;

/**
 * 
 * @ClassName: UserServiceImpl
 * @Description: 
 * @author: momolela
 * @date 2016-6-14 上午11:52:46
 * 
 */
@Service
public class ServiceOrderServiceImpl implements IServiceOrderService {

	@Autowired
	private IServiceOrderDao serviceOrderDao;

	public List<ServiceOrder> queryAllServiceOrderByUserId(Integer userid) {
		return serviceOrderDao.queryAllServiceOrderByUserId(userid);
	}
}
