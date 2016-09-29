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
import com.momolela.dao.IServiceOrderDao;
import com.momolela.model.RoomPic;
import com.momolela.model.ServiceOrder;

@Repository
@Transactional
public class ServiceOrderDaoImpl extends BaseDaoImpl implements IServiceOrderDao {

	public List<ServiceOrder> queryAllServiceOrderByUserId(Integer userid) {
		List<ServiceOrder> serviceOrderList = new ArrayList<ServiceOrder>();
		String hql = "FROM ServiceOrder s WHERE s.userId = ?";
		Query query = getSession().createQuery(hql);
		query.setInteger(0, userid);
		serviceOrderList = query.list();
		return serviceOrderList;
	}
}
