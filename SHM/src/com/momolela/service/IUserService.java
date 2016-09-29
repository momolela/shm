/**   
 * @Title: IUserService.java  
 * @Package com.momolela.service  
 * @Description: TODO  
 * @author momolela   
 * @date 2016-9-26 下午4:13:47  
 * @version V1.0   
 */
package com.momolela.service;

import java.util.List;

import com.momolela.model.User;

/**
 * 
 * @ClassName: IUserService
 * @Description: 
 * @author: momolela
 * @date 2016-9-26 下午4:13:47
 * 
 */
public interface IUserService {
	public List<User> findAllUser();
	public User findAllUserById(Integer userid);
	public List<User> findAllUserByStatus(Integer status);
	
	//注册的是会员
	public void addUser0(User user);
	//酒店前台直接注册的是顾客
	public void addUser1(User user);
	
	public void delUserById(Integer userid);
	
	public void updateUser(User user);
}
