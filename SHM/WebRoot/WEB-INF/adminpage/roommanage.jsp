<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@include file="/commons/taglib.jsp" %>
<!doctype html>
<html >
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
		<title>客房管理</title>
		<%@include file="/commons/public.jsp" %>
		<script type="text/javascript" src="${basePath}/js/swfupload/tz_upload.js"></script>
		<style type="text/css">
			body{font-size:12px;font-family:"Microsoft Yahei";color:#666;}
			.fm_content{width:100%;background:#282828;}

			/*t_left start*/
			.fm_content .t_left{width:200px;height:800px;background:#282828;position:fixed;left:0;top:0;z-index:2;}
			.fm_content .t_left .l_logo{width:100%;height:108px;border-bottom:1px solid #000000;cursor:pointer;background:url("${basePath }/images/admin/index/logo.png") no-repeat center;}
			.fm_content .t_left .l_nav{width:100%;border-bottom:1px solid #414141;}
			.fm_content .t_left .l_nav ul li{border-bottom:1px solid #000000;line-height:52px;border-top:1px solid #414141;}
			.fm_content .t_left .l_nav ul li a{display:block;padding-left:30px;}
			.fm_content .t_left .l_nav ul li a:hover{background:#25c016;}
			.fm_content .t_left .l_nav ul li a i{width:16px;height:16px;display:block;background:url("${basePath}/images/admin/index/ht_icon.png") no-repeat;float:left;margin-top:20px;}
			.fm_content .t_left .l_nav ul li a .icon_1{background-position:-1px -25px;}
			.fm_content .t_left .l_nav ul li a .icon_2{background-position:-32px -52px;}
			.fm_content .t_left .l_nav ul li a .icon_3{background-position:-295px -52px;}
			.fm_content .t_left .l_nav ul li a .icon_4{background-position:-254px -52px;}
			.fm_content .t_left .l_nav ul li a .icon_5{background-position:-274px -52px;}
			.fm_content .t_left .l_nav ul li a .icon_6{background-position:-150px -25px;width:19px;height:17px;margin-top:20px;}
			.fm_content .t_left .l_nav ul li a span{font-size:14px;color:#fff;padding-left:10px;}

			/*t_header start*/
			.fm_content .t_header{width:100%;height:56px;background:#2f3437;position:relative;z-index:1;}

			/*h_nav start*/
			.fm_content .t_header .h_nav{height:56px;margin-left:200px;float:left;}
			.fm_content .t_header .h_nav ul li{float:left;width:110px;height:56px;border-left:1px solid #414141;border-right:1px solid #000;}
			.fm_content .t_header .h_nav ul li a{display:block;color:#838383;text-align:center;padding-top:8px;}
			.fm_content .t_header .h_nav ul li a:hover{color:#fff;}
			.fm_content .t_header .h_nav ul li a i{display:block;width:18px;height:17px;background:url("${basePath}/images/admin/index/ht_icon.png") no-repeat;margin:3px auto;}
			.fm_content .t_header .h_nav ul li .h_sel{color:#fff;}
			.fm_content .t_header .h_nav ul li a .h_icon1{background-position:0 0;}
			.fm_content .t_header .h_nav ul li a:hover .h_icon1{background-position:-0px -25px;}
			.fm_content .t_header .h_nav ul li a .h_icon2{background-position:-24px 0px;}
			.fm_content .t_header .h_nav ul li a:hover .h_icon2{background-position:-24px -25px;}
			.fm_content .t_header .h_nav ul li a .h_icon3{background-position:-48px -25px;}
			.fm_content .t_header .h_nav ul li a .h_icon4{background-position:-68px 0;}
			.fm_content .t_header .h_nav ul li a:hover .h_icon4{background-position:-68px -25px;}
			.fm_content .t_header .h_nav ul li a .h_icon5{background-position:-91px 0;}
			.fm_content .t_header .h_nav ul li a:hover .h_icon5{background-position:-91px -25px;}
			.fm_content .t_header .h_nav ul li a .h_icon6{background-position:-113px 0;}
			.fm_content .t_header .h_nav ul li a:hover .h_icon6{background-position:-113px -25px;}
			.fm_content .t_header .h_nav ul li a .h_icon7{background-position:-133px 0;}
			.fm_content .t_header .h_nav ul li a:hover .h_icon7{background-position:-133px -25px;}

			/*h_info start*/
			.fm_content .t_header .h_info{height:56px;position:absolute;top:0;right:10px;}
			.fm_content .t_header .h_info .h_user{line-height:56px;color:#fff;float:left;}
			.fm_content .t_header .h_info .h_out{width:65px;height:30px;background:#25c016;margin:13px 5px 0 10px;float:right;}
			.fm_content .t_header .h_info .h_out a{display:block;line-height:30px;color:#fff;padding-left:10px;}
			.fm_content .t_header .h_info .h_out a span{float:left;}
			.fm_content .t_header .h_info .h_out a i{width:14px;height:14px;display:block;background:url("${basePath}/images/admin/index/ht_icon.png") no-repeat 0 -51px;float:left;margin:6px 8px;}

			/*t_right start*/
			.fm_content .t_right{background:#fff;margin-left:200px;}

			/*r_location start*/
			.fm_content .t_right .r_location{height:51px;background:#e5e5e5;border-bottom:1px solid #ccc;line-height:51px;}
			.fm_content .t_right .r_location i{width:14px;height:18px;display:block;background:url("${basePath}/images/admin/index/ht_icon.png") no-repeat;background-position:-16px -51px;float:left;margin:16px 20px 0 20px;}

			.rpClose:hover{background:rgba(255,255,255,.6);}
			
			/*清除浮动*/
			.clear{clear:both;}

			/*头部导航和消息提示小于1360的时候 用下边的样式*/
			@media screen and (max-width:1360px){
			/*h_nav start*/
			.fm_content .t_header .h_nav{margin-left:200px;}
			.fm_content .t_header .h_nav ul li{width:80px;}

			.fm_content .t_right .r_message .m_list .m_pic{display:none;}
			.fm_content .t_right .r_message .m_list .m_desc{text-align:center;}
			}

			/*头部导航和左侧导航小于1024的时候 用下边的样式*/
			@media screen and (max-width:1024px){
			/*t_left start*/
			.fm_content .t_left{width:50px;}
			.fm_content .t_left .l_logo{height:54px;background:url("${basePath}/images/admin/index/logo1.png") no-repeat center;}
			.fm_content .t_left .l_nav ul li a{padding-left:16px;height:52px;}
			.fm_content .t_left .l_nav ul li a span{display:none;}

			/*h_nav start*/
			.fm_content .t_header .h_nav{margin-left:50px;}
			.fm_content .t_header .h_nav ul li{width:60px;}
			.fm_content .t_header .h_nav ul li a span{display:none;}
			.fm_content .t_header .h_nav ul li a i{margin:14px auto;}

			.fm_content .t_header .h_info .h_user{display:none;}
			.fm_content .t_right{margin-left:50px;}
			.fm_content .t_right .r_location{margin-left:0px;}
			.fm_content .t_right .r_message{margin-left:50px;}
			.fm_content .t_right .r_table{margin-left:60px;}
			}
			
			#SWFUpload_0{width: 120px;height: 30px;opacity: 0;}
		</style>

	</head>

<body>
	<div class="fm_content">

		<!--t_left start-->
		<div class="t_left">
			<div class="l_logo" onclick="toIndex()"></div>
			<div class="l_nav">
				<ul>
					<li>
						<a href="#">
							<i class="icon_1"></i>
							<span>管理控制台</span>
						</a>
					</li>
					<li>
						<a href="#">
							<i class="icon_2"></i>
							<span>站长工具</span>
						</a>
					</li>
					<li>
						<a href="#">
							<i class="icon_3"></i>
							<span>站内数据分析</span>
						</a>
					</li>
					<li>
						<a href="#">
							<i class="icon_4"></i>
							<span>表格表单类</span>
						</a>
					</li>
					<li>
						<a href="#">
							<i class="icon_5"></i>
							<span>日历类</span>
						</a>
					</li>
					<li>
						<a href="#">
							<i class="icon_6"></i>
							<span>网站设置</span>
						</a>
					</li>
				</ul>
			</div>
		</div>
		<!--t_left end-->
		
		<!--t_header start-->
		<div class="t_header">
			<!--h_nav start-->
			<div class="h_nav">
				<ul>
					<li>
						<a href="${basePath }/toadmin/adminPage/toAdminIndex">
							<i class="h_icon1"></i>
							<span>首页</span>
						</a>
					</li>
					<li>
						<a href="${basePath }/toadmin/adminPage/toPageManage">
							<i class="h_icon2"></i>
							<span>界面管理</span>
						</a>
					</li>
					<li>
						<a href="#"  class="h_sel">
							<i class="h_icon3"></i>
							<span>客房管理</span>
						</a>
					</li>
					<li>
						<a href="${basePath }/toadmin/adminPage/toCheckoutCenter">
							<i class="h_icon4"></i>
							<span>结算中心</span>
						</a>
					</li>
					<li>
						<a href="${basePath }/toadmin/adminPage/toCustomerManage">
							<i class="h_icon5"></i>
							<span>用户管理</span>
						</a>
					</li>
					<li>
						<a href="${basePath }/toadmin/adminPage/toCommentsCenter">
							<i class="h_icon6"></i>
							<span>评论中心</span>
						</a>
					</li>
 					<li>
						<a href="${basePath }/toadmin/adminPage/toHotelInformation">
							<i class="h_icon7"></i>
							<span>酒店资讯</span>
						</a>
					</li>
				</ul>				
			</div>
			<!--end h_nav-->

			<!--h_info start-->
			<div class="h_info">
				<div class="h_user">当前用户：admin , 身份：系统管理员</div>
				<div class="h_out">
					<a href="${basePath }/users/admin/logout">
						<span>退出</span>
						<i></i>
					</a>
				</div>
			</div>
			<!--end h_info-->
		
		</div>
		<!--end t_header-->

		<!--t_right start-->
		<div class="t_right">

			<!--r_location start-->
			<div class="r_location">
				<i></i>
				<p>您当前所在位置：首页 &gt; 客房管理</p>
			</div>
			<!--end r_location-->
			
			<!-- leftToolber start -->
			<div class="leftToolber" style="height:490px;width:94%;margin-left:30px;margin-top:20px;">
				<div id="indGrid" style="border:1px solid #eee;"></div>
				<div id="gridToolber" style='overflow: hidden; position: relative; height: 100%; width: 90%;'>
					<div style='float: left; padding: 2px; margin: 2px;'>
						<input type="button" id='addRoomStyle' value="增加客房类型"/>
					</div>
					<div style='float: left; padding: 2px; margin: 2px;'>
						<input type="button" id='addRoom' value="增加客房"/>
					</div>
					<div style='float: left; padding: 2px; margin: 2px;'>
						<input type="button" id='delRoom' value="删除客房" />
					</div>
					<div style='float: left; padding: 2px; margin: 2px;'>
						<input type="button" id='editRoomOne' value="编辑客房(单一)" />
					</div>
					<div style='float: left; padding: 2px; margin: 2px;'>
						<input type="button" id='editRoomType' value="编辑客房(同类)" />
					</div>
				</div>
			</div>
			<!-- end leftToolber -->
			
			<!-- addRoomStyleBox start -->
			<div class="addRoomStyleBox">
				<div id="addRoomStyleBoxHeader">
					<span id="configContainer" style="float: left">增加客房类型</span>
				</div>
				<div id="addRoomStyleBoxContent" style="overflow: hidden;position:relative;">
					<div class="errormsg" style="display:none;position:absolute;top:8px;left:102px;color:red;font-size:13px;">该客房类型已经存在~</div>
					<div class="input" style="width:330px;height:60%;margin:20px auto 0 auto;">
						<span style="display:inline-block;width:80px;height:40px;font-size:15px;line-height:40px;">客房类型：</span><input type="text" style="width:237px;height:30px;padding-left:10px;" class="roomStyleName" id="roomStyleName"/><br/>
						<span style="display:inline-block;width:80px;height:40px;font-size:15px;line-height:40px;">客房价格：</span><input type="text" style="width:237px;height:30px;padding-left:10px;" class="roomPrice" id="roomPrice"/><br/>
						<span style="display:inline-block;width:80px;height:40px;font-size:15px;line-height:40px;">客房描述：</span><input type="text" style="width:237px;height:30px;padding-left:10px;" class="roomDesc" id="roomDesc"/>
					</div>
					<div style="position:absolute;bottom:20px;left:85px;">
						<input type="button" value="确定" id="ooButton_addrms" />
						<input type="button" value="取消" id="ccButton_addrms" style="margin-left:50px;"/>
					</div>
				</div>
			</div>
			<!-- addRoomStyleBox end -->
			
			<!-- addRoomBox start -->
			<div class="addRoomBox">
				<div id="addRoomBoxHeader">
					<span id="configContainer" style="float: left">增加客房</span>
				</div>
				<div id="addRoomBoxContent" style="overflow: hidden;position:relative;">
					<div class="errormsg" style="display:none;position:absolute;top:8px;left:102px;color:red;font-size:13px;">该客房已经存在~</div>
					<div class="input" style="width:330px;height:60%;margin:20px auto 0 auto;">
						<div style="width:100%;height:40px;"><span style="display:inline-block;width:80px;height:40px;font-size:15px;line-height:40px;">客房名称：</span><input type="text" style="width:237px;height:30px;padding-left:10px;" class="roomName" id="roomName"/></div>
						<div style="width:100%;height:40px;"><span style="display:inline-block;width:80px;height:40px;font-size:15px;line-height:40px;float:left;">客房图片：</span><div style="background:#eee;width:120px;height:30px;float:left;margin-top:6px;border-radius:3px;color:#333;line-height:30px;text-align:center;font-size:13px;"><input type="file" class="roomPic" id="roomPic" name="bimg"/></div></div>
						<div style="width:100%;height:40px;"><span style="display:inline-block;width:80px;height:40px;font-size:15px;line-height:40px;float:left;">客房类型：</span><div style="float:left;width:237px;height:30px;margin-top:5px;" class="roomStyle" id="roomStyle"></div></div>
					</div>
					<div style="position:absolute;bottom:20px;left:85px;">
						<input type="button" value="确定" id="ooButton_addrm" />
						<input type="button" value="取消" id="ccButton_addrm" style="margin-left:50px;"/>
					</div>
				</div>
			</div>
			<!-- addRoomBox end -->
			
			<!-- delRoomBox start -->
			<div class="delRoomBox">
				<div id="delRoomBoxHeader">
					<span id="configContainer" style="float: left">删除客房</span>
				</div>
				<div id="delRoomBoxContent" style="overflow: hidden;position:relative;">
					<div class="input" style="width:100%;height:30%;text-align:center;margin-top:16px;">你确定要删除选中的客房吗？？？</div>
					<div style="position:absolute;bottom:20px;left:36px;width:78%;">
						<input type="button" value="确定" id="ooButton_delrm" />
						<input type="button" value="取消" id="ccButton_delrm" style="margin-left:50px;"/>
					</div>
				</div>
			</div>
			<!-- delRoomBox end -->
			
			<!-- editRoomOneBox start -->
			<div class="editRoomOneBox">
				<div id="editRoomOneBoxHeader">
					<span id="configContainer" style="float: left">编辑客房（单一）</span>
				</div>
				<div id="editRoomOneBoxContent" style="overflow: hidden;position:relative;">
					<div class="input" style="width:330px;height:60%;margin:20px auto 0 auto;">
						<div style="width:100%;height:40px;"><span style="display:inline-block;width:80px;height:40px;font-size:15px;line-height:40px;">客房名称：</span><input type="text" style="width:237px;height:30px;padding-left:10px;" class="roomNameEdit" id="roomNameEdit"/></div>
						<div style="width:100%;height:40px;"><span style="display:inline-block;width:80px;height:40px;font-size:15px;line-height:40px;float:left;">客房状态：</span><div style="float:left;width:237px;height:30px;margin-top:5px;" class="roomStatusEdit" id="roomStatusEdit"></div></div>
						<div style="width:100%;height:40px;"><span style="display:inline-block;width:80px;height:40px;font-size:15px;line-height:40px;float:left;">客房类型：</span><div style="float:left;width:237px;height:30px;margin-top:5px;" class="roomStyleEdit" id="roomStyleEdit"></div></div>
					</div>
					<div style="position:absolute;bottom:20px;left:85px;">
						<input type="button" value="确定" id="ooButton_editrmo" />
						<input type="button" value="取消" id="ccButton_editrmo" style="margin-left:50px;"/>
					</div>
				</div>
			</div>
			<!-- editRoomOneBox end -->
			
			<!-- editRoomBox start -->
			<div class="editRoomBox">
				<div id="editRoomBoxHeader">
					<span id="configContainer" style="float: left">编辑客房（同类）</span>
				</div>
				<div id="editRoomBoxContent" style="overflow: hidden;position:relative;">
					<div class="input" style="width:330px;height:60%;margin:20px auto 0 auto;">
						<div style="width:100%;height:40px;"><div style="margin-left:10px;width:60px;height:40px;line-height:40px;float:left;">客房类型：</div><input class="roomStyleNameEdit" id="roomStyleNameEdit" style="padding-left:5px;margin-top:6px;width:225px;height:30px;float:left;" type="text"/></div>
						<div style="width:100%;height:40px;margin-top:5px;"><div style="margin-left:10px;width:60px;height:40px;line-height:40px;float:left;">客房价格：</div><input class="roomPriceEdit" id="roomPriceEdit" style="padding-left:5px;margin-top:6px;width:225px;height:30px;float:left;" type="text"/></div>
						<div style="width:100%;height:40px;margin-top:5px;"><div style="margin-left:10px;width:60px;height:40px;line-height:40px;float:left;">客房描述：</div><input class="roomDescEdit" id="roomDescEdit" style="padding-left:5px;margin-top:6px;width:225px;height:30px;float:left;" type="text"/></div>
					</div>
					<div style="position:absolute;bottom:20px;left:85px;">
						<input type="button" value="确定" id="ooButton_editrm" />
						<input type="button" value="取消" id="ccButton_editrm" style="margin-left:50px;"/>
					</div>
				</div>
			</div>
			<!-- editRoomBox end -->
			
			<!-- picBox start -->
			<div class="picBox" id="picBox" style="display:none;background:#fff;width:600px;height:400px;position:absolute;top:50%;left:50%;margin-top:-200px;margin-left:-300px;z-index:999;box-shadow:0px 0px 10px #000;">
				<img src="" width="600px" height="400px"/>
				<div class="prev" style="cursor:pointer;font-family:'楷体';width:100px;height:100%;font-size:30px;line-height:400px;text-align:center;color:#fff;position:absolute;top:0;left:-100px;-webkit-user-select:none;">&lt;</div>
				<div class="next" style="cursor:pointer;font-family:'楷体';width:100px;height:100%;font-size:30px;line-height:400px;text-align:center;color:#fff;position:absolute;top:0;right:-100px;-webkit-user-select:none;">&gt;</div>
			</div>
			<div class="roomPicMask" id="roomPicMask" style="display:none;position:fixed;top:0;left:0;width:100%;height:100%;background:rgba(0,0,0,.4);z-index:998;">
				<a class="rpClose" style="font-family:'楷体';font-size:18px;display:block;width:30px;height:30px;border:1px solid #fff;color:#fff;border-radius:50%;text-align:center;line-height:30px;position:absolute;top:20px;right:40px;cursor:pointer;">x</a>
			</div>
			<!-- picBox end -->
			
		</div>
		<!--end t_right-->

	</div>
	
<script type="text/javascript">
	var roomPicUrl="";
	// 页面初始化，后台加载数据
	$(function(){
		// 加载表格数据
		$.ajax({
			url:basePath+"/admin/roomManage/queryAllRoom",
			type: 'post',
			success: function(data){
				if(data.result=="success"){
					refreshTreeData(data.datamap.roomMapList);
				}
			}
		});
		
		// jqweight控件----表格
		$("#indGrid").jqxTreeGrid({
			theme : theme,
			width : '100%',
			height : '100%',
			hierarchicalCheckboxes : true,
			columnsResize : true,
			checkboxes : true,
			icons : true,
			showtoolbar : true,
			rendertoolbar : function(toolbar) {
				toolbar.append($('#gridToolber'));
				$('#gridToolber input').jqxButton({
					theme : theme,
					cursor : "pointer",
					width : 100,
					height : 25,
					textImageRelation : "imageBeforeText",
					textPosition : "left"
				});
				$('#addRoomStyle').jqxButton({
					width: '130',
					imgSrc : basePath+"/images/admin/image/add.png"
				});
				$('#addRoom').jqxButton({
					width: '130',
					imgSrc : basePath+"/images/admin/image/add.png"
				});
				$('#delRoom').jqxButton({
					width: '130',
					imgSrc : basePath+"/images/admin/image/delete3.png"
				});
				$('#editRoomOne').jqxButton({
					width: '130',
					imgSrc : basePath+"/images/admin/image/icon-edit.png"
				});
				$('#editRoomType').jqxButton({
					width: '130',
					imgSrc : basePath+"/images/admin/image/icon-edit.png"
				});
			},
			columns : [ {
				text : '客房名称',
				datafield : 'roomName',
				width : 120
			}, {
				text : '客房状态',
				datafield : 'roomStatus',
				cellsalign : 'center',
				width : 120,
				align : 'center',
				cellsRenderer : roomstatusFormat
			}, {
				text : '客房类型',
				datafield : 'roomStyleName',
				cellsalign : 'center',
				width : 120,
				align : 'center'
			}, {
				text : '客房图片',
				datafield : 'roomPicIcon',
				width : 120,
				align : 'center',
				cellsalign : 'center'
			}, {
				text : '客房价格',
				datafield : 'roomPrice',
				width : 120,
				align : 'center',
				cellsalign : 'center'
			},{
				text : '客房描述',
				datafield : 'roomDesc',
				align : 'center',
				cellsalign : 'center',
				cellsformat : 'c2',
			}]
		});
		
		// jqweight控件----弹出框（添加客房类型）
		$(".addRoomStyleBox").jqxWindow({
			isModal :true,
			modalOpacity: 0.3,
			theme : theme,
			width : 380,
			height : 240,
			resizable : false,
			autoOpen : false,
			cancelButton : $('#ccButton_addrms'),
			okButton : $('#ooButton_addrms'),
			initContent : function() {
				$('#ooButton_addrms').jqxButton({
					theme : theme,
					template : "primary",
					cursor : "pointer",
					width : '80',
					height : '30'
				});
				$('#ccButton_addrms').jqxButton({
					theme : theme,
					template : "info",
					cursor : "pointer",
					width : '80',
					height : '30'
				});
			}
		});
		
		// jqweight控件----弹出框（添加客房）
		$(".addRoomBox").jqxWindow({
			isModal :true,
			modalOpacity: 0.3,
			theme : theme,
			width : 380,
			height : 240,
			resizable : false,
			autoOpen : false,
			cancelButton : $('#ccButton_addrm'),
			okButton : $('#ooButton_addrm'),
			initContent : function() {
				$('#ooButton_addrm').jqxButton({
					theme : theme,
					template : "primary",
					cursor : "pointer",
					width : '80',
					height : '30'
				});
				$('#ccButton_addrm').jqxButton({
					theme : theme,
					template : "info",
					cursor : "pointer",
					width : '80',
					height : '30'
				});
			}
		});
		
		// jqweight控件----弹出框（确认删除客房）
		$(".delRoomBox").jqxWindow({
			isModal :true,
			modalOpacity: 0.3,
			theme : theme,
			width : 280,
			height : 140,
			resizable : false,
			autoOpen : false,
			cancelButton : $('#ccButton_delrm'),
			okButton : $('#ooButton_delrm'),
			initContent : function() {
				$('#ooButton_delrm').jqxButton({
					theme : theme,
					template : "primary",
					cursor : "pointer",
					width : '80',
					height : '30'
				});
				$('#ccButton_delrm').jqxButton({
					theme : theme,
					template : "info",
					cursor : "pointer",
					width : '80',
					height : '30'
				});
			}
		});
		
		// jqweight控件----弹出框（编辑客房单一）
		$(".editRoomOneBox").jqxWindow({
			isModal :true,
			modalOpacity: 0.3,
			theme : theme,
			width : 380,
			height : 240,
			resizable : false,
			autoOpen : false,
			cancelButton : $('#ccButton_editrmo'),
			okButton : $('#ooButton_editrmo'),
			initContent : function() {
				$('#ooButton_editrmo').jqxButton({
					theme : theme,
					template : "primary",
					cursor : "pointer",
					width : '80',
					height : '30'
				});
				$('#ccButton_editrmo').jqxButton({
					theme : theme,
					template : "info",
					cursor : "pointer",
					width : '80',
					height : '30'
				});
			}
		});
		
		// jqweight控件----弹出框（编辑客房同类）
		$(".editRoomBox").jqxWindow({
			isModal :true,
			modalOpacity: 0.3,
			theme : theme,
			width : 380,
			height : 240,
			resizable : false,
			autoOpen : false,
			cancelButton : $('#ccButton_editrm'),
			okButton : $('#ooButton_editrm'),
			initContent : function() {
				$('#ooButton_editrm').jqxButton({
					theme : theme,
					template : "primary",
					cursor : "pointer",
					width : '80',
					height : '30'
				});
				$('#ccButton_editrm').jqxButton({
					theme : theme,
					template : "info",
					cursor : "pointer",
					width : '80',
					height : '30'
				});
			}
		});
		
		// jqweight控件----下拉框（选中客房类型）
		$("#roomStyle").jqxDropDownList({
			theme : theme,
			source: null,
			placeHolder : '请选择客房类型',
			width: '120',
			height: '30',
			dropDownHeight: '74',
			displayMember: "roomStyle",
		    valueMember: "id"
		});
		
		// jqweight控件----下拉框（选中客房类型）
		$("#roomStyleEdit").jqxDropDownList({
			theme : theme,
			source: null,
			placeHolder : '请选择客房类型',
			width: '120',
			height: '30',
			dropDownHeight: '74',
			displayMember: "roomStyle",
		    valueMember: "id"
		});
		
		var source = [
			{"roomStatusDisplay":"未预定","roomStatusValue":"0"},
			{"roomStatusDisplay":"被预定","roomStatusValue":"1"},
			{"roomStatusDisplay":"已入住","roomStatusValue":"2"}
		];
		
		// jqweight控件----下拉框（选中客房状态）
		$("#roomStatusEdit").jqxDropDownList({
			theme : theme,
			source: source,
			placeHolder : '请选择客房状态',
			width: '120',
			height: '30',
			dropDownHeight: '74',
			displayMember: "roomStatusDisplay",
		    valueMember: "roomStatusValue"
		});
		
		// 加载所有的客房类型
		$.ajax({
			url:basePath+"/admin/roomManage/queryAllRoomStyle",
			type: 'post',
			success: function(data){
				if(data.result=="success"){
					source ={
					datatype: "json",
					datafields: 
						[{ name: 'roomStyle' },
						 { name: 'id' }],
						 localdata: data.datamap.roomStyleList
					};
					dataAdapter = new $.jqx.dataAdapter(source);
					$("#roomStyle").jqxDropDownList({source: dataAdapter});
					$("#roomStyleEdit").jqxDropDownList({source: dataAdapter});
				}
			}
		});
		
		// 点击添加客房类型
		$('#addRoomStyle').click(function(){
			// 显示window框
			$('.addRoomStyleBox').jqxWindow('open');
		});
		$("#ooButton_addrms").click(function(){
			// 准备数据
			var roomStyleName = $("#roomStyleName").val();
			var roomPrice = $("#roomPrice").val();
			var roomDesc = $("#roomDesc").val();
			if(roomStyleName.trim()!=""&&roomPrice.trim()!=""&&roomDesc.trim()!=""){
				$.tzAjax.request({url:basePath+"/admin/roomManage/addRoomStyle",callback:function(data){
					if(data.result=="success"){
						// 再次请求刷新页面的表格
						window.location.reload(location);
					}
				}},{"roomStyleName":roomStyleName,"roomPrice":roomPrice,"roomDesc":roomDesc});
			}else{
				showInfo("字段不能为空~","warning");
			}
		});
		$("#roomPrice,#roomDesc").focus(function(){
			// 检测是否有相同的客房类型
			var roomStyleName = $("#roomStyleName").val();
			$.tzAjax.request({url:basePath+"/admin/roomManage/checkRoomStyle",callback:function(data){
				if(data.result=="success"){
					// 已经有了相同的客房类型，显示错误信息
					$(".errormsg").show();
				}else{
					$(".errormsg").hide();
				}
			}},{"roomStyleName":roomStyleName});
		});
		
		// 点击增加客房
		var urlArr = new Array();
		$("#addRoom").click(function(){
			$('.addRoomBox').jqxWindow('open');
		});
		$.tzUpload({
			url:basePath+"/ajaxupload/ajaxUploadAction/addRoomPic",
			postName:"bimg",
			type:"*.jpg;*.png;*.jpeg",
			targetId:"roomPic",
			size:"10 MB",
			single:false,
			callback:function(data){
				var data = eval("("+data+")");
				urlArr.push(data.url);
			}
		});
		$("#ooButton_addrm").click(function(){
			// 准备数据
			var roomName = $("#roomName").val();
			var roomStyle = $("#roomStyle").val();
			if(roomName.trim()!=""&&roomStyle!=""){
				$.ajax({
					url:basePath+"/admin/roomManage/addRoom",
					data:{"roomName":roomName,"roomStyle":roomStyle,"urlArr":urlArr},
					type:'post',
					traditional: true,
					success:function(data){
						console.log(data.datamap.roomId);
						if(data.result=="success"){
							// 再次请求刷新页面的表格
							window.location.reload(location);
						}
					}
				});
			}else{
				showInfo("字段不能为空~","warning");
			}
		});
		
		// 点击删除客房
		$("#delRoom").click(function(){
			var checkedRows = $("#indGrid").jqxTreeGrid('getCheckedRows');
			// 获取所有的客房的id
			if(checkedRows.length == 0){
				showInfo("请先勾选要删除的客房~", 'warning');
				return;
			}else{
				$(".delRoomBox").jqxWindow('open');
			}
		});
		$("#ooButton_delrm").click(function(){
			// 准备数据
			var delRoomId = new Array();
			var checkedRowsId = getCheckedRows();
			var checkedRows = $("#indGrid").jqxTreeGrid('getCheckedRows');
			for(var i=0;i<checkedRows.length;i++){
				if(checkedRows[i].parentid!=null){
					// 可以删除的客房，保存id
					if(checkedRows[i].roomStatus=='0'){
						delRoomId.push(checkedRows[i].id);
					}
				}
			}
			if(delRoomId.length!=checkedRowsId.length){
				showInfo("某些客房已经被预定或者已经入住所以是不允许删除的~","warning");
			}
			if(delRoomId!=""){
				// 调用后台删除可以删除的客房。
				$.ajax({
					url: basePath+"/admin/roomManage/delRoom",
					data: {"delRoomId":delRoomId},
					type: 'post',
					traditional: true,
					success: function(){
						window.location.reload(location);
					}
				});
			}
		});
		function getCheckedRows(){
			var arr = new Array();
			var rows = $("#indGrid").jqxTreeGrid('getCheckedRows');
			$.each(rows, function(i,n){
				if(n.parentid!=null){
					arr.push(n.id);
				}
			})
			return arr;
		}
		
		// 点击编辑客房（单一）
		var roomId = "";
		$('#editRoomOne').click(function(){
			var checkedRows = $("#indGrid").jqxTreeGrid('getCheckedRows');
			// 获取所有的客房的id
			if(checkedRows.length == 0){
				showInfo("请先勾选要编辑的客房~", 'warning');
				return;
			}else if(checkedRows.length == 1||(checkedRows.length == 2&&checkedRows[0].parentid==null)){
				$(".editRoomOneBox").jqxWindow('open');
				console.log(checkedRows);
				// 数据回写
				if(checkedRows.length == 1){
					$("#roomNameEdit").val(checkedRows[0].roomName);
					$("#roomStatusEdit").jqxDropDownList({selectedIndex:checkedRows[0].roomStatus});
					var item = $("#roomStyleEdit").jqxDropDownList('getItemByValue', checkedRows[0].roomStyleid);
					$("#roomStyleEdit").jqxDropDownList('selectItem', item );
					roomId = checkedRows[0].id;
				}else if(checkedRows.length == 2){
					$("#roomNameEdit").val(checkedRows[1].roomName);
					$("#roomStatusEdit").jqxDropDownList({selectedIndex:checkedRows[1].roomStatus});
					var item = $("#roomStyleEdit").jqxDropDownList('getItemByValue', checkedRows[1].roomStyleid);
					$("#roomStyleEdit").jqxDropDownList('selectItem', item );
					roomId = checkedRows[1].id;
				}
			}else{
				showInfo("只能勾选一个要编辑的客房~", 'warning');
			}
		});
		$("#ooButton_editrmo").click(function(){
			// 获取表单数据
			var roomNameEdit = $("#roomNameEdit").val();
			var roomStatusEdit = $("#roomStatusEdit").jqxDropDownList("val");
			var roomStyleEdit = $("#roomStyleEdit").jqxDropDownList("val");
			
			$.ajax({
				url: basePath+"/admin/roomManage/editRoomOne",
				data: {"roomId":roomId,"roomNameEdit":roomNameEdit,"roomStatusEdit":roomStatusEdit,"roomStyleEdit":roomStyleEdit},
				type: 'post',
				success: function(data){
					window.location.reload(location);
				}
			});
		});
		
		// 点击编辑客房（同类）
		var roomStyleId = "";
		$('#editRoomType').click(function(){
			var checkedRows = $("#indGrid").jqxTreeGrid('getCheckedRows');
			if(checkedRows.length>0&&checkedRows[0].parentid==null&&(checkedRows[1].parentid==checkedRows[(checkedRows.length)-1].parentid)){
				$(".editRoomBox").jqxWindow('open');
				// 数据回写
				$("#roomStyleNameEdit").val(checkedRows[1].roomStyleName);
				$("#roomPriceEdit").val(checkedRows[1].roomPrice);
				$("#roomDescEdit").val(checkedRows[1].roomDesc);
				roomStyleId = checkedRows[1].roomStyleid;
			}else{
				showInfo("请选择一类客房~","warning");
			}
		});
		$("#ooButton_editrm").click(function(){
			// 获取数据
			var roomPrice = $("#roomPriceEdit").val();
			var roomDesc = $("#roomDescEdit").val();
			var roomStyleName = $("#roomStyleNameEdit").val();
			// 向后台写入数据
			$.ajax({
				url: basePath+"/admin/roomManage/editRoomType",
				data:  {"roomStyleId":roomStyleId,"roomPrice": roomPrice,"roomDesc": roomDesc,"roomStyleName":roomStyleName},
				type: 'post',
				success:function(data){
					window.location.reload(location);
				}
			});
		});
	});
	
	var roomPicUrlList = new Array();
	function roomPic(event){
		var roomid = $(event).attr("roomid");
		$.ajax({
			url: basePath+"/admin/roomManage/queryRoomPicByRoomId",
			data:  {"roomid":roomid},
			type: 'post',
			success:function(data){
				// 返回客房对应的图片连接的数组
				if(data.datamap.roomPicUrl!=""){
					roomPicUrlList = data.datamap.roomPicUrl;
					$("#roomPicMask").show();
					$("#picBox").show();
					$("#picBox").find("img").attr("src",basePath+"/"+data.datamap.roomPicUrl[0]);
				}else{
					showInfo("该客房没有图片~","warning");
				}
			}
		});
	}
	var index = 0;
	$(".prev").click(function(){
		if((index-1)<0){
			index = roomPicUrlList.length;
		}
		$("#picBox").find("img").attr("src",basePath+"/"+roomPicUrlList[index-1]);
		index = index-1;
	});
	$(".next").click(function(){
		if((index+1)>=roomPicUrlList.length){
			index = -1;
		}
		$("#picBox").find("img").attr("src",basePath+"/"+roomPicUrlList[index+1]);
		index = index+1;
	});
	$(".rpClose").click(function(){
		$("#roomPicMask").hide();
		$("#picBox").hide();
	});
	
	// 点击logo回到前台首页
	function toIndex(){
		window.location.href = basePath+"/page/toIndex";
	}
	
	// 表格列的值的转化
	function roomstatusFormat(row, column, value, rowData) {
		if (value == '0') {
			return "未预定";
		} else if (value == '1') {
			return "被预定";
		} else if (value == '2') {
			return "已入住";
		}
	}
	
	// 加载表格数据
	function refreshTreeData(data) {
		var source = {
			dataType : "json",
			dataFields : [ {
				name : 'roomName',
				type : 'string'
			}, {
				name : 'id',
				type : 'string'
			}, {
				name : 'parentid',
				type : 'string'
			}, {
				name : 'roomStatus',
				type : 'string'
			}, {
				name : 'roomPicIcon',
				type : 'string'
			}, {
				name : 'roomStyleName',
				type : 'string'
			}, {
				name : 'roomStyleid',
				type : 'string'
			}, {
				name : 'roomPrice',
				type : 'string'
			}, {
				name : 'roomDesc',
				type : 'string'
			}, {
				name : 'expanded',
				type : 'bool'
			}, {
				name : 'icon',
				type : 'string'
			}],
			hierarchy : {
				keyDataField : {
					name : 'id'
				},
				parentDataField : {
					name : 'parentid'
				}
			},
			id : 'roomid',
			localData : data
		};
		var dataAdapter = new $.jqx.dataAdapter(source);
		$("#indGrid").jqxTreeGrid({
			source : dataAdapter
		});
	}
</script>
</body>
</html>