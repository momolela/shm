package com.momolela.web.admin;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.interceptor.ServletRequestAware;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import com.momolela.core.action.BaseAction;
import com.momolela.model.Banner;
import com.momolela.service.IBannerService;

@Controller("bannerAction")
@Scope("prototype")
public class BannerAction extends BaseAction implements ServletRequestAware {

	private HttpServletRequest request;
	
	@Autowired
	private IBannerService BannerService;
	
	/**
	 * 添加banner图片
	 * @return
	 */
	public String addBanner(){
		// ---------获取ajax传递过来的数据。
		String btitle = request.getParameter("btitle");
		String bcontent = request.getParameter("bcontent");
		String url = request.getParameter("url");
		
		// ---------整合所有数据。
		Banner banner = new Banner();
		banner.setBtitle(btitle);
		banner.setBcontent(bcontent);
		banner.setBurl(url);
		
		// ---------将新的数据更新到数据库。
		BannerService.addBanner(banner);
		
		result = "success";
		
		return AJAX_SUCCESS;
	}
	
	/**
	 * 更新banner图片
	 * @return
	 */
	public String updateBanner(){
		// ---------获取ajax传递过来的数据。
		String btitle = request.getParameter("btitle");
		String bcontent = request.getParameter("bcontent");
		String url = request.getParameter("url");
		String id = request.getParameter("bid");
		Integer bid = Integer.parseInt(id);
		
		// ---------整合所有数据。
		Banner banner = new Banner();
		banner.setBtitle(btitle);
		banner.setBcontent(bcontent);
		banner.setBurl(url);
		
		// ---------将新的数据更新到数据库。
		BannerService.updateBanner(banner,bid);
		
		result = "success";
		
		return AJAX_SUCCESS;
	}
	
	/**
	 * 删除banner图片
	 * @return
	 */
	public String deleteBanner(){
		// ---------获取ajax传递过来的数据。
		String bid = request.getParameter("bid");
		Integer id = Integer.parseInt(bid);
		
		// ---------从数据库中找到相应的数据并且删除。
		BannerService.deleteBanner(id);
		
		result = "success";
		
		return AJAX_SUCCESS;
	}
	
	public void setServletRequest(HttpServletRequest request) {
		this.request = request;
	}
	
}
