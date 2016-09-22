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
import com.momolela.dao.IBannerDao;
import com.momolela.model.Banner;

@Repository
@Transactional
public class BannerDaoImpl extends BaseDaoImpl implements IBannerDao {

	public Banner findBanner(Integer bid) {
		String hql = "from Banner where id = ?";
		Query query = getSession().createQuery(hql);
		query.setParameter(0, bid);
		Banner banner = (Banner) query.uniqueResult();
		return banner;
	}

	public void addBanner(Banner banner) {
		getSession().save(banner);
	}

	public List<Banner> findAllBanner() {
		List<Banner> bannerlist = new ArrayList<Banner>();
		String hql = "from Banner";
		Query query = getSession().createQuery(hql);
		bannerlist = (List<Banner>) query.list();
		return bannerlist;
	}

	public void deleteBanner(Integer id) {
		getSession().delete(getSession().get(Banner.class, id));
	}

	public void updateBanner(Banner banner,Integer bid) {
		String hql = "UPDATE Banner as b SET b.btitle=?,b.bcontent=?,b.burl=? WHERE b.id=?";
		Query query = getSession().createQuery(hql);
		query.setParameter(0, banner.getBtitle());
		query.setParameter(1, banner.getBcontent());
		query.setParameter(2, banner.getBurl());
		query.setParameter(3, bid);
		query.executeUpdate();
	}
}
