/**   
 * @Title: PageAction.java  
 * @Package com.momolela.web.user  
 * @Description: TODO  
 * @author momolela   
 * @date 2016-6-4 下午6:59:04  
 * @version V1.0   
 */
package com.momolela.web.admin;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.interceptor.ServletRequestAware;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import com.momolela.core.action.BaseAction;
import com.momolela.model.Banner;
import com.momolela.service.IBannerService;

/**
 * 
 * @ClassName: adimnPageAction
 * @Description: 后台页面的跳转使用的action，跳转前数据的加载都可以在这里执行。
 * @author: momolela
 * @date 2016-6-4 下午6:59:04
 * 
 */
@Controller("adminPageAction")
@Scope("prototype")
public class AdminPageAction extends BaseAction implements ServletRequestAware{
	
	private HttpServletRequest request;
	
	@Autowired
	private IBannerService bannerService;
	
	// 跳向后台登录页面
	public String toAdminLogin(){
		return "adminlogin";
	}
	
	// 跳向后台首页
	public String toAdminIndex(){
		return "adminindex";
	}
	
	// 跳向后台的页面管理，所以要先加载banner需要的数据。
	public String toPageManage() {
		// 把页面需要的数据提前加载。
		List<Banner> bannerlist = bannerService.findAllBanner();
		// 通过请求转发将数据带到响应的页面
		request.setAttribute("bannerlist", bannerlist);
		return "pagemanage";
	}
	
	// 跳向后台的客房管理
	public String toRoomManage() {
		return "roommanage";
	}
	
	// 跳向后台的结算中心
	public String toCheckoutCenter() {
		return "checkoutcenter";
	}
	
	// 跳向后台的顾客管理
	public String toCustomerManage() {
		return "customermanage";
	}
	
	// 跳向后台的评论中心
	public String toCommentsCenter() {
		return "commentscenter";
	}
	
	// 跳向后台的酒店资讯
	public String toHotelInformation() {
		return "hotelinformation";
	}

	public void setServletRequest(HttpServletRequest request) {
		this.request = request;
	}
}
