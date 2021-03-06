/**   
 * @Title: RoomManageAction.java  
 * @Package com.momolela.web.user  
 * @Description: TODO  
 * @author momolela   
 * @date 2016-9-18 上午11:30:21  
 * @version V1.0   
 */
package com.momolela.web.user;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.interceptor.ServletRequestAware;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import com.momolela.core.action.BaseAction;
import com.momolela.model.Room;
import com.momolela.model.RoomPic;
import com.momolela.model.RoomStyle;
import com.momolela.service.IRoomService;

/**
 * 
 * @ClassName: RoomManageAction
 * @Description: 客房管理的模块
 * @author: momolela
 * @date 2016-9-18 上午11:30:21
 * 
 */
@Controller("roomManageAction")
@Scope("prototype")
public class RoomManageAction extends BaseAction implements ServletRequestAware{
	private Map<String, Object> datamap = new HashMap<String, Object>();
	HttpServletRequest request;
	
	@Autowired
	private IRoomService iRoomService;

	public Map<String, Object> getDatamap() {
		return datamap;
	}

	public void setDatamap(Map<String, Object> datamap) {
		this.datamap = datamap;
	}
	
	/**
	 * 查询所有的客房
	 * @return String
	 */
	public String queryAllRoom(){
		List<Room> roomList = iRoomService.queryAllRoom();
		Map<String, Object> roomMap = null;
		List<Map<String, Object>> roomMapList = new ArrayList<Map<String,Object>>();
		for(Room room:roomList){
			roomMap = new HashMap<String, Object>();
			String roomPrice = room.getRoomStyle().getPrice();
			String roomDesc = room.getRoomStyle().getRoomDesc();
			String roomStyleid = room.getRoomStyle().getId().toString();
			String roomStyleName = room.getRoomStyle().getRoomStyle();
			// 查询所有的列
			roomMap.put("id", room.getId().toString());
			roomMap.put("roomName", room.getRoomName());
			roomMap.put("roomPicIcon", "<img src='../../images/admin/image/aggre2.png' class='roomPicIcon' id='roomPicIcon' onClick='roomPic(this)' roomid='"+room.getId().toString()+"' width='19' height='15' style='cursor:pointer;'/>");
			roomMap.put("roomStatus", room.getRoomStatus());
			roomMap.put("parentid", roomStyleName);
			roomMap.put("roomPrice", roomPrice);
			roomMap.put("roomDesc", roomDesc);
			roomMap.put("roomStyleid", roomStyleid);
			roomMap.put("roomStyleName", roomStyleName);
			roomMap.put("expanded", true);
			roomMapList.add(roomMap);
		}
		// 查询目录分类
		List<RoomStyle> roomStyleList = iRoomService.queryAllRoomStyle();
		for(RoomStyle roomStyle : roomStyleList){
			roomMapList.add(formatCatalog(roomStyle));
		}
		datamap.put("roomMapList", roomMapList);
		result = "success";
		return AJAX_SUCCESS;
	}

	/**
	 * 客房的目录的查询展示
	 * @param roomStyle
	 * @return Map<String, Object>
	 */
	private Map<String, Object> formatCatalog(RoomStyle roomStyle) {
		Map<String, Object> value = new HashMap<String, Object>();
		value.put("isCatalog", true);
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("id", roomStyle.getRoomStyle());
		map.put("parentid", null);
		map.put("roomName", roomStyle.getRoomStyle());
		map.put("value", value);
		map.put("icon", "../../images/admin/image/folder.png");
		map.put("expanded", true);
		return map;
	}

	/**
	 * 查询所有的客房类型对象
	 * @return roomStyle
	 */
	public String queryAllRoomStyle(){
		List<RoomStyle> roomStyleList = iRoomService.queryAllRoomStyle();
		datamap.put("roomStyleList", roomStyleList);
		result = "success";
		return AJAX_SUCCESS;
	}
	
	/**
	 * 添加客房类型
	 * @return
	 */
	public String addRoomStyle(){
		String roomStyleName = request.getParameter("roomStyleName");
		String roomPrice = request.getParameter("roomPrice");
		String roomDesc = request.getParameter("roomDesc");
		RoomStyle roomStyle = new RoomStyle();
		roomStyle.setRoomStyle(roomStyleName);
		roomStyle.setPrice(roomPrice);
		roomStyle.setRoomDesc(roomDesc);
		iRoomService.addRoomStyle(roomStyle);
		result = "success";
		return AJAX_SUCCESS;
	}
	
