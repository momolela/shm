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

import com.momolela.model.ServiceOrder;
import com.momolela.model.User;

/**
 * 
 * @ClassName: IUserService
 * @Description: 
 * @author: momolela
 * @date 2016-9-26 下午4:13:47
 * 
 */
public interface IServiceOrderService {
	List<ServiceOrder> queryAllServiceOrderByUserId(Integer id);
}
