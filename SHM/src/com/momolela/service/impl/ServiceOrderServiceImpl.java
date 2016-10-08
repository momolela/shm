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
import com.momolela.model.ServiceOrder;
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

	public List<ServiceOrder> queryServiceOrderByBillNowId(Integer billnowid) {
		return serviceOrderDao.queryServiceOrderByBillNowId(billnowid);
	}

	public void updateServiceOrderByBillNowId(Integer billnowid) {
		serviceOrderDao.updateServiceOrderByBillNowId(billnowid);
	}

	public void updateServiceOrderByServiceOrderId(Integer serviceorderid,
			Integer billhistoryid) {
		serviceOrderDao.updateServiceOrderByServiceOrderId(serviceorderid, billhistoryid);
	}

	public void addService(ServiceOrder serviceOrder) {
		serviceOrderDao.addService(serviceOrder);
	}

}
