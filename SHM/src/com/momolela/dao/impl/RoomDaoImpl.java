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
}
