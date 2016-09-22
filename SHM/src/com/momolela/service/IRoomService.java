package com.momolela.service;

import java.util.List;

import com.momolela.model.Room;
import com.momolela.model.RoomStyle;

public interface IRoomService {

	public List<Room> queryAllRoom();
	public List<RoomStyle> queryAllRoomStyle();
	public void addRoomStyle(RoomStyle roomStyle);
	public RoomStyle queryRoomStyleByName(String roomStyleName);
	public RoomStyle queryRoomStyleById(String roomStyle);
	public void addRoom(Room room);
	public void delRoomByid(Integer delid);
}