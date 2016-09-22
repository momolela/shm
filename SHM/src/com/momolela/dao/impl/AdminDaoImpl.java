/**   
 * @Title: UserDaoImpl.java  
 * @Package com.momolela.dao.impl  
 * @Description: TODO  
 * @author momolela   
 * @date 2016-5-12 下午6:23:51  
 * @version V1.0   
 */
package com.momolela.dao.impl;

import javax.transaction.Transactional;

import org.hibernate.Query;
import org.springframework.stereotype.Repository;

import com.momolela.core.dao.BaseDaoImpl;
import com.momolela.dao.IAdminDao;
import com.momolela.model.Admin;

/**
 * @ClassName: UserDaoImpl
 * @Description: 用户操作的实现
 * @author: momolela
 * @date 2016-5-12 下午6:23:51
 */
@Repository
@Transactional
public class AdminDaoImpl extends BaseDaoImpl implements IAdminDao {

	public Admin findAdmin(String account, String password) {
		String hql = "from Admin where account = ? and password = ?";
		Query query = getSession().createQuery(hql);
		query.setString(0, account);
		query.setString(1, password);
		Admin admin = (Admin) query.uniqueResult();
		return admin;
	}
}
