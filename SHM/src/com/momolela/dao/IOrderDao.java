/**   
 * @Title: IOrderDao.java  
 * @Package com.momolela.dao  
 * @Description: TODO  
 * @author momolela   
 * @date 2016-9-26 下午5:26:40  
 * @version V1.0   
 */
package com.momolela.dao;

import java.util.List;

import com.momolela.model.Order;

/**
 * @ClassName: IOrderDao
 * @Description: 
 * @author: momolela
 * @date 2016-9-26 下午5:26:40
 * 
 */
public interface IOrderDao {
	List<Order> queryAllOrderByUserId(Integer userid);
}
