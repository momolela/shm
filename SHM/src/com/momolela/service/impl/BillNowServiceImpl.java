/**   
 * @Title: UserServiceImpl.java  
 * @Package com.momolela.service.impl  
 * @Description: TODO  
 * @author momolela   
 * @date 2016-5-12 下午6:17:42  
 * @version V1.0   
 */
package com.momolela.service.impl;

import java.util.Date;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.momolela.dao.IBillNowDao;
import com.momolela.model.BillNow;
import com.momolela.service.IBillNowService;

/**
 * 
 * @ClassName: UserServiceImpl
 * @Description: 
 * @author: momolela
 * @date 2016-6-14 上午11:52:46
 * 
 */
@Service
public class BillNowServiceImpl implements IBillNowService {

	@Autowired
	private IBillNowDao billNowDao;

	public BillNow queryBillNowByUserId(Integer userid) {
		return billNowDao.queryBillNowByUserId(userid);
	}

	public void addBillNow(BillNow billNow) {
		billNowDao.addBillNow(billNow);
	}

	public void delBillNowByUserId(Integer userid) {
		billNowDao.delBillNowByUserId(userid);
	}

	public BillNow queryBillNowById(Integer billnowid) {
		return billNowDao.queryBillNowById(billnowid);
	}

	public void updateBillNowByUserId(Integer userid, Date addexpiretime) {
		billNowDao.updateBillNowByUserId(userid, addexpiretime);
	}

}
