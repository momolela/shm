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
import com.momolela.dao.ICommentsDao;
import com.momolela.model.Comments;

@Repository
@Transactional
public class CommentsDaoImpl extends BaseDaoImpl implements ICommentsDao {
	public List<Comments> findAllCommentsByStatus(Integer status) {
		List<Comments> commentsList = new ArrayList<Comments>();
		String hql = "FROM Comments c where c.status=?";
		Query query = getSession().createQuery(hql);
		query.setInteger(0, status);
		commentsList = query.list();
		return commentsList;
	}

	public Comments findCommentsById(Integer id) {
		Comments comments = new Comments();
		String hql = "FROM Comments c where c.id=?";
		Query query = getSession().createQuery(hql);
		query.setInteger(0, id);
		comments = (Comments) query.uniqueResult();
		return comments;
	}

	public Comments findCommentsByUserId(Integer userid) {
		Comments comments = new Comments();
		String hql = "FROM Comments c where c.userId=?";
		Query query = getSession().createQuery(hql);
		query.setInteger(0, userid);
		comments = (Comments) query.uniqueResult();
		return comments;
	}

	public Comments findCommentsByRoomId(Integer roomid) {
		Comments comments = new Comments();
		String hql = "FROM Comments c where c.roomId=?";
		Query query = getSession().createQuery(hql);
		query.setInteger(0, roomid);
		comments = (Comments) query.uniqueResult();
		return comments;
	}

	public List<Comments> findAllComments() {
		List<Comments> commentsList = new ArrayList<Comments>();
		String hql = "FROM Comments";
		Query query = getSession().createQuery(hql);
		commentsList = query.list();
		return commentsList;
	}

	public void delCommentsById(Integer commentsId) {
		Comments comments = (Comments) getSession().get(Comments.class, commentsId);
		getSession().delete(comments);
	}

	public void addComments(Comments comments) {
		getSession().save(comments);
	}

	public void changeCommentsStatusById(Integer id) {
		String hql = "UPDATE Comments c SET c.status='1' WHERE c.id=?";
		Query query = getSession().createQuery(hql);
		query.setInteger(0, id);
		query.executeUpdate();
	}
}
