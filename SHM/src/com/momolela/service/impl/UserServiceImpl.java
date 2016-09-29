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

import com.momolela.dao.IUserDao;
import com.momolela.model.User;
import com.momolela.service.IUserService;

/**
 * 
 * @ClassName: UserServiceImpl
 * @Description: 
 * @author: momolela
 * @date 2016-6-14 上午11:52:46
 * 
 */
@Service
public class UserServiceImpl implements IUserService {

	@Autowired
	private IUserDao IuserDao;

	public List<User> findAllUser() {
		return IuserDao.findAllUser();
	}

	public User findAllUserById(Integer userid) {
		return IuserDao.findAllUserById(userid);
	}

	public List<User> findAllUserByStatus(Integer status) {
		return IuserDao.findAllUserByStatus(status);
	}

	public void addUser0(User user) {
		IuserDao.addUser0(user);
	}

	public void addUser1(User user) {
		IuserDao.addUser1(user);
	}

	public void delUserById(Integer userid) {
		IuserDao.delUserById(userid);
	}

	public void updateUser(User user) {
		IuserDao.updateUser(user);
	}
}
