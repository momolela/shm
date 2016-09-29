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
				<!-- <div class="s_phone" style="width:250px;height:40px;float:left;">
					<span style="float:left;display:inline-block;width:56px;height:40px;color:#333;font-size:14px;line-height:40px;">手机号：</span>
					<div>
						<input type="text" placeholder="请输入手机号" style="float:left;width:150px;height:30px;margin-top:5px;padding-left:5px;"/>
					</div>
				</div> -->
			</div>
			<!-- r_search end -->
			
			<div style="width:94%;height:auto;min-height:400px;margin-left:30px;margin-top:10px;margin-bottom:10px;border:1px solid #eee;">
			
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
				
			</div>
			
		</div>
		<!--end t_right-->

	</div>

<script type="text/javascript" src="${basePath }/js/PinYin.js"></script>
<script type="text/javascript">
	var localdata;

	// 点击logo回到前台首页
	function toIndex(){
		window.location.href = basePath+"/page/toIndex";
	}
	
	$(function(){
		// 到数据库中加载顾客数据，保存到当前页面
		$.ajax({
			url: basePath+"/admin/checkOut/queryAllCheckOutInfo",
			type: 'post',
			success: function(data){
				localdata = data.datamap;
				formatRealName(localdata.userList);
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
			return "入住";
		}else if(data=="1"){
			return "退房";
		}else if(data=="2"){
			return "换房";
		}
	}
	
	function formatServiceStatus(data){
		if(data=="0"){
			return "未完成";
		}else if(data=="1"){
			return "已完成";
		}
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
			$("#customerName").val($(this).text());
			$(".name_xiala").hide();
			$(".r_init").hide();
			$(".r_showInfo").empty();
			$(".r_billList ul").empty();
			$(".r_total").empty();
			//--------展示数据(用户信息)
			var userid = $(this).attr("userid")
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
			
			//--------展示数据(用户客房消费)
			if(localdata.orderListMap[userid]!=null){
				for(var i = 0;i<(localdata.orderListMap[userid]).length;i++){
					var roomServiceHtml = "<li class='animated fadeInDown roomService' style='width:100%;height:60px;border:1px solid #eee;margin-top:10px;background:#fff;box-shadow:0px 0px 5px #eee;'>"+
	"					<div style='width:260px;height:30px;margin-top:12px;margin-left:30px;float:left;'>"+
	"						<span style='display:inline-block;width:50px;height:30px;float:left;line-height:30px;'>费用名:</span><div style='width:auto;height:30px;float:left;line-height:30px;'>酒店住房（"+localdata.orderListMap[userid][i].roomId.roomStyle.roomStyle+"）</div>"+
	"					</div>"+
	"					<div style='width:200px;height:30px;margin-top:12px;float:left;'>"+
	"						<span style='display:inline-block;width:50px;height:30px;float:left;line-height:30px;'>客房号:</span><div style='width:auto;height:30px;float:left;line-height:30px;'>"+localdata.orderListMap[userid][i].roomId.roomName+"</div>"+
	"					</div>"+
	"					<div style='width:200px;height:30px;margin-top:12px;float:left;'>"+
	"						<span style='display:inline-block;width:40px;height:30px;float:left;line-height:30px;'>状态:</span><div style='width:auto;height:30px;float:left;line-height:30px;'>"+formatOrderStatus(localdata.orderListMap[userid][i].orderStatus)+"</div>"+
	"					</div>"+
	"					<div style='width:200px;height:30px;margin-top:12px;float:left;'>"+
	"						<span style='display:inline-block;width:40px;height:30px;float:left;line-height:30px;'>费用:</span><div class='money' style='width:auto;height:30px;float:left;line-height:30px;'>"+localdata.orderListMap[userid][i].roomId.roomStyle.price+"</div>"+
	"					</div>"+
	"				</li>"
					$(".r_billList ul").append(roomServiceHtml);
				}
			}
			
			//--------展示数据(用户普通消费)
			if(localdata.serviceOrderListMap[userid]!=null){
				for(var i = 0;i<(localdata.serviceOrderListMap[userid]).length;i++){
					if(localdata.serviceOrderListMap[userid][i].serviceId.id!="3"){
						var ServiceHtml = "<li class='animated fadeInDown Service' style='width:100%;height:60px;border:1px solid #eee;margin-top:10px;background:#fff;box-shadow:0px 0px 5px #eee;'>"+
	"						<div style='width:260px;height:30px;margin-top:12px;margin-left:30px;float:left;'>"+
	"							<span style='display:inline-block;width:50px;height:30px;float:left;line-height:30px;'>费用名:</span><div style='width:auto;height:30px;float:left;line-height:30px;'>酒店消费（"+localdata.serviceOrderListMap[userid][i].serviceId.serviceType+"）</div>"+
	"						</div>"+
	"						<div style='width:200px;height:30px;margin-top:12px;float:left;'>"+
	"							<span style='display:inline-block;width:40px;height:30px;float:left;line-height:30px;'>状态:</span><div style='width:auto;height:30px;float:left;line-height:30px;'>"+formatServiceStatus(localdata.serviceOrderListMap[userid][i].status)+"</div>"+
	"						</div>"+
	"						<div style='width:200px;height:30px;margin-top:12px;float:left;'>"+
	"							<span style='display:inline-block;width:40px;height:30px;float:left;line-height:30px;'>费用:</span><div class='money' style='width:auto;height:30px;float:left;line-height:30px;'>"+localdata.serviceOrderListMap[userid][i].allMoney+"</div>"+
	"						</div>"+
	"					</li>"
						$(".r_billList ul").append(ServiceHtml);
					}
				}
			}
			
			//--------展示数据(用户用餐消费)
			if(localdata.serviceOrderListMap[userid]!=null){
				for(var i = 0;i<(localdata.serviceOrderListMap[userid]).length;i++){
					if(localdata.serviceOrderListMap[userid][i].serviceId.id=="3"){
						var foodServiceHtml = "<li class='foodService' style='width:100%;height:auto;margin-top:10px;'>"+
	"							<div style='border:1px solid #eee;width:100%;height:60px;background:#fff;box-shadow:0px 0px 5px #eee;'>"+
	"								<div style='width:260px;height:30px;margin-top:12px;margin-left:30px;float:left;'>"+
	"									<span style='display:inline-block;width:50px;height:30px;float:left;line-height:30px;'>费用名:</span><div style='width:auto;height:30px;float:left;line-height:30px;'>酒店消费（"+localdata.serviceOrderListMap[userid][i].serviceId.serviceType+"）</div>"+
	"								</div>"+
	"								<div style='width:200px;height:30px;margin-top:12px;float:left;'>"+
	"									<span style='display:inline-block;width:40px;height:30px;float:left;line-height:30px;'>状态:</span><div style='width:auto;height:30px;float:left;line-height:30px;'>"+formatServiceStatus(localdata.serviceOrderListMap[userid][i].status)+"</div>"+
	"								</div>"+
	"								<div style='width:200px;height:30px;margin-top:12px;float:left;'>"+
	"									<span style='display:inline-block;width:40px;height:30px;float:left;line-height:30px;'>费用:</span><div class='money' style='width:auto;height:30px;float:left;line-height:30px;'>"+localdata.serviceOrderListMap[userid][i].allMoney+"</div>"+
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
			
		});
	});
	
	
	
</script>
</body>
</html>