/**   
 * @Title: IOrderDao.java  
 * @Package com.momolela.dao  
 * @Description: TODO  
 * @author momolela   
 * @date 2016-9-26 下午5:26:40  
 * @version V1.0   
 */
package com.momolela.dao;

import java.util.Date;

import com.momolela.model.BillNow;


/**
 * @ClassName: IBillNowDao
 * @Description: 
 * @author: momolela
 * @date 2016-9-26 下午5:26:40
 * 
 */
public interface IBillNowDao {

	BillNow queryBillNowByUserId(Integer userid);
	void addBillNow(BillNow billNow);
	void delBillNowByUserId(Integer userid);
	BillNow queryBillNowById(Integer billnowid);
	void updateBillNowByUserId(Integer userid, Date addexpiretime);
}