	/**
	 * 检查客房类型名是否已经用过了
	 * @return
	 */
	public String checkRoomStyle(){
		String roomStyleNmae = request.getParameter("roomStyleName");
		RoomStyle roomStyle = iRoomService.queryRoomStyleByName(roomStyleNmae);
		if(roomStyle!=null){
			result = "success";
		}
		return AJAX_SUCCESS;
	}
	
	/**
	 * 添加客房
	 * @return
	 */
	public String addRoom(){
		String roomName = request.getParameter("roomName");
		String roomStyle = request.getParameter("roomStyle");
		String urlArr[] = request.getParameterValues("urlArr");
		Room room = new Room();
		room.setRoomName(roomName);
		room.setRoomStatus(0);
		RoomStyle roomstyle = iRoomService.queryRoomStyleById(roomStyle);
		room.setRoomStyle(roomstyle);
		iRoomService.addRoom(room);
		// 返回roomid
		Room room1 = iRoomService.queryRoomByName(roomName);
		// 往roompic表中添加记录
		for(String url:urlArr){
			RoomPic roomPic = new RoomPic();
			roomPic.setRoom(room1);
			roomPic.setRoomPic(url);
			iRoomService.addRoomPic(roomPic);
		}
		result = "success";
		return AJAX_SUCCESS;
	}
	
	/**
	 * 删除客房
	 * @return
	 */
	public String delRoom(){
		String[] delRoomId = request.getParameterValues("delRoomId");
		for(String delroomid:delRoomId){
			Integer delid = Integer.parseInt(delroomid);
			// 先删除roomPic表中的记录
			iRoomService.delRoomPic(delid);
			iRoomService.delRoomByid(delid);
		}
		result = "success";
		return AJAX_SUCCESS;
	}
	
	/**
	 * 编辑客房(单一)
	 */
	public String editRoomOne(){
		Integer roomId = Integer.parseInt(request.getParameter("roomId"));
		String roomName = request.getParameter("roomNameEdit");
		String roomStatus = request.getParameter("roomStatusEdit");
		String roomStyle = request.getParameter("roomStyleEdit");
		Room room = new Room();
		room.setRoomName(roomName);
		room.setRoomStatus(Integer.parseInt(roomStatus));
		room.setRoomStyle(iRoomService.queryRoomStyleById(roomStyle));
		iRoomService.updateRoomOne(room,roomId);
		result = "success";
		return AJAX_SUCCESS;
	}
	
	/**
	 * 编辑客房(同类)
	 */
	public String editRoomType(){
		Integer roomStyleId = Integer.parseInt(request.getParameter("roomStyleId"));
		String roomPrice = request.getParameter("roomPrice");
		String roomDesc = request.getParameter("roomDesc");
		String roomStyleName = request.getParameter("roomStyleName");
		RoomStyle roomStyle = new RoomStyle();
		roomStyle.setPrice(roomPrice);
		roomStyle.setRoomDesc(roomDesc);
		roomStyle.setRoomStyle(roomStyleName);
		iRoomService.updateRoomStyle(roomStyle,roomStyleId);
		result = "success";
		return AJAX_SUCCESS;
	}
	
	public String queryRoomPicByRoomId(){
		List<String> roomPicUrl = new ArrayList<String>();
		Integer roomid = Integer.parseInt(request.getParameter("roomid"));
		List<RoomPic> roomPicList = iRoomService.queryRoomPicByRoomId(roomid);
		for(RoomPic roompic :roomPicList){
			roomPicUrl.add(roompic.getRoomPic());
		}
		datamap.put("roomPicUrl", roomPicUrl);
		datamap.put("roomPicList", roomPicList);
		result = "success";
		return AJAX_SUCCESS;
	}
	
	public String queryAllRoomByRoomStyleId(){
		Integer roomstyleid = Integer.parseInt(request.getParameter("roomstyleid"));
		List<Room> roomList = iRoomService.queryAllRoomByRoomStyleId(roomstyleid);
		datamap.put("roomList", roomList);
		result = "success";
		return AJAX_SUCCESS;
	}
	
	public String updateRoomStatus(){
		Integer status = Integer.parseInt(request.getParameter("status"));
		Integer roomId = Integer.parseInt(request.getParameter("roomid"));
		iRoomService.updateRoomStatus(status,roomId);
		result = "success";
		return AJAX_SUCCESS;
	}
	
	public String updateRoomStatusById(){
		Integer roomidNow = Integer.parseInt(request.getParameter("roomidNow"));
		Integer roomidHistory = Integer.parseInt(request.getParameter("roomidHistory"));
		iRoomService.updateRoomStatus(2, roomidNow);
		iRoomService.updateRoomStatus(0, roomidHistory);
		result = "success";
		return AJAX_SUCCESS;
	}

	public void setServletRequest(HttpServletRequest request) {
		this.request = request;
	}
}
