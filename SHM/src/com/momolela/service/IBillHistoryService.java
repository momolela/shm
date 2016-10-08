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

import com.momolela.model.BillHistory;



/**
 * 
 * @ClassName: IBillHistoryService
 * @Description: 
 * @author: momolela
 * @date 2016-9-26 下午4:13:47
 * 
 */
public interface IBillHistoryService {

	List<BillHistory> queryBillHistoryByUserId(Integer userid);
	BillHistory addBillHistory(BillHistory billHistory);

}
