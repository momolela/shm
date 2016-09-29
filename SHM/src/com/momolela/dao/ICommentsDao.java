/**   
 * @Title: ICommentsDao.java  
 * @Package com.momolela.dao  
 * @Description: TODO  
 * @author momolela   
 * @date 2016-9-29 上午9:28:59  
 * @version V1.0   
 */
package com.momolela.dao;

import java.util.List;

import com.momolela.model.Comments;

/**
 * @ClassName: ICommentsDao
 * @Description: 
 * @author: momolela
 * @date 2016-9-29 上午9:28:59
 * 
 */
public interface ICommentsDao {
	public List<Comments> findAllComments();
	public List<Comments> findAllCommentsByStatus(Integer status);
	public Comments findCommentsById(Integer id);
	public Comments findCommentsByUserId(Integer userid);
	public Comments findCommentsByRoomId(Integer roomid);
	public void delCommentsById(Integer commentsId);
	public void addComments(Comments comments);

}
