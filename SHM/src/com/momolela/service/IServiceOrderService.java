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
	List<ServiceOrder> queryServiceOrderByBillNowId(Integer billnowid);
	void updateServiceOrderByBillNowId(Integer billnowid);
	void updateServiceOrderByServiceOrderId(Integer serviceorderid, Integer billhistoryid);
	void addService(ServiceOrder serviceOrder);
	List<ServiceOrder> queryServiceOrderByBillHistoryId(Integer billhistoryid);
}
