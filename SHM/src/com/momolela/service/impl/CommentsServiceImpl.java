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

import com.momolela.dao.ICommentsDao;
import com.momolela.model.Comments;
import com.momolela.service.ICommentsService;

/**
 * 
 * @ClassName: UserServiceImpl
 * @Description: 
 * @author: momolela
 * @date 2016-6-14 上午11:52:46
 * 
 */
@Service
public class CommentsServiceImpl implements ICommentsService {

	@Autowired
	private ICommentsDao commentsDao;

	public List<Comments> findAllCommentsByStatus(Integer status) {
		return commentsDao.findAllCommentsByStatus(status);
	}

	public Comments findCommentsById(Integer id) {
		return commentsDao.findCommentsById(id);
	}

	public Comments findCommentsByUserId(Integer userid) {
		return commentsDao.findCommentsByUserId(userid);
	}

	public Comments findCommentsByRoomId(Integer roomid) {
		return commentsDao.findCommentsByRoomId(roomid);
	}

	public List<Comments> findAllComments() {
		return commentsDao.findAllComments();
	}

	public void delCommentsById(Integer commentsId) {
		commentsDao.delCommentsById(commentsId);
	}

	public void addComments(Comments comments) {
		commentsDao.addComments(comments);
	}

	public void changeCommentsStatusById(Integer id) {
		commentsDao.changeCommentsStatusById(id);
	}

}
