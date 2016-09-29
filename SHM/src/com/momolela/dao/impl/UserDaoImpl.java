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
import com.momolela.dao.IUserDao;
import com.momolela.model.User;

@Repository
@Transactional
public class UserDaoImpl extends BaseDaoImpl implements IUserDao {

	public List<User> findAllUser() {
		List<User> userlist = new ArrayList<User>();
		String hql = "from User";
		Query query = getSession().createQuery(hql);
		userlist = (List<User>) query.list();
		return userlist;
	}

	public User findAllUserById(Integer userid) {
		User user = new User();
		String hql = "from User u where u.id=?";
		Query query = getSession().createQuery(hql);
		query.setInteger(0, userid);
		user = (User) query.uniqueResult();
		return user;
	}

	public List<User> findAllUserByStatus(Integer status) {
		List<User> userList = new ArrayList<User>();
		String hql = "from User u where u.status=?";
		Query query = getSession().createQuery(hql);
		query.setInteger(0, status);
		userList = (List<User>) query.list();
		return userList;
	}

	public void addUser0(User user) {
		getSession().save(user);
	}

	public void addUser1(User user) {
		getSession().save(user);
	}

	public void delUserById(Integer userid) {
		User user = (User)getSession().get(User.class, userid);
		getSession().delete(user);
	}

	public void updateUser(User user) {
		getSession().delete(user);
	}

	
}
