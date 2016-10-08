<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@include file="/commons/taglib.jsp" %>
<!doctype html>
<html >
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
		<title>结算中心</title>
		<%@include file="/commons/public.jsp" %>
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
			.fm_content .t_header .h_nav ul li a .h_icon3{background-position:-48px 0px;}
			.fm_content .t_header .h_nav ul li a:hover .h_icon3{background-position:-48px -25px;}
			.fm_content .t_header .h_nav ul li a .h_icon4{background-position:-68px -25px;}
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

			/*清除浮动*/
			.clear{clear:both;}
			
			.name_li:hover{background:#bbb !important;}

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
						<a href="${basePath }/toadmin/adminPage/toRoomManage">
							<i class="h_icon3"></i>
							<span>客房管理</span>
						</a>
					</li>
					<li>
						<a href="#" class="h_sel">
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
				<p>您当前所在位置：首页 &gt; 结算中心</p>
			</div>
			<!--end r_location-->
			
			<!-- r_search start -->
			<div class="r_search" style="width:94%;height:40px;margin-left:30px;margin-top:20px;">
				<div class="s_realname" style="width:250px;height:40px;float:left;">
					<span style="float:left;display:inline-block;width:56px;height:40px;color:#333;font-size:14px;line-height:40px;">顾客名：</span>
					<div style="position:relative;width:100%;height:100%;">
						<input class="customerName" id="customerName" type="text" placeholder="请输入顾客名" style="float:left;width:150px;height:30px;margin-top:5px;padding-left:5px;"/>
						<div class="name_xiala" style="display:none;width:155px;height:auto;background:#fff;position:absolute;top:37px;left:56px;border:1px solid #eee;z-index: 999;">
							<ul style="width:155px;height:100%;">
							</ul>
						</div>
						<div class="clear"></div>
					</div>
				</div>
				<div class="s_now" style="display:none;width:120px;height:40px;float:left;">
					<input id="s_now" type="button" value="当前账单" style="float:left;width:100px;height:30px;margin-top:5px;padding-left:5px;"/>
				</div>
				<div class="s_history" style="display:none;width:120px;height:40px;float:left;">
					<input id="s_history" type="button" value="历史账单" style="float:left;width:100px;height:30px;margin-top:5px;padding-left:5px;"/>
				</div>
				<div class="s_room" style="display:none;width:120px;height:40px;float:left;">
					<input id="s_room" type="button" value="客房管理" style="float:left;width:100px;height:30px;margin-top:5px;padding-left:5px;"/>
				</div>
				<div class="s_service" style="display:none;width:120px;height:40px;float:left;">
					<input id="s_service" type="button" value="消费管理" style="float:left;width:100px;height:30px;margin-top:5px;padding-left:5px;"/>
				</div>
			</div>
			<!-- r_search end -->
			
			<div class="r_content" style="width:94%;height:auto;min-height:400px;margin-left:30px;margin-top:10px;margin-bottom:10px;border:1px solid #eee;">
			
				<!-- r_showInfo start -->
				<div class="r_showInfo" style="width:96%;height:100%;margin-left:20px;margin-top:10px;"></div>
				<!-- r_showInfo end -->
				
				<!-- r_billList start -->
				<div class="r_billList" style="width:96%;height:100%;margin-left:20px;margin-top:10px;">
					<ul></ul>
				</div>
				<!-- r_billList end -->
				
				<!-- r_total start -->
				<div class="r_total" style="width:96%;height:100%;margin-left:20px;margin-top:10px;"></div>
				<!-- r_total end -->
				
				<!-- r_init start -->
				<div class="r_init" style="width:96%;height:30px;margin-left:20px;margin-top:200px;color:#333;text-align:center;">
					请选择顾客进行数据查询。。。
				</div>
				<!-- r_init end -->
				
				<!-- r_roommanage start -->
				<div class="r_roommanage animated fadeInDown" style="display:none;width:96%;height:auto;margin-left:20px;">
					<div class="room_info" style="width:100%;height:200px;border:1px solid #eee;background:#eee;"></div>
					<div class="room_toolbar" style="width:100%;height:30px;margin-top:20px;">
						<input id="s_add" type="button" value="加房" style="float:left;margin-right:10px;"/>
						<input id="s_quit" type="button" value="退房" style="float:left;margin-right:10px;"/>
						<input id="s_change" type="button" value="换房" style="float:left;margin-right:10px;"/>
						<input id="s_continue" type="button" value="续房" style="float:left;margin-right:10px;"/>
					</div>
				</div>
				<!-- r_roommanage end -->
				
				<!-- r_servicemanage start -->
				<div class="r_servicemanage animated fadeInDown" style="display:none;width:96%;height:auto;margin-left:20px;">
					<div class="service_init" style="width:100%;height:100px;background:#eee;margin-top:10px;line-height:100px;text-align:center;display:none;">当前没有消费记录~</div>
					<div class="service_info" style="width:100%;height:auto;">
						<ul>
							<!-- <li class='animated fadeInDown Service' style='width:100%;height:60px;border:1px solid #eee;margin-top:10px;background:#fff;box-shadow:0px 0px 5px #eee;'>
								<div style='width:260px;height:30px;margin-top:12px;margin-left:30px;float:left;'>
									<span style='display:inline-block;width:50px;height:30px;float:left;line-height:30px;'>费用名:</span><div style='width:auto;height:30px;float:left;line-height:30px;'></div>
								</div>
								<div style='width:200px;height:30px;margin-top:12px;float:left;'>
									<span style='display:inline-block;width:40px;height:30px;float:left;line-height:30px;'>状态:</span><div style='width:auto;height:30px;float:left;line-height:30px;'></div>
								</div>
								<div style='width:200px;height:30px;margin-top:12px;float:left;'>
									<span style='display:inline-block;width:40px;height:30px;float:left;line-height:30px;'>费用:</span><div class='money' style='width:auto;height:30px;float:left;line-height:30px;'></div>
								</div>
							</li>
							<li class='animated fadeInDown foodService' style='width:100%;height:auto;margin-top:10px;'>
								<div style='border:1px solid #eee;width:100%;height:60px;background:#fff;box-shadow:0px 0px 5px #eee;'>
									<div style='width:260px;height:30px;margin-top:12px;margin-left:30px;float:left;'>
										<span style='display:inline-block;width:50px;height:30px;float:left;line-height:30px;'>费用名:</span><div style='width:auto;height:30px;float:left;line-height:30px;'></div>
									</div>
									<div style='width:200px;height:30px;margin-top:12px;float:left;'>
										<span style='display:inline-block;width:40px;height:30px;float:left;line-height:30px;'>状态:</span><div style='width:auto;height:30px;float:left;line-height:30px;'></div>
									</div>
									<div style='width:200px;height:30px;margin-top:12px;float:left;'>
										<span style='display:inline-block;width:40px;height:30px;float:left;line-height:30px;'>费用:</span><div class='money' style='width:auto;height:30px;float:left;line-height:30px;'></div>
									</div>
									<div style='width:70px;height:30px;margin-top:12px;float:right;'>
										<span id='fooddetail' style='display:inline-block;width:50px;height:30px;float:left;line-height:30px;color:#25c016;cursor:pointer;'>明细&gt;&gt;</span>
									</div>
								</div>
								<div class='detailbox' style='display:none;width:99%;height:100px;margin-left:6px;border:1px solid #eee;border-radius:0px 0px 4px 4px;'></div>
							</li> -->
						</ul>
					</div>
					<div class="service_toolbar" style="width:100%;height:30px;margin-top:20px;margin-bottom:10px;">
						<input id="s_addservice" type="button" value="我要消费" style="float:left;margin-right:10px;"/>
					</div>
				</div>
				<!-- r_servicemanage end -->
				
			</div>
			
		</div>
		<!--end t_right-->
		
		<!-- addroomwindow start -->
		<div class="addroomwindow">
			<div id="addroomwindowHeader">
				<span id="configContainer" style="float: left">加房</span>
			</div>
			<div id="addroomwindowContent" style="overflow: hidden;position:relative;">
				<div class="input" style="width:100%;height:190px;">
					<div style="width:100%;height:30px;margin-top:20px;">
						<span style="width:40px;height:30px;display:inline-block;line-height:30px;margin-left:20px;float:left;">选房：</span>
						<div class="roomstyle" style="width:110px;height:30px;float:left;margin-left:20px;"></div>
						<div class="roomname" style="width:110px;height:30px;float:left;margin-left:20px;"></div>
					</div>
					<div style="width:100%;height:30px;margin-top:20px;">
						<span style="width:80px;height:30px;display:inline-block;line-height:30px;margin-left:20px;float:left;">入住时间：</span>
						<input class="checkintime" style="float:left;border:1px solid #eee;"/>
					</div>
					<div style="width:100%;height:30px;margin-top:20px;">
						<span style="width:80px;height:30px;display:inline-block;line-height:30px;margin-left:20px;float:left;">到期时间：</span>
						<input class="expiretime" style="float:left;border:1px solid #eee;"/>
					</div>
				</div>
				<div style="position:absolute;bottom:20px;left:85px;">
					<input type="button" value="确定" id="ooButton_addr" />
					<input type="button" value="取消" id="ccButton_addr" style="margin-left:50px;"/>
				</div>
			</div>
		</div>
		<!-- addroomwindow end -->
		
		<!-- quitroomwindow start -->
		<div class="quitroomwindow">
			<div id="quitroomwindowHeader">
				<span id="configContainer" style="float: left">退房</span>
			</div>
			<div id="quitroomwindowContent" style="overflow: hidden;position:relative;">
				<div class="input" style="width:100%;height:66px;line-height:66px;text-align:center;">你确定要退房嘛？？？</div>
				<div style="position:absolute;bottom:20px;left:34px;width:216px;height:30px;">
					<input type="button" value="确定" id="ooButton_quitr" />
					<input type="button" value="取消" id="ccButton_quitr" style="margin-left:50px;"/>
				</div>
			</div>
		</div>
		<!-- quitroomwindow end -->
		
		<!-- addservicewindow start -->
		<div class="addservicewindow">
			<div id="addservicewindowHeader">
				<span id="configContainer" style="float: left">我要消费</span>
			</div>
			<div id="addservicewindowContent" style="overflow: hidden;position:relative;">
				<div class="input" style="width:100%;height:190px;">
					<div style="width:100%;height:30px;margin-top:20px;">
						<span style="width:84px;height:30px;display:inline-block;line-height:30px;margin-left:40px;float:left;">选择消费类型：</span>
						<div class="servicestyle" style="width:110px;height:30px;float:left;margin-left:20px;"></div>
					</div>
					<div style="width:100%;height:30px;margin-top:20px;">
						<span style="width:104px;height:30px;display:inline-block;line-height:30px;margin-left:40px;float:left;">选择消费总价：</span>
						<input class="totalmoney" type="text" style="float:left;border:1px solid #eee;width:145px;height:30px;padding-left:5px;"/>
					</div>
				</div>
				<div style="position:absolute;bottom:20px;left:85px;">
					<input type="button" value="确定" id="ooButton_adds" />
					<input type="button" value="取消" id="ccButton_adds" style="margin-left:50px;"/>
				</div>
			</div>
		</div>
		<!-- addservicewindow end -->

	</div>

<script type="text/javascript" src="${basePath }/js/PinYin.js"></script>
<script type="text/javascript">
	var localdata;
	var chooseuserid;
	var chooseroomid;

	// 点击logo回到前台首页
	function toIndex(){
		window.location.href = basePath+"/page/toIndex";
	}
	
	$(function(){
		// 到数据库中加载顾客数据，保存到当前页面
		$.ajax({
			url: basePath+"/admin/checkOut/queryAllCheckOutInfo",
			type: 'post',
			async: false,
			success: function(data){
				console.log(data.datamap);
				localdata = data.datamap;
				formatRealName(localdata.userList);
			}
		});
		
		if((window.location.href).indexOf("id")!=-1){
			var id = (window.location.href).split("=")[1];
			chooseuserid = id;
			showData(id);
			$(".r_init").hide();
			$(".s_room,.s_service,.s_history,.s_now").show();
		}
		
		//
		$("#s_room").jqxButton({
			theme: theme,
			width: 100,
			height: 30,
			template: 'success'
		});
		
		//
		$("#s_service").jqxButton({
			theme: theme,
			width: 100,
			height: 30,
			template: 'primary'
		});
		
		//
		$("#s_now").jqxButton({
			disabled: true,
			theme: theme,
			width: 100,
			height: 30
		});
		
		//
		$("#s_history").jqxButton({
			theme: theme,
			width: 100,
			height: 30,
			template: 'info'
		});
		
		//
		$("#s_add").jqxButton({
			theme: theme,
			width: 80,
			height: 30,
		});
		
		//
		$("#s_quit").jqxButton({
			theme: theme,
			width: 80,
			height: 30,
			template: 'primary'
		});
		
		//
		$("#s_change").jqxButton({
			theme: theme,
			width: 80,
			height: 30,
			template: 'info'
		});
		
		//
		$("#s_continue").jqxButton({
			theme: theme,
			width: 80,
			height: 30,
			template: 'success'
		});
		
		//
		$("#s_addservice").jqxButton({
			theme: theme,
			width: 100,
			height: 30,
			template: 'info'
		});
		
		//
		$(".addroomwindow").jqxWindow({
			isModal :true,
			modalOpacity: 0.3,
			theme : theme,
			width : 380,
			height : 260,
			resizable : false,
			autoOpen : false,
			cancelButton : $('#ccButton_addr'),
			okButton : $('#ooButton_addr'),
			initContent : function() {
				$('#ooButton_addr').jqxButton({
					theme : theme,
					template : "primary",
					cursor : "pointer",
					width : '80',
					height : '30'
				});
				$('#ccButton_addr').jqxButton({
					theme : theme,
					template : "info",
					cursor : "pointer",
					width : '80',
					height : '30'
				});
			}
		});
		$("#ooButton_addr").on("click",function(){
			// 收集数据
			var roomid = $(".roomname").val();
			var checkintime = $(".checkintime").val();
			var expiretime = $(".expiretime").val();
			var userid = chooseuserid;
			$.ajax({
				url:basePath+"/admin/checkOut/addOrder",
				type: 'post',
				data: {"userid":userid,"roomid":roomid,"checkintime":checkintime,"expiretime":expiretime},
				success: function(data){
					if(data.result=="success"){
						// 改变房间状态为入住
						$.ajax({
							url:basePath+"/admin/roomManage/updateRoomStatus",
							type: 'post',
							data: {"status":2,"roomid":roomid}
						});
						window.location.reload(location);
					}
				}
			});
		});
		
		//
		$(".quitroomwindow").jqxWindow({
			isModal :true,
			modalOpacity: 0.3,
			theme : theme,
			width : 280,
			height : 160,
			resizable : false,
			autoOpen : false,
			cancelButton : $('#ccButton_quitr'),
			okButton : $('#ooButton_quitr'),
			initContent : function() {
				$('#ooButton_quitr').jqxButton({
					theme : theme,
					template : "primary",
					cursor : "pointer",
					width : '80',
					height : '30'
				});
				$('#ccButton_quitr').jqxButton({
					theme : theme,
					template : "info",
					cursor : "pointer",
					width : '80',
					height : '30'
				});
			}
		});
		$("#ooButton_quitr").on("click",function(){
			// 收集数据
			var roomid = chooseroomid;
			var userid = chooseuserid;
			var billnowid;
			var billhistoryid;
			var orderid;
			var serviceorderidlist;
			// 删除billNow表中的对应useid的数据，但是要先将order和serviceOrder表中的billnowid的值设为null,然后才可以删除，其实使用级联就可以。
			$.ajax({
				url: basePath+"/admin/checkOut/queryBillNowIdByUserId",
				data: {"userid":userid},
				type: 'post',
				success: function(data){
					billnowid = data.datamap.billnowid;
					$.ajax({
						url: basePath+"/admin/checkOut/updateOrderByBillNowId",
						async: false,
						data: {"billnowid":billnowid},
						type: 'post',
						success: function(data){
							orderid = data.datamap.orderid;
						}
					});
					$.ajax({
						url: basePath+"/admin/checkOut/updateServiceOrderByBillNowId",
						async: false,
						data: {"billnowid":billnowid},
						type: 'post',
						success: function(data){
							serviceorderidlist = data.datamap.serviceorderidlist;
						}
					});
					$.ajax({
						url: basePath+"/admin/checkOut/delBillNowByUserId",
						data: {"userid":userid},
						type: 'post',
						success: function(data){
							// billHistory表中增加一条useid对应的历史账单记录
							$.ajax({
								url: basePath+"/admin/checkOut/addBillHistoryByUserId",
								data: {"userid":userid},
								type: 'post',
								success: function(data){
									billhistoryid = data.datamap.billhistoryid;
									// 更新Order表(通过orderid状态改为2退房，billhistoryid加上新的billhistoryid)
									$.ajax({
										url: basePath+"/admin/checkOut/updateOrderByOrderId",
										data: {"orderid":orderid,"billhistoryid":billhistoryid},
										type: 'post'
									});
									// 更新ServiceOrder表(循环通过serviceorderid，billhistoryid加上新的billhistoryid)
									$.ajax({
										url: basePath+"/admin/checkOut/updateServiceOrderByServiceOrderIdList",
										traditional: true,
										data: {"serviceorderidlist":serviceorderidlist,"billhistoryid":billhistoryid},
										type: 'post'
									});
									// 改变房间状态为0为未预定
									$.ajax({
										url:basePath+"/admin/roomManage/updateRoomStatus",
										type: 'post',
										data: {"roomid":roomid,"status":0}
									});
									showInfo("退房成功~","success");
								}
							});
						}
					});
				}
			});
		});
		
		//
		$(".addservicewindow").jqxWindow({
			isModal :true,
			modalOpacity: 0.3,
			theme : theme,
			width : 380,
			height : 230,
			resizable : false,
			autoOpen : false,
			cancelButton : $('#ccButton_adds'),
			okButton : $('#ooButton_adds'),
			initContent : function() {
				$('#ooButton_adds').jqxButton({
					theme : theme,
					template : "primary",
					cursor : "pointer",
					width : '80',
					height : '30'
				});
				$('#ccButton_adds').jqxButton({
					theme : theme,
					template : "info",
					cursor : "pointer",
					width : '80',
					height : '30'
				});
			}
		});
		$("#ooButton_adds").on("click",function(){
			// 准备数据
			var serviceid = $(".servicestyle").jqxDropDownList('val');
			var userid = chooseuserid;
			var totalmoney = $(".totalmoney").val();
			var billnowid;
			$.ajax({
				url: basePath+"/admin/checkOut/queryBillNowIdByUserId",
				data: {"userid":userid},
				type: 'post',
				async: false,
				success: function(data){
					if(data.result=="success"){
						billnowid = data.datamap.billnowid;
					}
				}
			});
			
			$.ajax({
				url: basePath+"/admin/checkOut/addServiceOrderByUserId",
				data: {"userid":userid,"serviceid":serviceid,"totalmoney":totalmoney,"billnowid":billnowid},
				type: 'post',
				success: function(data){
					$("#s_service").trigger("click");
				}
			});
		});
		
		//
		var serviceList = new Array();
		$(".servicestyle").jqxDropDownList({
			theme : theme,
			source: null,
			placeHolder : '请选择消费类型~',
			width: '110',
			height: '30',
			dropDownHeight: '80',
			displayMember: "serviceType",
		    valueMember: "id"
		});
		$(".servicestyle").on("change",function(){
			for(var i = 0;i<serviceList.length;i++){
				if(($(".servicestyle").jqxDropDownList('val'))==serviceList[i].id){
					$(".totalmoney").val(serviceList[i].price);
				}else if(($(".servicestyle").jqxDropDownList('val'))==3){
					$(".totalmoney").val("");
				}
			}
		});
		
		//
		$(".roomstyle").jqxDropDownList({
			theme : theme,
			source: null,
			placeHolder : '请选择客房类型~',
			width: '110',
			height: '30',
			dropDownHeight: '80',
			displayMember: "roomStyle",
		    valueMember: "id"
		});
		$(".roomstyle").on("change",function(){
			// 加载指定客房类型的未预定的空房
			$.ajax({
				url:basePath+"/admin/roomManage/queryAllRoomByRoomStyleId",
				type: 'post',
				data: {"roomstyleid":$(".roomstyle").val()},
				success: function(data){
					if(data.result=="success"){
						source ={
						datatype: "json",
						datafields: 
							[{ name: 'roomName' },
							 { name: 'id' }],
							 localdata: data.datamap.roomList
						};
						dataAdapter = new $.jqx.dataAdapter(source);
						$(".roomname").jqxDropDownList({source: dataAdapter});
					}
				}
			});
		});
		
		//
		$(".roomname").jqxDropDownList({
			theme : theme,
			source: null,
			placeHolder : '请选择客房~',
			width: '110',
			height: '30',
			dropDownHeight: '80',
			displayMember: "roomName",
		    valueMember: "id"
		});
		
		//
		$(".checkintime").jqxDateTimeInput({
			theme : theme,
			formatString : "yyyy-MM-dd",
			culture : 'ch-CN',
			placeHolder: "入住时间",
			value : null,
			width : '150',
			height : '30',
		});
		
		//
		$(".expiretime").jqxDateTimeInput({
			theme : theme,
			formatString : "yyyy-MM-dd",
			culture : 'ch-CN',
			placeHolder: "到期时间",
			value : null,
			width : '150',
			height : '30',
		});
		
		// 加载所有的客房类型
		$.ajax({
			url:basePath+"/admin/roomManage/queryAllRoomStyle",
			type: 'post',
			async: false,
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
					$(".roomstyle").jqxDropDownList({source: dataAdapter});
				}
			}
		});
		
		// 加载所有的消费类型
		$.ajax({
			url:basePath+"/admin/serviceManage/queryAllServiceStyle",
			type: 'post',
			async: false,
			success: function(data){
				serviceList = data.datamap.serviceList;
				if(data.result=="success"){
				console.log(data.datamap.serviceList);
					source ={
					datatype: "json",
					datafields: 
						[{ name: 'serviceType' },
						 { name: 'id' }],
						 localdata: data.datamap.serviceList
					};
					dataAdapter = new $.jqx.dataAdapter(source);
					$(".servicestyle").jqxDropDownList({source: dataAdapter});
				}
			}
		});
		
	});
	
	function formatRealName(data){
		for(var i = 0;i<data.length;i++){
			if(data[i].realName!=null){
				var namepinyin = codefans_net_CC2PY(data[i].realName);
				data[i].realNamePinYin = namepinyin;
			}
		}
	}
	
	function formatSex(data){
		if(data=="m"){
			return "男";
		}else if(data=="f"){
			return "女";
		}
	}
	
	function formatStatus(data){
		if(data=="0"){
			return "会员";
		}else if(data=="1"){
			return "顾客";
		}
	}
	
	function formatOrderStatus(data){
		if(data=="0"){
			return "预定";
		}else if(data=="1"){
			return "入住";
		}else if(data=="2"){
			return "退房";
		}else if(data=="3"){
			return "换房";
		}else if(data=="4"){
			return "续房";
		}
	}
	
	function formatServiceStatus(data){
		if(data=="0"){
			return "未完成";
		}else if(data=="1"){
			return "已完成";
		}
	}
	
	function showData(userid){
		for(var i = 0;i<localdata.userList.length;i++){
				if(localdata.userList[i].id==userid){
					// 选中了该用户
					var infoHtml = "<div class='animated fadeInDown' style='width:100%;height:100px;border:1px solid #eee;background:rgba(37,192,22,.5);'>"+
"						<div class='leftpic' style='float:left;width:90px;height:90px;border-radius:50%;background:#fff;margin:-10px 0 0px 50px;box-shadow:0px 0px 10px #000;'>"+
"							<img alt='' src='${basePath}/"+localdata.userList[i].picUrl+"' width='90px' height='90px' style='border-radius:50%;'>"+
"						</div>"+
"						<div class='rightinfo' style='margin-left:30px;width:80%;height:100%;float:left;'>"+
"							<div class='top' style='width:100%;height:30px;margin-top:10px;'>"+
"								<div class='r_realname' style='width:140px;height:30px;float:left;'>"+
"									<span style='display:inline-block;width:40px;height:30px;color:#333;line-height:30px;float:left;'>姓名：</span><div style='float:left;width:auto;height:30px;color:#000;line-height:30px;'>"+localdata.userList[i].realName+"</div>"+
"								</div>"+
"								<div class='r_sex' style='width:140px;height:30px;float:left;'>"+
"									<span style='display:inline-block;width:40px;height:30px;color:#333;line-height:30px;float:left;'>性别：</span><div style='float:left;width:auto;height:30px;color:#000;line-height:30px;'>"+formatSex(localdata.userList[i].sex)+"</div>"+
"								</div>"+
"								<div class='r_email' style='width:440px;height:30px;float:left;'>"+
"									<span style='display:inline-block;width:40px;height:30px;color:#333;line-height:30px;float:left;'>邮箱：</span><div style='float:left;width:auto;height:30px;color:#000;line-height:30px;'>"+localdata.userList[i].email+"</div>"+
"								</div>"+
"							</div>"+
"							<div class='bottom' style='width:100%;height:30px;margin-top:10px;'>"+
"								<div class='r_idcard' style='width:280px;height:30px;float:left;'>"+
"									<span style='display:inline-block;width:70px;height:30px;color:#333;line-height:30px;float:left;'>身份证号：</span><div style='float:left;width:auto;height:30px;color:#000;line-height:30px;'>"+localdata.userList[i].idCard+"</div>"+
"								</div>"+
"								<div class='r_phone' style='width:240px;height:30px;float:left;'>"+
"									<span style='display:inline-block;width:56px;height:30px;color:#333;line-height:30px;float:left;'>手机号：</span><div style='float:left;width:auto;height:30px;color:#000;line-height:30px;'>"+localdata.userList[i].phoneNum+"</div>"+
"								</div>"+
"								<div class='r_status' style='width:240px;height:30px;float:left;'>"+
"									<span style='display:inline-block;width:40px;height:30px;color:#333;line-height:30px;float:left;'>身份：</span><div style='float:left;width:auto;height:30px;color:#000;line-height:30px;'>"+formatStatus(localdata.userList[i].status)+"</div>"+
"								</div>"+
"							</div>"+
"						</div>"+
"					</div>"
					$(".r_showInfo").append(infoHtml);
				}
			}
			
			$.ajax({
				url: basePath+"/admin/checkOut/queryBillNowByUserId",
				data: {"userid":userid},
				type: 'post',
				success:function(data){
					if(data.result=="success"){
						
						//--------展示数据(用户客房消费，注意是当前账单的过滤)
						if(data.datamap.orderListMap[userid]!=null){
							chooseroomid = data.datamap.orderListMap[userid].roomId.id;
							var roomServiceHtml = "<li class='animated fadeInDown roomService' style='width:100%;height:60px;border:1px solid #eee;margin-top:10px;background:#fff;box-shadow:0px 0px 5px #eee;'>"+
			"					<div style='width:260px;height:30px;margin-top:12px;margin-left:30px;float:left;'>"+
			"						<span style='display:inline-block;width:50px;height:30px;float:left;line-height:30px;'>费用名:</span><div style='width:auto;height:30px;float:left;line-height:30px;'>酒店住房（"+data.datamap.orderListMap[userid].roomId.roomStyle.roomStyle+"）</div>"+
			"					</div>"+
			"					<div style='width:200px;height:30px;margin-top:12px;float:left;'>"+
			"						<span style='display:inline-block;width:50px;height:30px;float:left;line-height:30px;'>客房号:</span><div style='width:auto;height:30px;float:left;line-height:30px;'>"+data.datamap.orderListMap[userid].roomId.roomName+"</div>"+
			"					</div>"+
			"					<div style='width:200px;height:30px;margin-top:12px;float:left;'>"+
			"						<span style='display:inline-block;width:40px;height:30px;float:left;line-height:30px;'>状态:</span><div style='width:auto;height:30px;float:left;line-height:30px;'>"+formatOrderStatus(data.datamap.orderListMap[userid].orderStatus)+"</div>"+
			"					</div>"+
			"					<div style='width:200px;height:30px;margin-top:12px;float:left;'>"+
			"						<span style='display:inline-block;width:40px;height:30px;float:left;line-height:30px;'>费用:</span><div class='money' style='width:auto;height:30px;float:left;line-height:30px;'>"+data.datamap.orderListMap[userid].roomId.roomStyle.price+"</div>"+
			"					</div>"+
			"				</li>"
							$(".r_billList ul").append(roomServiceHtml);
						}
						
						//--------展示数据(用户普通消费，注意是当前账单的过滤)
						if(data.datamap.serviceOrderListMap[userid]!=null){
							for(var i = 0;i<(data.datamap.serviceOrderListMap[userid]).length;i++){
								if(data.datamap.serviceOrderListMap[userid][i].serviceId.id!="3"){
									var ServiceHtml = "<li class='animated fadeInDown Service' style='width:100%;height:60px;border:1px solid #eee;margin-top:10px;background:#fff;box-shadow:0px 0px 5px #eee;'>"+
				"						<div style='width:260px;height:30px;margin-top:12px;margin-left:30px;float:left;'>"+
				"							<span style='display:inline-block;width:50px;height:30px;float:left;line-height:30px;'>费用名:</span><div style='width:auto;height:30px;float:left;line-height:30px;'>酒店消费（"+data.datamap.serviceOrderListMap[userid][i].serviceId.serviceType+"）</div>"+
				"						</div>"+
				"						<div style='width:200px;height:30px;margin-top:12px;float:left;'>"+
				"							<span style='display:inline-block;width:40px;height:30px;float:left;line-height:30px;'>状态:</span><div style='width:auto;height:30px;float:left;line-height:30px;'>"+formatServiceStatus(data.datamap.serviceOrderListMap[userid][i].status)+"</div>"+
				"						</div>"+
				"						<div style='width:200px;height:30px;margin-top:12px;float:left;'>"+
				"							<span style='display:inline-block;width:40px;height:30px;float:left;line-height:30px;'>费用:</span><div class='money' style='width:auto;height:30px;float:left;line-height:30px;'>"+data.datamap.serviceOrderListMap[userid][i].allMoney+"</div>"+
				"						</div>"+
				"					</li>"
									$(".r_billList ul").append(ServiceHtml);
								}
							}
						}
						
						//--------展示数据(用户用餐消费，注意是当前账单的过滤)
						if(data.datamap.serviceOrderListMap[userid]!=null){
							for(var i = 0;i<(data.datamap.serviceOrderListMap[userid]).length;i++){
								if(data.datamap.serviceOrderListMap[userid][i].serviceId.id=="3"){
									var foodServiceHtml = "<li class='animated fadeInDown foodService' style='width:100%;height:auto;margin-top:10px;'>"+
				"							<div style='border:1px solid #eee;width:100%;height:60px;background:#fff;box-shadow:0px 0px 5px #eee;'>"+
				"								<div style='width:260px;height:30px;margin-top:12px;margin-left:30px;float:left;'>"+
				"									<span style='display:inline-block;width:50px;height:30px;float:left;line-height:30px;'>费用名:</span><div style='width:auto;height:30px;float:left;line-height:30px;'>酒店消费（"+data.datamap.serviceOrderListMap[userid][i].serviceId.serviceType+"）</div>"+
				"								</div>"+
				"								<div style='width:200px;height:30px;margin-top:12px;float:left;'>"+
				"									<span style='display:inline-block;width:40px;height:30px;float:left;line-height:30px;'>状态:</span><div style='width:auto;height:30px;float:left;line-height:30px;'>"+formatServiceStatus(data.datamap.serviceOrderListMap[userid][i].status)+"</div>"+
				"								</div>"+
				"								<div style='width:200px;height:30px;margin-top:12px;float:left;'>"+
				"									<span style='display:inline-block;width:40px;height:30px;float:left;line-height:30px;'>费用:</span><div class='money' style='width:auto;height:30px;float:left;line-height:30px;'>"+data.datamap.serviceOrderListMap[userid][i].allMoney+"</div>"+
				"								</div>"+
				"								<div style='width:70px;height:30px;margin-top:12px;float:right;'>"+
				"									<span id='fooddetail' style='display:inline-block;width:50px;height:30px;float:left;line-height:30px;color:#25c016;cursor:pointer;'>明细&gt;&gt;</span>"+
				"								</div>"+
				"							</div>"+
				"							<div class='detailbox' style='display:none;width:99%;height:100px;margin-left:6px;border:1px solid #eee;border-radius:0px 0px 4px 4px;'></div>"+
				"						</li>"
									$(".r_billList ul").append(foodServiceHtml);
								}
							}
						}
						var status = 0;//0是关闭，1是打开
						$("#fooddetail").on("click",function(){
							if(status == 0){
								$(".detailbox").slideDown();
								status = 1;
							}else if(status == 1){
								$(".detailbox").slideUp();
								status = 0;
							}
						})
						
						//--------展示数据(用户消费总计)
						var roommoney = 0;
						for(var i = 0;i<$(".roomService .money").length;i++){
							roommoney = Number(roommoney) + Number($(".roomService .money").eq(i).text());
						}
						var foodmoney = 0;
						for(var i = 0;i<$(".foodService .money").length;i++){
							foodmoney = Number(foodmoney) + Number($(".foodService .money").eq(i).text());
						}
						var servicemoney = 0;
						for(var i = 0;i<$(".Service .money").length;i++){
							servicemoney = Number(servicemoney) + Number($(".Service .money").eq(i).text());
						}
						var total = Number(roommoney)+Number(foodmoney)+Number(servicemoney);
						var totalHtml = "<div class='animated fadeInDown' style='width:100%;height:100px;'>"+
			"				<div style='width:150px;height:40px;float:right;text-align:right;margin-top:30px;line-height:40px;font-size:16px;'>总计消费：<span style='color:red;'>￥</span>"+total+"</div>"+
			"			</div>"
						$(".r_total").append(totalHtml);
						
					}else{
						showInfo("没有当前账单记录~","warning");
					}
				}
			});
	}
	
	$("#customerName").keyup(function(){
		$(".name_xiala ul").empty();
		var html = new Array();
		var text = $(this).val().toUpperCase();
		var val = $(this).val();
		$(".name_xiala").show();
		for(var i = 0;i<localdata.userList.length;i++){
			if(localdata.userList[i].realNamePinYin!=null){
				if(localdata.userList[i].realNamePinYin[0]==text||localdata.userList[i].realNamePinYin==text||localdata.userList[i].realName==val){
					html.push("<li class='name_li' userid='"+localdata.userList[i].id+"' style='line-height:30px;width:155px;height:30px;background:#fff;text-indent:10px;cursor:pointer;'>"+localdata.userList[i].realName+"</li>");
				}
			}
		}
		$(".name_xiala ul").append(html);
		if(text==""){
			$(".name_xiala").hide();
		}
		$(".name_li").on("click",function(){
			$("#s_now").jqxButton({disabled:true});
			$("#customerName").val($(this).text());
			$(".name_xiala").hide();
			$(".r_init").hide();
			$(".r_showInfo").empty();
			$(".r_billList ul").empty();
			$(".r_total").empty();
			$(".r_roommanage").hide();
			$(".r_servicemanage").hide();
			// 展示数据
			var userid = $(this).attr("userid");
			chooseuserid = userid;
			showData(userid);
			// 显示按钮
			$(".s_room,.s_service,.s_history,.s_now").show();
		});
	});
	
	$("#s_room").click(function(){
		$(".r_init").hide();
		$(".r_servicemanage").hide();
		$(".r_showInfo").empty();
		$(".r_billList ul").empty();
		$(".r_total").empty();
		$(".r_roommanage").show();
		$(".room_info").empty();
		$("#s_now").jqxButton({disabled:false});
		for(var i = 0;i<localdata.userList.length;i++){
			if(localdata.userList[i].id==chooseuserid){
				var html = "<div style='margin-left:30px;margin-top:10px;'><span>姓名：</span>"+localdata.userList[i].realName+"</div>"+
"						<div style='margin-left:30px;margin-top:10px;'><span>身份证号：</span>"+localdata.userList[i].idCard+"</div>"+
"						<div style='margin-left:30px;margin-top:10px;'><span>手机号：</span>"+localdata.userList[i].phoneNum+"</div>"
				$(".room_info").append(html);
			}
		}
		$.ajax({
			url: basePath+"/admin/checkOut/queryBillNowByUserId",
			data: {"userid":chooseuserid},
			type: 'post',
			success:function(data){
				if(data.result=="success"){
					$("#s_add").jqxButton({disabled:true});
					$("#s_quit").jqxButton({disabled:false});
					$("#s_change").jqxButton({disabled:false});
					$("#s_continue").jqxButton({disabled:false});
					var html = "<div style='margin-left:30px;margin-top:10px;'>"+
	"							<span>住房订单信息：</span>"+
	"							<div>"+
	"								<div style='margin-top:10px;float:left;width:150px;height:auto;'><span>住房信息：</span>"+data.datamap.orderListMap[chooseuserid].roomId.roomStyle.roomStyle+"</div>"+
	"								<div style='margin-top:10px;float:left;width:130px;height:auto;'><span>房号：</span>"+data.datamap.orderListMap[chooseuserid].roomId.roomName+"</div>"+
	"								<div style='margin-top:10px;float:left;width:130px;height:auto;'><span>状态：</span>"+formatOrderStatus(data.datamap.orderListMap[chooseuserid].orderStatus)+"</div>"+
	"								<div style='margin-top:10px;float:left;width:130px;height:auto;'><span>费用：</span>"+data.datamap.orderListMap[chooseuserid].roomId.roomStyle.price+"</div>"+
	"								<div style='margin-top:10px;float:left;width:170px;height:auto;'><span>入住时间：</span>"+(data.datamap.orderListMap[chooseuserid].checkInTime).split('T')[0]+"</div>"+
	"								<div style='margin-top:10px;float:left;width:170px;height:auto;'><span>到期时间：</span>"+(data.datamap.orderListMap[chooseuserid].expireTime).split('T')[0]+"</div>"+
	"							</div>"+
	"						</div>"
					$(".room_info").append(html);
				}else{
					var html = "<div style='margin-left:30px;margin-top:10px;'>"+
		"							<span>住房订单信息：</span>"+
		"							<div style='margin-top:10px;'>暂时没有住房订单信息~</div>"+
		"						</div>"
					$(".room_info").append(html);
					$("#s_add").jqxButton({disabled:false});
					$("#s_quit").jqxButton({disabled:true});
					$("#s_change").jqxButton({disabled:true});
					$("#s_continue").jqxButton({disabled:true});
				}
			}
		});
	});
	
	$("#s_service").click(function(){
		$("#s_now").jqxButton({disabled:false});
		$(".r_init").hide();
		$(".r_showInfo").empty();
		$(".r_billList ul").empty();
		$(".service_info ul").empty();
		$(".r_total").empty();
		$(".r_roommanage").hide();
		$(".r_servicemanage").show();
		// 请求服务的数据
		$.ajax({
			url: basePath+"/admin/checkOut/queryBillNowByUserId",
			data: {"userid":chooseuserid},
			type: 'post',
			success:function(data){
				if(data.result=="success"&&data.datamap.serviceOrderListMap[chooseuserid].length!=0){
					//--------展示数据(用户普通消费，注意是当前账单的过滤)
					if(data.datamap.serviceOrderListMap[chooseuserid]!=null){
						for(var i = 0;i<(data.datamap.serviceOrderListMap[chooseuserid]).length;i++){
							if(data.datamap.serviceOrderListMap[chooseuserid][i].serviceId.id!="3"){
								var ServiceHtml = "<li class='animated fadeInDown Service' style='width:100%;height:60px;border:1px solid #eee;margin-top:10px;background:#fff;box-shadow:0px 0px 5px #eee;'>"+
			"						<div style='width:260px;height:30px;margin-top:12px;margin-left:30px;float:left;'>"+
			"							<span style='display:inline-block;width:50px;height:30px;float:left;line-height:30px;'>费用名:</span><div style='width:auto;height:30px;float:left;line-height:30px;'>酒店消费（"+data.datamap.serviceOrderListMap[chooseuserid][i].serviceId.serviceType+"）</div>"+
			"						</div>"+
			"						<div style='width:200px;height:30px;margin-top:12px;float:left;'>"+
			"							<span style='display:inline-block;width:40px;height:30px;float:left;line-height:30px;'>状态:</span><div style='width:auto;height:30px;float:left;line-height:30px;'>"+formatServiceStatus(data.datamap.serviceOrderListMap[chooseuserid][i].status)+"</div>"+
			"						</div>"+
			"						<div style='width:200px;height:30px;margin-top:12px;float:left;'>"+
			"							<span style='display:inline-block;width:40px;height:30px;float:left;line-height:30px;'>费用:</span><div class='money' style='width:auto;height:30px;float:left;line-height:30px;'>"+data.datamap.serviceOrderListMap[chooseuserid][i].allMoney+"</div>"+
			"						</div>"+
			"					</li>"
								$(".service_info ul").append(ServiceHtml);
							}
						}
					}
					
					//--------展示数据(用户用餐消费，注意是当前账单的过滤)
					if(data.datamap.serviceOrderListMap[chooseuserid]!=null){
						for(var i = 0;i<(data.datamap.serviceOrderListMap[chooseuserid]).length;i++){
							if(data.datamap.serviceOrderListMap[chooseuserid][i].serviceId.id=="3"){
								var foodServiceHtml = "<li class='animated fadeInDown foodService' style='width:100%;height:auto;margin-top:10px;'>"+
			"							<div style='border:1px solid #eee;width:100%;height:60px;background:#fff;box-shadow:0px 0px 5px #eee;'>"+
			"								<div style='width:260px;height:30px;margin-top:12px;margin-left:30px;float:left;'>"+
			"									<span style='display:inline-block;width:50px;height:30px;float:left;line-height:30px;'>费用名:</span><div style='width:auto;height:30px;float:left;line-height:30px;'>酒店消费（"+data.datamap.serviceOrderListMap[chooseuserid][i].serviceId.serviceType+"）</div>"+
			"								</div>"+
			"								<div style='width:200px;height:30px;margin-top:12px;float:left;'>"+
			"									<span style='display:inline-block;width:40px;height:30px;float:left;line-height:30px;'>状态:</span><div style='width:auto;height:30px;float:left;line-height:30px;'>"+formatServiceStatus(data.datamap.serviceOrderListMap[chooseuserid][i].status)+"</div>"+
			"								</div>"+
			"								<div style='width:200px;height:30px;margin-top:12px;float:left;'>"+
			"									<span style='display:inline-block;width:40px;height:30px;float:left;line-height:30px;'>费用:</span><div class='money' style='width:auto;height:30px;float:left;line-height:30px;'>"+data.datamap.serviceOrderListMap[chooseuserid][i].allMoney+"</div>"+
			"								</div>"+
			"								<div style='width:70px;height:30px;margin-top:12px;float:right;'>"+
			"									<span id='fooddetail' style='display:inline-block;width:50px;height:30px;float:left;line-height:30px;color:#25c016;cursor:pointer;'>明细&gt;&gt;</span>"+
			"								</div>"+
			"							</div>"+
			"							<div class='detailbox' style='display:none;width:99%;height:100px;margin-left:6px;border:1px solid #eee;border-radius:0px 0px 4px 4px;'></div>"+
			"						</li>"
								$(".service_info ul").append(foodServiceHtml);
							}
						}
					}
					var status = 0;//0是关闭，1是打开
					$("#fooddetail").on("click",function(){
						if(status == 0){
							$(".detailbox").slideDown();
							status = 1;
						}else if(status == 1){
							$(".detailbox").slideUp();
							status = 0;
						}
					});
					$(".service_init").hide();
				}else{
					$(".service_init").show();
				}
			}
		});
	});
	
	$("#s_history").click(function(){
		$("#s_now").jqxButton({disabled:false});
		$(".r_init").hide();
		$(".r_showInfo").empty();
		$(".r_billList ul").empty();
		$(".r_total").empty();
		$(".r_roommanage").hide();
		$(".r_servicemanage").hide();
	});
	
	$("#s_now").click(function(){
		window.location.href=basePath+"/toadmin/adminPage/toCheckoutCenter?id="+chooseuserid;
	});
	
	$("#s_add").click(function(){
		$(".addroomwindow").jqxWindow('open');
	});
	$("#s_quit").click(function(){
		$(".quitroomwindow").jqxWindow('open');
	});
	$("#s_change").click(function(){
		alert(3);
	});
	$("#s_continue").click(function(){
		alert(4);
	});
	$("#s_addservice").click(function(){
		$(".addservicewindow").jqxWindow('open');
	});
</script>
</body>
</html>