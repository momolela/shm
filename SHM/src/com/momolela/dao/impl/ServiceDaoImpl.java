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
import com.momolela.dao.IServiceDao;
import com.momolela.model.Service;

@Repository
@Transactional
public class ServiceDaoImpl extends BaseDaoImpl implements IServiceDao {

	public List<Service> queryAllService() {
		List<Service> serviceList = new ArrayList<Service>();
		String hql = "FROM Service s";
		Query query = getSession().createQuery(hql);
		serviceList = query.list();
		return serviceList;
	}

	public Service queryServiceById(Integer serviceid) {
		Service service = new Service();
		String hql = "FROM Service s WHERE s.id=?";
		Query query = getSession().createQuery(hql);
		query.setInteger(0, serviceid);
		service = (Service) query.uniqueResult();
		return service;
	}

}
