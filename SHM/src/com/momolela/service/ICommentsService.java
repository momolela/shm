/**   
 * @Title: IUserService.java  
 * @Package com.momolela.service  
 * @Description: TODO  
 * @author momolela   
 * @date 2016-9-26 下午4:13:47  
 * @version V1.0   
 */
package com.momolela.service;

import java.util.List;

import com.momolela.model.Comments;

/**
 * 
 * @ClassName: ICommentsService
 * @Description: 
 * @author: momolela
 * @date 2016-9-26 下午4:13:47
 * 
 */
public interface ICommentsService {
	public List<Comments> findAllComments();
	public List<Comments> findAllCommentsByStatus(Integer status);
	public Comments findCommentsById(Integer id);
	public Comments findCommentsByUserId(Integer userid);
	public Comments findCommentsByRoomId(Integer roomid);
	
	public void changeCommentsStatusById(Integer id);
	
	public void delCommentsById(Integer commentsId);
	public void addComments(Comments comments);
}
