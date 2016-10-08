/**   
 * @Title: UserDaoImpl.java  
 * @Package com.momolela.dao.impl  
 * @Description: TODO  
 * @author momolela   
 * @date 2016-5-12 下午6:23:51  
 * @version V1.0   
 */
package com.momolela.dao.impl;

import java.util.ArrayList;
import java.util.List;

import javax.transaction.Transactional;

import org.hibernate.Query;
import org.springframework.stereotype.Repository;

import com.momolela.core.dao.BaseDaoImpl;
import com.momolela.dao.IBillHistoryDao;
import com.momolela.model.BillHistory;

@Repository
@Transactional
public class BillHistoryDaoImpl extends BaseDaoImpl implements IBillHistoryDao {

	public List<BillHistory> queryBillHistoryByUserId(Integer userid) {
		List<BillHistory> billHistoryList = new ArrayList<BillHistory>();
		String hql = "FROM BillHistory b WHERE b.userid=?";
		Query query = getSession().createQuery(hql);
		query.setInteger(0, userid);
		billHistoryList = query.list();
		return billHistoryList;
	}

	public BillHistory addBillHistory(BillHistory billHistory) {
		BillHistory billHistoryBack = new BillHistory();
		getSession().save(billHistory);
		billHistoryBack = (BillHistory) getSession().get(BillHistory.class, billHistory.getId());
		return billHistoryBack;
	}


}
