package com.momolela.model;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

/**
 * 
 * 留言表
 * Comments
 * 创建人:momolela
 * 时间：2016年09月07日 21:00:46 
 * @version 1.0.0
 *
 */
@Entity
@Table(name = "hfy_comments")
public class Comments implements java.io.Serializable {

	private static final long serialVersionUID = 1L;
	private Integer id;
	private String comments;
	private Date createTime;
	private User userId;
	private Room roomId;

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	@Column(name="comments")
	public String getComments() {
		return comments;
	}

	public void setComments(String comments) {
		this.comments = comments;
	}

	@Column(name = "createtime", columnDefinition = "timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP")
	public Date getCreateTime() {
		return createTime;
	}

	public void setCreateTime(Date createTime) {
		this.createTime = createTime;
	}

	@ManyToOne
	@JoinColumn(name="userid")
	public User getUserId() {
		return userId;
	}

	public void setUserId(User userId) {
		this.userId = userId;
	}

	@ManyToOne
	@JoinColumn(name="roomid")
	public Room getRoomId() {
		return roomId;
	}

	public void setRoomId(Room roomId) {
		this.roomId = roomId;
	}
}