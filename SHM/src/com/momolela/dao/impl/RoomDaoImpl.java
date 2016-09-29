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
import com.momolela.dao.IRoomDao;
import com.momolela.model.Room;
import com.momolela.model.RoomPic;
import com.momolela.model.RoomStyle;
import com.momolela.model.User;

@Repository
@Transactional
public class RoomDaoImpl extends BaseDaoImpl implements IRoomDao {
	public List<Room> queryAllRoom() {
		List<Room> roomlist = new ArrayList<Room>();
		String hql = "from Room";
		Query query = getSession().createQuery(hql);
		roomlist = (List<Room>) query.list();
		return roomlist;
	}

	public List<RoomStyle> queryAllRoomStyle() {
		List<RoomStyle> roomStyleList = new ArrayList<RoomStyle>();
		String hql = "from RoomStyle";
		Query query = getSession().createQuery(hql);
		roomStyleList = (List<RoomStyle>) query.list();
		return roomStyleList;
	}

	public void addRoomStyle(RoomStyle roomStyle) {
		getSession().save(roomStyle);
	}

	public RoomStyle queryRoomStyleByName(String roomStyleName) {
		RoomStyle roomStyle = new RoomStyle();
		String hql = "from RoomStyle where roomStyle = ?";
		Query query = getSession().createQuery(hql);
		query.setString(0, roomStyleName);
		roomStyle = (RoomStyle) query.uniqueResult();
		return roomStyle;
	}

	public RoomStyle queryRoomStyleById(String roomStyle) {
		RoomStyle roomstyle = new RoomStyle();
		String hql = "from RoomStyle where id = ?";
		Query query = getSession().createQuery(hql);
		query.setInteger(0, Integer.parseInt(roomStyle));
		roomstyle = (RoomStyle) query.uniqueResult();
		return roomstyle;
	}

	public void addRoom(Room room) {
		getSession().save(room);
	}

	public void delRoomByid(Integer delid) {
		Room room = (Room) getSession().get(Room.class, delid);
		getSession().delete(room);
	}

	public void updateRoomOne(Room room, Integer roomId) {
		String hql = "UPDATE Room r SET r.roomName=?, r.roomStatus=?, r.roomStyle=? WHERE r.id=?";
		Query query = getSession().createQuery(hql);
		query.setString(0, room.getRoomName());
		query.setInteger(1, room.getRoomStatus());
		query.setInteger(2, room.getRoomStyle().getId());
		query.setInteger(3, roomId);
		query.executeUpdate();
	}

	public void updateRoomStyle(RoomStyle roomStyle, Integer roomStyleId) {
		String hql = "UPDATE RoomStyle r SET r.price=?, r.roomDesc=?, r.roomStyle=? WHERE r.id=?";
		Query query = getSession().createQuery(hql);
		query.setString(0, roomStyle.getPrice());
		query.setString(1, roomStyle.getRoomDesc());
		query.setString(2, roomStyle.getRoomStyle());
		query.setInteger(3, roomStyleId);
		query.executeUpdate();
	}

	public Room queryRoomByName(String roomName) {
		Room room = new Room();
		String hql = "FROM Room r WHERE r.roomName = ?";
		Query query = getSession().createQuery(hql);
		query.setString(0, roomName);
		room = (Room) query.uniqueResult();
		return room;
	}

	public void addRoomPic(RoomPic roomPic) {
		getSession().save(roomPic);
	}

	public void delRoomPic(Integer delid) {
		String hql = "delete From RoomPic r where r.room = ?";
		Query query = getSession().createQuery(hql);
		query.setInteger(0, delid);
		query.executeUpdate();
	}

	public List<RoomPic> queryRoomPicByRoomId(Integer roomid) {
		List<RoomPic> roomPicList = new ArrayList<RoomPic>();
		String hql = "FROM RoomPic r WHERE r.room = ?";
		Query query = getSession().createQuery(hql);
		query.setInteger(0, roomid);
		roomPicList = query.list();
		return roomPicList;
	}
}
