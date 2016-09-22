/**   
 * @Title: UserServiceImpl.java  
 * @Package com.momolela.service.impl  
 * @Description: TODO  
 * @author momolela   
 * @date 2016-5-12 下午6:17:42  
 * @version V1.0   
 */
package com.momolela.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.momolela.dao.IRoomDao;
import com.momolela.model.Room;
import com.momolela.model.RoomStyle;
import com.momolela.service.IRoomService;

/**
 * 
 * @ClassName: RoomServiceImpl
 * @Description: 
 * @author: momolela
 * @date 2016-6-14 上午11:52:46
 * 
 */
@Service
public class RoomServiceImpl implements IRoomService {

	@Autowired
	private IRoomDao iRoomDao;

	public List<Room> queryAllRoom() {
		return iRoomDao.queryAllRoom();
	}

	public List<RoomStyle> queryAllRoomStyle() {
		return iRoomDao.queryAllRoomStyle();
	}

	public void addRoomStyle(RoomStyle roomStyle) {
		iRoomDao.addRoomStyle(roomStyle);
	}

	public RoomStyle queryRoomStyleByName(String roomStyleName) {
		return iRoomDao.queryRoomStyleByName(roomStyleName);
	}

	public RoomStyle queryRoomStyleById(String roomStyle) {
		return iRoomDao.queryRoomStyleById(roomStyle);
	}

	public void addRoom(Room room) {
		iRoomDao.addRoom(room);
	}

	public void delRoomByid(Integer delid) {
		iRoomDao.delRoomByid(delid);
	}

}
