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

import com.momolela.dao.IBannerDao;
import com.momolela.model.Banner;
import com.momolela.service.IBannerService;

/**
 * 
 * @ClassName: BannerServiceImpl
 * @Description: 
 * @author: momolela
 * @date 2016-6-14 上午11:52:46
 * 
 */
@Service
public class BannerServiceImpl implements IBannerService {

	@Autowired
	private IBannerDao IbannerDao;

	public Banner findBanner(Integer bid) {
		return IbannerDao.findBanner(bid);
	}

	public void addBanner(Banner banner) {
		IbannerDao.addBanner(banner);
	}

	public List<Banner> findAllBanner() {
		return IbannerDao.findAllBanner();
	}

	public void deleteBanner(Integer id) {
		IbannerDao.deleteBanner(id);
	}

	public void updateBanner(Banner banner,Integer bid) {
		IbannerDao.updateBanner(banner,bid);
	}

}
