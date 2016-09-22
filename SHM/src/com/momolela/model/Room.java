package com.momolela.model;

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
 * 客房
 * Room
 * 创建人:momolela
 * 时间：2016年09月06日 19:54:33 
 * @version 1.0.0
 *
 */
@Entity
@Table(name = "hfy_room")
public class Room implements java.io.Serializable {

	private static final long serialVersionUID = 1L;
	private Integer id;
	private String roomName;
	private String roomPic;
	private Integer roomStatus;
	private RoomStyle roomStyle;

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	@Column(name="roomname")
	public String getRoomName() {
		return roomName;
	}

	public void setRoomName(String roomName) {
		this.roomName = roomName;
	}

	@Column(name="roompic")
	public String getRoomPic() {
		return roomPic;
	}

	public void setRoomPic(String roomPic) {
		this.roomPic = roomPic;
	}

	@Column(name="roomstatus")
	public Integer getRoomStatus() {
		return roomStatus;
	}

	public void setRoomStatus(Integer roomStatus) {
		this.roomStatus = roomStatus;
	}

	@ManyToOne
	@JoinColumn(name="roomstyle_id")
	public RoomStyle getRoomStyle() {
		return roomStyle;
	}

	public void setRoomStyle(RoomStyle roomStyle) {
		this.roomStyle = roomStyle;
	}

}