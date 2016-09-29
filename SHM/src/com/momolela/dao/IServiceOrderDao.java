/**   
 * @Title: IServiceOrderDao.java  
 * @Package com.momolela.dao  
 * @Description: TODO  
 * @author momolela   
 * @date 2016-9-26 下午4:42:41  
 * @version V1.0   
 */
package com.momolela.dao;

import java.util.List;

import com.momolela.model.ServiceOrder;

/**
 * @ClassName: IServiceOrderDao
 * @Description: 
 * @author: momolela
 * @date 2016-9-26 下午4:42:41
 * 
 */
public interface IServiceOrderDao {
	List<ServiceOrder> queryAllServiceOrderByUserId(Integer userid);
}
