package com.momolela.model;

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
 * 消费订单
 * ServiceOrder
 * 创建人:momolela
 * 时间：2016年09月07日 20:37:54 
 * @version 1.0.0
 *
 */
@Entity
@Table(name = "hfy_serviceorder")
public class ServiceOrder implements java.io.Serializable {

	private static final long serialVersionUID = 1L;
	private Integer id;
	private User userId;
	private Service serviceId;
	private String allMoney;
	private Integer status;
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

	@ManyToOne
	@JoinColumn(name="userid")
	public User getUserId() {
		return userId;
	}

	public void setUserId(User userId) {
		this.userId = userId;
	}

	@ManyToOne
	@JoinColumn(name="serviceid")
	public Service getServiceId() {
		return serviceId;
	}

	public void setServiceId(Service serviceId) {
		this.serviceId = serviceId;
	}

	@Column(name="allmoney")
	public String getAllMoney() {
		return allMoney;
	}

	public void setAllMoney(String allMoney) {
		this.allMoney = allMoney;
	}

	@Column(name = "status", length = 1)
	public Integer getStatus() {
		return status;
	}

	public void setStatus(Integer status) {
		this.status = status;
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