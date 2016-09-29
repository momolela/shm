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
 * 客房图片
 * RoomPic
 * 创建人:momolela
 * 时间：2016年09月06日 19:54:33 
 * @version 1.0.0
 *
 */
@Entity
@Table(name = "hfy_roompic")
public class RoomPic implements java.io.Serializable {

	private static final long serialVersionUID = 1L;
	private Integer id;
	private String roomPic;
	private Room room;

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	@Column(name="roompic")
	public String getRoomPic() {
		return roomPic;
	}

	public void setRoomPic(String roomPic) {
		this.roomPic = roomPic;
	}

	@ManyToOne
	@JoinColumn(name="room_id")
	public Room getRoom() {
		return room;
	}

	public void setRoom(Room room) {
		this.room = room;
	}
}