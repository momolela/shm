package com.momolela.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

/**
 * 
 * 消费种类
 * Service
 * 创建人:momolela
 * 时间：2016年09月07日 20:28:39 
 * @version 1.0.0
 *
 */
@Entity
@Table(name = "hfy_service")
public class Service implements java.io.Serializable {

	private static final long serialVersionUID = 1L;
	private Integer id;
	private String serviceType;
	private String price;

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	@Column(name="servicetype")
	public String getServiceType() {
		return serviceType;
	}

	public void setServiceType(String serviceType) {
		this.serviceType = serviceType;
	}

	@Column(name="price")
	public String getPrice() {
		return price;
	}

	public void setPrice(String price) {
		this.price = price;
	}
}