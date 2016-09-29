<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@include file="/commons/taglib.jsp" %>
<!doctype html>
<html >
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
		<title>界面管理</title>
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
			.fm_content .t_header .h_nav ul li a .h_icon2{background-position:-24px -25px;}
			.fm_content .t_header .h_nav ul li a .h_icon3{background-position:-48px 0;}
			.fm_content .t_header .h_nav ul li a:hover .h_icon3{background-position:-48px -25px;}
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
			.fm_content .t_right{background:#f3f4f5;margin-left:200px;width:100%;position:absolute;}

			/*r_location start*/
			.fm_content .t_right .r_location{height:51px;background:#e5e5e5;border-bottom:1px solid #ccc;line-height:51px;}
			.fm_content .t_right .r_location i{width:14px;height:18px;display:block;background:url("${basePath}/images/admin/index/ht_icon.png") no-repeat;background-position:-16px -51px;float:left;margin:16px 20px 0 20px;}

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

			/*r_content start*/
			.fm_content .t_right .r_content{width:100%;background:#bbb;position: relative;}
			.fm_content .t_right .r_content .c_content{width:100%;height: 100%;background: #efefef;}
			.fm_content .t_right .r_content .c_content ul{height: 30px;}
			.fm_content .t_right .r_content .c_content ul li{float: left;width: 80px;height: 30px;text-align: center;}
			.fm_content .t_right .r_content .c_content ul li a{color: #999999;font-weight: bold;display: block;width: 80px;height: 40px;line-height: 40px;}
			.fm_content .t_right .r_content .c_content .bannertable{width:100%;}
			.fm_content .t_right .r_content .c_content .bannertable table{border: 1px solid #ddd;border-collapse: collapse;width: 100%;text-align: left;border: 1px solid #eee;}
			.fm_content .t_right .r_content .c_content .bannertable table thead th{text-align:center;background: #eee;color: #666;height: 26px;padding: 8px;font-size: 12px;}
			.fm_content .t_right .r_content .c_content .bannertable table tr:hover{background: #eee;}
			.fm_content .t_right .r_content .c_content .bannertable table tr:hover .t_action .inner{display: block;}
			.fm_content .t_right .r_content .c_content .bannertable table td{text-align:center;border: 1px solid #ddd;height: 34px;padding: 8px;}
			.fm_content .t_right .r_content .c_content .bannertable table td .t_action{width: 81px;height: 24px;margin: 0 auto;}
			.fm_content .t_right .r_content .c_content .bannertable table td .t_action .inner{display:none;}
			.fm_content .t_right .r_content .c_content .bannertable table td .t_action a{width: 24px;height: 24px;display: block;float: left;margin-right: 2px;background: url("${basePath}/images/admin/index/ht_icon.png") no-repeat;}
			.fm_content .t_right .r_content .c_content .bannertable table td .t_action .a_see{background-position: -359px -45px;background-color: #6297bc;}
			.fm_content .t_right .r_content .c_content .bannertable table td .t_action .a_change{background-position: -379px -47px;background-color: #27a9e3;}
			.fm_content .t_right .r_content .c_content .bannertable table td .t_action .a_delete{background-position: -417px -48px;background-color: #ff912f;}
			.fm_content .t_right .r_content .c_content .bannertable .add_banner{width: 130px;height: 34px;background: #bbb;margin-top: 30px;}
			.fm_content .t_right .r_content .c_content .bannertable .add_banner a{display: block;width: 130px;height: 34px;background: #bbb;border-radius: 3px;text-align: center;line-height: 34px;color: #fff;font-size: 14px;}
			.fm_content .t_right .r_content .c_content .bannertable .add_banner a.on{cursor: default;}
			.fm_content .t_right .r_content .c_content .bannertable .add_banner i{width: 15px;height: 14px;display: inline-block;background: url("${basePath}/images/admin/index/ht_icon.png") no-repeat -33px -52px;vertical-align: middle;}
			.fm_content .t_right .r_content .c_content .bannertable .add_box{display:none;position: fixed;top:0;left:0;width: 100%;height: 100%;background: rgba(0,0,0,.6);z-index: 999;}
			.fm_content .t_right .r_content .c_content .bannertable .add_box .b_content{border-radius:4px;width: 800px;height: 500px;background: #fff;position: fixed;top: 50%;left:50%;margin-top: -250px;margin-left: -400px;z-index: 11;}
			.fm_content .t_right .r_content .c_content .bannertable .add_box .b_content .title{width: 100%;height: 50px;border-bottom: 1px solid #eee;}
			.fm_content .t_right .r_content .c_content .bannertable .add_box .b_content .title span{display: block;width: 150px;height: 50px;float: left;font-size: 16px;color: #333;line-height: 50px;text-indent: 20px;}
			.fm_content .t_right .r_content .c_content .bannertable .add_box .b_content .title a{font-size:14px;display: block;width: 16px;height: 16px;text-decoration: none;border: 1px solid #bbb;color: #333;border-radius: 50%;float: right;text-align: center;line-height: 16px;margin: 15px 15px 0 0;}
			.fm_content .t_right .r_content .c_content .bannertable .add_box .b_content .content{padding: 20px;width: 760px;height: 410px;}
			.fm_content .t_right .r_content .c_content .bannertable .add_box .b_content .content form span{margin-left:10px;font-size:16px;display: inline-block;width: 150px;height: 40px;text-align: left;line-height: 20px;vertical-align: top;}
			.fm_content .t_right .r_content .c_content .bannertable .add_box .b_content .content form .btitle{width: 390px;height: 30px;outline: none;border: 1px solid #bbb;padding-left: 10px;}
			.fm_content .t_right .r_content .c_content .bannertable .add_box .b_content .content form .bcontent{width: 570px;height: 180px;padding: 10px;outline: none;}
			.fm_content .t_right .r_content .c_content .bannertable .add_box .b_content .content form .bimg{}
			.fm_content .t_right .r_content .c_content .bannertable .add_box .b_content .content form .submit{background: #33cc00;border: 0;width: 100px;height: 30px;color: #fff;border-radius: 4px;cursor: pointer;font-weight: bold;margin:10px 0 0 10px;text-align:center;line-height:30px;}
			.fm_content .t_right .r_content .c_content .bannertable .edit_box{display:none;position: fixed;top:0;left:0;width: 100%;height: 100%;background: rgba(0,0,0,.6);z-index: 999;}
			.fm_content .t_right .r_content .c_content .bannertable .edit_box .b_content{border-radius:4px;width: 800px;height: 500px;background: #fff;position: fixed;top: 50%;left:50%;margin-top: -250px;margin-left: -400px;z-index: 11;}
			.fm_content .t_right .r_content .c_content .bannertable .edit_box .b_content .title{width: 100%;height: 50px;border-bottom: 1px solid #eee;}
			.fm_content .t_right .r_content .c_content .bannertable .edit_box .b_content .title span{display: block;width: 150px;height: 50px;float: left;font-size: 16px;color: #333;line-height: 50px;text-indent: 20px;}
			.fm_content .t_right .r_content .c_content .bannertable .edit_box .b_content .title a{font-size:14px;display: block;width: 16px;height: 16px;text-decoration: none;border: 1px solid #bbb;color: #333;border-radius: 50%;float: right;text-align: center;line-height: 16px;margin: 15px 15px 0 0;}
			.fm_content .t_right .r_content .c_content .bannertable .edit_box .b_content .content{padding: 20px;width: 760px;height: 410px;}
			.fm_content .t_right .r_content .c_content .bannertable .edit_box .b_content .content form span{margin-left:10px;font-size:16px;display: inline-block;width: 150px;height: 40px;text-align: left;line-height: 20px;vertical-align: top;}
			.fm_content .t_right .r_content .c_content .bannertable .edit_box .b_content .content form .btitle{width: 390px;height: 30px;outline: none;border: 1px solid #bbb;padding-left: 10px;}
			.fm_content .t_right .r_content .c_content .bannertable .edit_box .b_content .content form .bcontent{width: 570px;height: 180px;padding: 10px;outline: none;}
			.fm_content .t_right .r_content .c_content .bannertable .edit_box .b_content .content form .bimg{margin-right:78px;float:right;width: 390px;height: 30px;outline: none;border: 1px solid #bbb;padding-left: 10px;}
			.fm_content .t_right .r_content .c_content .bannertable .edit_box .b_content .content form .submit{background: #33cc00;border: 0;width: 100px;height: 30px;color: #fff;border-radius: 4px;cursor: pointer;font-weight: bold;margin:30px 0 0 10px;text-align:center;line-height:30px;}
			.fm_content .t_right .r_content .c_content .bannertable .see_box{display:none;position: fixed;top:0;left:0;width: 100%;height: 100%;background: rgba(0,0,0,.6);z-index: 999;}
			.fm_content .t_right .r_content .c_content .bannertable .see_box .b_content{border-radius:4px;width: 790px;height: 490px;background: #fff;position: fixed;top: 50%;left:50%;margin-top: -250px;margin-left: -400px;z-index: 11;padding: 5px;}
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
						<a href="#"  class="h_sel">
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
				<p>您当前所在位置：首页 &gt; 界面管理</p>
			</div>
			<!--end r_location-->

			<!-- r_content start -->
			<div class="r_content">
				<div class="c_content">
					<ul class="nav">
						<li>
							<a href="#">banner管理</a>
						</li>
						<li>
							<a href="#">流行音乐</a>
						</li>
						<li>
							<a href="#">乐享MV</a>
						</li>
						<li>
							<a href="#">资讯快递</a>
						</li>
						<li>
							<a href="#">精品乐单</a>
						</li>
					</ul>
					
					<!-- banner table start -->
					<div class="bannertable">
						<div style="width:80%;height:100%;position:absolute;top:80px;left:40px;">
							<!-- table start -->
							<table id="tabProduct">
								<thead style="border:1px solid #ddd;">
									<tr>
										<th>序号</th>
										<th>图片名称</th>
										<th >图片描述</th>
										<th>图片链接</th>
										<th>管理</th>
									</tr>
								</thead>
								<tbody>
									<c:forEach items="${bannerlist }" var="item"  varStatus="idx">
										<tr class="tr">
											<td>${idx.count }</td>
											<td>${item.btitle }</td>
											<td>${item.bcontent }</td>
											<td>${item.burl }</td>
											<td>
												<div class="t_action">
													<div class="inner">
														<a href="javascript:void(0)" class="a_see" burl="${item.burl }" title="图片预览"></a>
														<a href="javascript:void(0)" class="a_change" btitle="${item.btitle }" bcontent="${item.bcontent }" title="替换"></a>
														<a href="javascript:void(0)" class="a_delete" bid="${item.id }" title="删除"></a>
													</div>
												</div>
											</td>
										</tr>
									</c:forEach>
								</tbody>
							</table>
							<!-- end table -->
							
							<!-- add_banner start -->
							<div class="add_banner">
								<a href="javascript:void(0)" class="">
									<i class="add"></i>
									<span>添加banner图</span>
								</a>
							</div>
							<!-- end add_banner -->
						</div>
						
						<!-- add_box start -->
						<div class="add_box">
							<div class="b_content">
								<div class="title">
									<span>添加banner图片</span>
									<a href="javascript:void(0)">x</a>
								</div>
								<div class="content">
									<form>
										<div><span>填写图片title:</span><input class="btitle" id="btitle" type="text" name="btitle" required/></div>
										<div style="margin-top: 20px;"><span>填写图片content:</span><textarea class="bcontent" id="bcontent"></textarea></div>
										<div style="margin-top: 20px;"><span>选择图片上传:</span><input id="bimg" class="bimg" type="file" name="bimg" required/></div>
										<div class="submit">确认添加</div>
									</form>
								</div>
							</div>
						</div>
						<!-- end add_box -->
						
						<!-- edit_box start -->
						<div class="edit_box">
							<div class="b_content">
								<div class="title">
									<span>编辑banner图片</span>
									<a href="javascript:void(0)">x</a>
								</div>
								<div class="content">
									<form>
										<div><span>填写图片title:</span><input id="beidttitle" class="btitle" type="text" name="btitle" value="" required/></div>
										<div style="margin-top: 20px;"><span>填写图片content:</span><textarea id="beidtcontent" class="bcontent"></textarea></div>
										<div style="margin-top: 20px;"><span style="float:left;">图片地址:</span><input id="editimg" type="file"  name="bimg" /><div style="float:left;line-height:30px;" class="bimg"></div></div>
										<div class="submit">确认修改</div>
									</form>
								</div>
							</div>
						</div>
						<!-- end edit_box -->
						
						<!-- see_box start -->
						<div class="see_box">
							<div class="b_content">
								<img src="" width="790" height="490"/>
							</div>
						</div>
						<!-- end see_box -->
						
					</div>
					<!-- end banner table -->
					
					<!-- music table start -->
					<div></div>
					<!-- end music table -->
					
					<!-- mv table start -->
					<div></div>
					<!-- end mv table -->
					
					<!-- zixun table start -->
					<div></div>
					<!-- end zixun table -->
					
					<!-- yuedan table start -->
					<div></div>
					<!-- end yuedan table -->
					
				</div>
			</div>
			<!-- end r_content -->
         
		</div>
		<!--end t_right-->

	</div>
	
<script type="text/javascript">
	
	// 点击logo回到前台首页
	function toIndex(){
		// alert();
		window.location.href = basePath+"/page/toIndex";
	}
	
	
	// ----------定义全局变量保存上传后的图片的路径数据
	var url;
	
	// ----------点击删除banner图
	$(".fm_content .t_right .r_content .c_content .bannertable table td .t_action .a_delete").click(function(){
		// alert($(this).attr("bid"));
		var _this = $(this);
		
		if($(".tr").length<=3){
			// alert("小于或者等于3个");
			alert("banner图不能少于3个");
		}else{
			// 弹出框询问是否删除该banner
			$.dialog({which:"alert",page:"noIndex",title:"删除banner",content:"你确定要删除这帧banner图吗？",callback:function(ok){
				if(ok){
					// 获取banner对应的id
					var bid = _this.attr("bid");
					// 进行ajax访问然后删除数据库中的数据
					$.tzAjax.request({url:basePath+"/admin/banner/deleteBanner",callback:function(data){
						if(data.result=="success"){
							window.location.reload(location);
						}
					}},{"bid":bid});
				} else{
					window.location.reload(location);
				}
			}});
		}
	});
	
	// ----------点击添加banner图
	$(".add_banner a").click(function(){
		if($(".tr").length>=5){
			// alert("大于或者等于5个");
			alert("banner图不能大于5个");
		}else{
			$(".fm_content .t_right .r_content .c_content .bannertable .add_box").show();
		}
	});
	
	// 点击添加banner图层中的关闭按钮
	$(".fm_content .t_right .r_content .c_content .bannertable .add_box .b_content .title a").click(function(){
		$(".fm_content .t_right .r_content .c_content .bannertable .add_box").hide();
	});
	
	// 点击添加banner图层中的upload按钮
	var t= $.tzUpload({
		url:basePath+"/ajaxupload/ajaxUploadAction/addBanner",
		postName:"bimg",
		type:"*.jpg;*.png;*.jpeg",
		targetId:"bimg",
		size:"10 MB",
		single:false,
		callback:function(data){
			var data = eval("("+data+")");
			url = data.url;
		}
	});
	
	// 点击确认添加按钮添加banner图片
	$(".fm_content .t_right .r_content .c_content .bannertable .add_box .b_content .content form .submit").click(function(){
		var btitle = $("#btitle").val();
		var bcontent = $("#bcontent").val();
		$.tzAjax.request({url:basePath+"/admin/banner/addBanner",callback:function(data){
			if(data.result=="success"){
				window.location.reload(location);
			}
		}},{"btitle":btitle,"bcontent":bcontent,"url":url});
	});
	
	// ----------点击预览图片
	$(".fm_content .t_right .r_content .c_content .bannertable table td .t_action .a_see").click(function(){
		// alert();
		$(".see_box").show();
		$(".see_box .b_content").find("img").attr("src",basePath+"/"+$(this).attr("burl"));
	});
	
	// 点击mask消失
	$(".see_box").click(function(){
		// alert();
		$(this).fadeOut();
	});
	
	// ----------点击替换banner图
	var _this;
	$(".fm_content .t_right .r_content .c_content .bannertable table td .t_action .a_change").click(function(){
		_this = $(this);
		$(".edit_box").show();
		// 将url加载到div框内
		$(".fm_content .t_right .r_content .c_content .bannertable .edit_box .b_content .content form .bimg").text($(this).siblings(".a_see").attr("burl"));
		url = $(this).siblings(".a_see").attr("burl");
		$(".fm_content .t_right .r_content .c_content .bannertable .edit_box .b_content .content form .btitle").attr("value",$(this).attr("btitle"));
		$(".fm_content .t_right .r_content .c_content .bannertable .edit_box .b_content .content form .bcontent").text($(this).attr("bcontent"));
	});
	
	// 点击编辑banner图层中的关闭按钮
	$(".fm_content .t_right .r_content .c_content .bannertable .edit_box .b_content .title a").click(function(){
		$(".fm_content .t_right .r_content .c_content .bannertable .edit_box").hide();
	});
	
	// 点击编辑banner图层中的upload按钮
	var t= $.tzUpload({
		url:basePath+"/ajaxupload/ajaxUploadAction/addBanner",
		postName:"bimg",
		type:"*.jpg;*.png;*.jpeg",
		targetId:"editimg",
		size:"10 MB",
		single:false,
		callback:function(data){
			console.log(data);
			var data = eval("("+data+")");
			url = data.url;
		}
	});
	
	// 点击确认修改按钮修改banner图片
	$(".fm_content .t_right .r_content .c_content .bannertable .edit_box .b_content .content form .submit").click(function(){
		var bid = _this.siblings(".a_delete").attr("bid");
		var btitle = $("#beidttitle").val();
		var bcontent = $("#beidtcontent").val();
		$.tzAjax.request({url:basePath+"/admin/banner/updateBanner",callback:function(data){
			if(data.result=="success"){
				window.location.reload(location);
			}
		}},{"btitle":btitle,"bcontent":bcontent,"url":url,"bid":bid});
	});
	
	// --------------------------jqweigt控件jqxTabs
	$(".c_content").jqxTabs({
		theme: theme,
		//showCloseButtons: true,
		//enabledHover: true,
		width: '100%',
		height: '100%',
		position: 'top'
		//autoHeight: true
	});
	
</script>
</body>
</html>