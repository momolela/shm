/**   
 * @Title: IUserService.java  
 * @Package com.momolela.service  
 * @Description: TODO  
 * @author momolela   
 * @date 2016-9-26 下午4:13:47  
 * @version V1.0   
 */
package com.momolela.service;

import java.util.Date;

import com.momolela.model.BillNow;



/**
 * 
 * @ClassName: IBillNowService
 * @Description: 
 * @author: momolela
 * @date 2016-9-26 下午4:13:47
 * 
 */
public interface IBillNowService {

	BillNow queryBillNowByUserId(Integer userid);
	void addBillNow(BillNow billNow);
	void delBillNowByUserId(Integer userid);
	BillNow queryBillNowById(Integer billnowid);
	void updateBillNowByUserId(Integer userid, Date addexpiretime);
}
