/**   
 * @Title: RoomManageAction.java  
 * @Package com.momolela.web.user  
 * @Description: TODO  
 * @author momolela   
 * @date 2016-9-18 上午11:30:21  
 * @version V1.0   
 */
package com.momolela.web.user;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.interceptor.ServletRequestAware;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import com.momolela.core.action.BaseAction;
import com.momolela.model.Comments;
import com.momolela.service.ICommentsService;

/**
 * 
 * @ClassName: CommentsManageAction
 * @Description: 评论管理的模块
 * @author: momolela
 * @date 2016-9-18 上午11:30:21
 * 
 */
@Controller("commentsManageAction")
@Scope("prototype")
public class CommentsManageAction extends BaseAction implements ServletRequestAware{
	private Map<String, Object> datamap = new HashMap<String, Object>();
	HttpServletRequest request;
	
	@Autowired
	private ICommentsService commentsService;

	public Map<String, Object> getDatamap() {
		return datamap;
	}

	public void setDatamap(Map<String, Object> datamap) {
		this.datamap = datamap;
	}
	
	/**
	 * 查询所有的评论
	 * @return
	 */
	public String findAllComments(){
		List<Comments> commentsList = commentsService.findAllComments();
		List<Comments> commentsList0 = commentsService.findAllCommentsByStatus(0);
		List<Comments> commentsList1 = commentsService.findAllCommentsByStatus(1);
		datamap.put("commentsList", commentsList);
		datamap.put("commentsList0", commentsList0);
		datamap.put("commentsList1", commentsList1);
		result = "success";
		return AJAX_SUCCESS;
	}
	
	/**
	 * 通过评论id删除评论
	 * @return
	 */
	public String delCommentsById(){
		Integer commentsId = Integer.parseInt(request.getParameter("commentsId"));
		commentsService.delCommentsById(commentsId);
		result = "success";
		return AJAX_SUCCESS;
	}
	
	/**
	 * 通过评论id审核通过改变status
	 * @return
	 */
	public String changeCommentsStatusById(){
		Integer commentsId = Integer.parseInt(request.getParameter("commentsId"));
		commentsService.changeCommentsStatusById(commentsId);
		result = "success";
		return AJAX_SUCCESS;
	}

	public void setServletRequest(HttpServletRequest request) {
		this.request = request;
	}
}
