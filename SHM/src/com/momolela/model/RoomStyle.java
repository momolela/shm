package com.momolela.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

/**
 * 
 * 客房的类型，价格和描述
 * RoomStyle
 * 创建人:momolela
 * 时间：2016年09月06日 19:22:16 
 * @version 1.0.0
 *
 */
@Entity
@Table(name = "hfy_roomstyle")
public class RoomStyle implements java.io.Serializable {

	private static final long serialVersionUID = 1L;
	private Integer id;
	private String roomStyle;
	private String price;
	private String roomDesc;
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	public Integer getId() {
		return id;
	}
	
	public void setId(Integer id) {
		this.id = id;
	}

	@Column(name="roomstyle")
	public String getRoomStyle() {
		return roomStyle;
	}

	public void setRoomStyle(String roomStyle) {
		this.roomStyle = roomStyle;
	}

	@Column(name="roomprice")
	public String getPrice() {
		return price;
	}

	public void setPrice(String price) {
		this.price = price;
	}

	@Column(name="roomdesc")
	public String getRoomDesc() {
		return roomDesc;
	}

	public void setRoomDesc(String roomDesc) {
		this.roomDesc = roomDesc;
	}
	
}