/**   
 * @Title: UserServiceImpl.java  
 * @Package com.momolela.service.impl  
 * @Description: TODO  
 * @author momolela   
 * @date 2016-5-12 下午6:17:42  
 * @version V1.0   
 */
package com.momolela.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.momolela.dao.IBillHistoryDao;
import com.momolela.model.BillHistory;
import com.momolela.service.IBillHistoryService;

/**
 * 
 * @ClassName: BillHistoryServiceImpl
 * @Description: 
 * @author: momolela
 * @date 2016-6-14 上午11:52:46
 * 
 */
@Service
public class BillHistoryServiceImpl implements IBillHistoryService {

	@Autowired
	private IBillHistoryDao billHistoryDao;

	public List<BillHistory> queryBillHistoryByUserId(Integer userid) {
		return billHistoryDao.queryBillHistoryByUserId(userid);
	}

	public BillHistory addBillHistory(BillHistory billHistory) {
		return billHistoryDao.addBillHistory(billHistory);
	}

}
