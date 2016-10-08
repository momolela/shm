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

import com.momolela.dao.IServiceDao;
import com.momolela.service.IServiceService;

/**
 * 
 * @ClassName: ServiceServiceImpl
 * @Description: 
 * @author: momolela
 * @date 2016-6-14 上午11:52:46
 * 
 */
@Service
public class ServiceServiceImpl implements IServiceService {

	@Autowired
	private IServiceDao serviceDao;

	public List<com.momolela.model.Service> queryAllService() {
		return serviceDao.queryAllService();
	}

	public com.momolela.model.Service queryServiceById(Integer serviceid) {
		return serviceDao.queryServiceById(serviceid);
	}

}
