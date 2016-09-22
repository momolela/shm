package com.momolela.service;

import java.util.List;

import com.momolela.model.Banner;

public interface IBannerService {

	public Banner findBanner(Integer bid);
	public void addBanner(Banner banner);
	public List<Banner> findAllBanner();
	public void deleteBanner(Integer id);
	public void updateBanner(Banner banner,Integer bid);
}
