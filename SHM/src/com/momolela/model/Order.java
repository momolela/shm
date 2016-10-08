package com.momolela.model;

import java.util.Date;

import javax.persistence.CascadeType;
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
 * 会员预定酒店/订单
 * Order
 * 创建人:momolela
 * 时间：2016年09月07日 00:09:09 
 * @version 1.0.0
 *
 */
@Entity
@Table(name = "hfy_order")
public class Order implements java.io.Serializable {

	private static final long serialVersionUID = 1L;
	private Integer id;
	private Date checkInTime;
	private Date expireTime;
	private Integer orderStatus;
	private User userId;
	private Room roomId;
	private Date createTime;
	private Date updateTime;
	private BillNow billnowid;
	private BillHistory billhistoryid;

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	@Column(name = "checkintime")
	public Date getCheckInTime() {
		return checkInTime;
	}

	public void setCheckInTime(Date checkInTime) {
		this.checkInTime = checkInTime;
	}

	@Column(name = "expiretime")
	public Date getExpireTime() {
		return expireTime;
	}

	public void setExpireTime(Date expireTime) {
		this.expireTime = expireTime;
	}

	@Column(name = "orderstauts")
	public Integer getOrderStatus() {
		return orderStatus;
	}

	public void setOrderStatus(Integer orderStatus) {
		this.orderStatus = orderStatus;
	}

	@ManyToOne
	@JoinColumn(name = "userid")
	public User getUserId() {
		return userId;
	}

	public void setUserId(User userId) {
		this.userId = userId;
	}

	@ManyToOne
	@JoinColumn(name = "roomid")
	public Room getRoomId() {
		return roomId;
	}

	public void setRoomId(Room roomId) {
		this.roomId = roomId;
	}

	@Column(name = "createtime", columnDefinition = "timestamp")
	public Date getCreateTime() {
		return createTime;
	}

	public void setCreateTime(Date createTime) {
		this.createTime = createTime;
	}

	@Column(name = "updatetime")
	public Date getUpdateTime() {
		return updateTime;
	}

	public void setUpdateTime(Date updateTime) {
		this.updateTime = updateTime;
	}

	@ManyToOne(cascade = { CascadeType.MERGE, CascadeType.REFRESH }, optional = true)
	@JoinColumn(name = "billnowid")
	public BillNow getBillnowid() {
		return billnowid;
	}

	public void setBillnowid(BillNow billnowid) {
		this.billnowid = billnowid;
	}

	@ManyToOne(cascade = { CascadeType.MERGE, CascadeType.REFRESH }, optional = true)
	@JoinColumn(name = "billhistoryid")
	public BillHistory getBillhistoryid() {
		return billhistoryid;
	}

	public void setBillhistoryid(BillHistory billhistoryid) {
		this.billhistoryid = billhistoryid;
	}
}