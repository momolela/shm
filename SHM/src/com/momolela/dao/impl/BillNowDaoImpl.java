/**   
 * @Title: UserDaoImpl.java  
 * @Package com.momolela.dao.impl  
 * @Description: TODO  
 * @author momolela   
 * @date 2016-5-12 下午6:23:51  
 * @version V1.0   
 */
package com.momolela.dao.impl;

import java.util.Date;

import javax.transaction.Transactional;

import org.hibernate.Query;
import org.springframework.stereotype.Repository;

import com.momolela.core.dao.BaseDaoImpl;
import com.momolela.dao.IBillNowDao;
import com.momolela.model.BillNow;

@Repository
@Transactional
public class BillNowDaoImpl extends BaseDaoImpl implements IBillNowDao {

	public BillNow queryBillNowByUserId(Integer userid) {
		BillNow billNow = new BillNow();
		String hql = "FROM BillNow b WHERE b.userid=?";
		Query query = getSession().createQuery(hql);
		query.setInteger(0, userid);
		billNow = (BillNow) query.uniqueResult();
		return billNow;
	}

	public void addBillNow(BillNow billNow) {
		getSession().save(billNow);
	}

	public void delBillNowByUserId(Integer userid) {
		String hql = "DELETE BillNow b WHERE b.userid=?";
		Query query = getSession().createQuery(hql);
		query.setInteger(0, userid);
		query.executeUpdate();
	}

	public BillNow queryBillNowById(Integer billnowid) {
		BillNow billNow = new BillNow();
		String hql = "FROM BillNow b WHERE b.id=?";
		Query query = getSession().createQuery(hql);
		query.setInteger(0, billnowid);
		billNow = (BillNow) query.uniqueResult();
		return billNow;
	}

	public void updateBillNowByUserId(Integer userid, Date addexpiretime) {
		String hql = "UPDATE BillNow b SET b.expiretime=? WHERE b.userid = ?";
		Query query = getSession().createQuery(hql);
		query.setDate(0, addexpiretime);
		query.setInteger(1, userid);
		query.executeUpdate();
	}

}
