/**   
 * @Title: IUserDao.java  
 * @Package com.momolela.dao  
 * @Description: TODO  
 * @author momolela   
 * @date 2016-9-26 下午4:23:59  
 * @version V1.0   
 */
package com.momolela.dao;

import java.util.List;

import com.momolela.model.User;

/**
 * @ClassName: IUserDao
 * @Description: 
 * @author: momolela
 * @date 2016-9-26 下午4:23:59
 * 
 */
public interface IUserDao {
	public List<User> findAllUser();
	public User findAllUserById(Integer userid);
	public List<User> findAllUserByStatus(Integer status);
	public void addUser0(User user);
	public void addUser1(User user);
	public void delUserById(Integer userid);
	public void updateUser(User user);
}
