<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@include file="/commons/taglib.jsp" %>
<!doctype html>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
		<title>shm小型酒店后台管理中心</title>
		<%@include file="/commons/public.jsp" %>

		<style type="text/css">
			body{font-size:12px;font-family:"微软雅黑";color:#666;}
			.tz_content{width:100%;background:#282828;}

			/*t_left start*/
			.tz_content .t_left{width:200px;height:800px;background:#282828;position:fixed;left:0;top:0;z-index:2;}
			.tz_content .t_left .l_logo{width:100%;height:108px;border-bottom:1px solid #000000;cursor:pointer;background:url("${basePath}/images/admin/index/logo.png") no-repeat center;}
			.tz_content .t_left .l_nav{width:100%;border-bottom:1px solid #414141;}
			.tz_content .t_left .l_nav ul li{border-bottom:1px solid #000000;line-height:52px;border-top:1px solid #414141;}
			.tz_content .t_left .l_nav ul li a{display:block;padding-left:30px;}
			.tz_content .t_left .l_nav ul li a:hover{background:#25c016;}
			.tz_content .t_left .l_nav ul li a i{width:16px;height:16px;display:block;background:url("${basePath}/images/admin/index/ht_icon.png") no-repeat;float:left;margin-top:20px;}
			.tz_content .t_left .l_nav ul li a .icon_1{background-position:-1px -25px;}
			.tz_content .t_left .l_nav ul li a .icon_2{background-position:-32px -52px;}
			.tz_content .t_left .l_nav ul li a .icon_3{background-position:-295px -52px;}
			.tz_content .t_left .l_nav ul li a .icon_4{background-position:-254px -52px;}
			.tz_content .t_left .l_nav ul li a .icon_5{background-position:-274px -52px;}
			.tz_content .t_left .l_nav ul li a .icon_6{background-position:-150px -25px;width:19px;height:17px;margin-top:20px;}
			.tz_content .t_left .l_nav ul li a span{font-size:14px;color:#fff;padding-left:10px;}

			/*t_header start*/
			.tz_content .t_header{width:100%;height:56px;background:#2f3437;position:relative;z-index:1;}

			/*h_nav start*/
			.tz_content .t_header .h_nav{height:56px;margin-left:200px;float:left;}
			.tz_content .t_header .h_nav ul li{float:left;width:110px;height:56px;border-left:1px solid #414141;border-right:1px solid #000;}
			.tz_content .t_header .h_nav ul li a{display:block;color:#838383;text-align:center;padding-top:8px;}
			.tz_content .t_header .h_nav ul li a:hover{color:#fff;}
			.tz_content .t_header .h_nav ul li a i{display:block;width:18px;height:17px;background:url("${basePath}/images/admin/index/ht_icon.png") no-repeat;margin:3px auto;}
			.tz_content .t_header .h_nav ul li .h_sel{color:#fff;}
			.tz_content .t_header .h_nav ul li a .h_icon1{background-position:0 -25px;}
			.tz_content .t_header .h_nav ul li a .h_icon2{background-position:-24px 0;}
			.tz_content .t_header .h_nav ul li a:hover .h_icon2{background-position:-24px -25px;}
			.tz_content .t_header .h_nav ul li a .h_icon3{background-position:-48px 0;}
			.tz_content .t_header .h_nav ul li a:hover .h_icon3{background-position:-48px -25px;}
			.tz_content .t_header .h_nav ul li a .h_icon4{background-position:-68px 0;}
			.tz_content .t_header .h_nav ul li a:hover .h_icon4{background-position:-68px -25px;}
			.tz_content .t_header .h_nav ul li a .h_icon5{background-position:-91px 0;}
			.tz_content .t_header .h_nav ul li a:hover .h_icon5{background-position:-91px -25px;}
			.tz_content .t_header .h_nav ul li a .h_icon6{background-position:-113px 0;}
			.tz_content .t_header .h_nav ul li a:hover .h_icon6{background-position:-113px -25px;}
			.tz_content .t_header .h_nav ul li a .h_icon7{background-position:-133px 0;}
			.tz_content .t_header .h_nav ul li a:hover .h_icon7{background-position:-133px -25px;}

			/*h_info start*/
			.tz_content .t_header .h_info{height:56px;position:absolute;top:0;right:10px;}
			.tz_content .t_header .h_info .h_user{line-height:56px;color:#fff;float:left;}
			.tz_content .t_header .h_info .h_out{width:65px;height:30px;background:#25c016;margin:13px 5px 0 10px;float:right;}
			.tz_content .t_header .h_info .h_out a{display:block;line-height:30px;color:#fff;padding-left:10px;}
			.tz_content .t_header .h_info .h_out a span{float:left;}
			.tz_content .t_header .h_info .h_out a i{width:14px;height:14px;display:block;background:url("${basePath}/images/admin/index/ht_icon.png") no-repeat 0 -51px;float:left;margin:6px 8px;}

			/*t_right start*/
			.tz_content .t_right{height:700px;background:#f3f4f5;margin-left:200px;}

			/*r_location start*/
			.tz_content .t_right .r_location{height:51px;background:#e5e5e5;border-bottom:1px solid #ccc;line-height:51px;position:relative;}
			.tz_content .t_right .r_location i{width:14px;height:18px;display:block;background:url("${basePath}/images/admin/index/ht_icon.png") no-repeat;background-position:-16px -51px;float:left;margin:16px 20px 0 20px;}

			/*r_message start*/
			.tz_content .t_right .r_message .m_list{height:99px;float:left;margin-left:1%;margin-top:20px;}
			.tz_content .t_right .r_message .m_1{width:22%;background:#27a9e3;}
			.tz_content .t_right .r_message .m_2{width:16%;background:#25c016;}
			.tz_content .t_right .r_message .m_3{width:17%;background:#ffb848;}
			.tz_content .t_right .r_message .m_4{width:21%;background:#cc6a6a;}
			.tz_content .t_right .r_message .m_5{width:18%;background:#2255a4;}
			.tz_content .t_right .r_message .m_6{width:17%;background:#da542e;}
			.tz_content .t_right .r_message .m_7{width:20%;background:#2255a4;}
			.tz_content .t_right .r_message .m_8{width:18%;background:#6297bc;}
			.tz_content .t_right .r_message .m_9{width:20%;background:#27a9e3;}
			.tz_content .t_right .r_message .m_10{width:19%;background:#25c016;}
			.tz_content .t_right .r_message .m_list .m_pic{width:44px;height:46px;background:url("${basePath}/images/admin/index/ht_icon.png") no-repeat;float:left;margin:25px 10px 0 20px;}
			.tz_content .t_right .r_message .m_list:hover{background:#2f3437;}
			.tz_content .t_right .r_message .m_list .m_desc{color:#fff;margin-top:25px;}
			.tz_content .t_right .r_message .m_list .m_desc span{font-size:24px;}
			.tz_content .t_right .r_message .m_1 .m_pic{background-position:0 -76px;}
			.tz_content .t_right .r_message .m_2 .m_pic{background-position:-46px -77px;}
			.tz_content .t_right .r_message .m_3 .m_pic{background-position:-96px -77px;}
			.tz_content .t_right .r_message .m_4 .m_pic{background-position:-146px -77px;}
			.tz_content .t_right .r_message .m_5 .m_pic{height:54px;background-position:-190px -77px;}
			.tz_content .t_right .r_message .m_6 .m_pic{background-position:-239px -77px;}
			.tz_content .t_right .r_message .m_7 .m_pic{width:49px;background-position:-288px -77px;}
			.tz_content .t_right .r_message .m_8 .m_pic{width:49px;background-position:-450px -77px;}
			.tz_content .t_right .r_message .m_9 .m_pic{width:49px;height:47px;background-position:-395px -154px;}
			.tz_content .t_right .r_message .m_10 .m_pic{width:49px;height:47px;background-position:-449px -154px;}

			/*清除浮动*/
			.clear{clear:both;}

			/*r_table start*/
			.tz_content .t_right .r_table{border:1px solid #ccc;margin:0 1% 0 1%;background:#fff;margin-top:20px;padding-bottom:10px;}
			.tz_content .t_right .r_table .r_title{width:100%;height:40px;background:#eee;border-bottom:1px solid #ccc;}
			.tz_content .t_right .r_table .r_title i{width:16px;height:14px;display:block;background:url("${basePath}/images/admin/index/ht_icon.png") no-repeat -386px -15px;float:left;margin:12px;}
			.tz_content .t_right .r_table .r_title p{height:40px;line-height:40px;border-left:1px solid #ccc;float:left;padding-left:5px;color:#000;}
			.tz_content .t_right .r_table .r_label{width:80%;height:100px;float:left;}
			.tz_content .t_right .r_table .r_label ul li{list-style:none;float:left;background:#999;margin:10px 10px 0 10px;}
			.tz_content .t_right .r_table .r_label ul li a{display:block;padding:8px 20px;color:#fff;}
			.tz_content .t_right .r_table .r_label ul li a:hover{background:#25c016;}
			.tz_content .t_right .r_table .r_label ul li a i{width:15px;height:14px;display:block;background:url("${basePath}/images/admin/index/ht_icon.png") no-repeat;float:left;margin-right:10px;}
			.tz_content .t_right .r_table .r_label ul li a .l_icon1{background-position:-33px -52px;}
			.tz_content .t_right .r_table .r_label ul li a .l_icon2{background-position:-50px -52px;}
			.tz_content .t_right .r_table .r_label ul li a .l_icon3{background-position:-67px -52px;}
			.tz_content .t_right .r_table .r_label ul li a .l_icon4{background-position:-87px -52px;}
			.tz_content .t_right .r_table .r_label ul li a .l_icon5{background-position:-105px -52px;}
			.tz_content .t_right .r_table .r_label ul li a .l_icon6{background-position:-123px -52px}
			.tz_content .t_right .r_table .r_label ul li a .l_icon7{background-position:-140px -52px;}
			.tz_content .t_right .r_table .r_label ul li a .l_icon8{background-position:-155px -52px;}
			.tz_content .t_right .r_table .r_label ul li a .l_icon9{background-position:-172px -52px;}
			.tz_content .t_right .r_table .r_label ul li a .l_icon10{background-position:-191px -52px;}
			.tz_content .t_right .r_table .r_label ul li a .l_icon11{background-position:-212px -52px;}
			.tz_content .t_right .r_table .r_search{width:19%;height:30px;float:left;padding-top:10px;}
			.tz_content .t_right .r_table .r_search .r_text{width:60%;height:28px;line-height:28px;border:1px solid #ddd;float:right;}
			.tz_content .t_right .r_table .r_search .r_btn{width:20%;height:29px;background:#999;color:#fff;cursor:pointer;border:0;float:right;}

			/*r_table_list start*/
			.tz_content .t_right .r_table .r_table_list{width:100%;margin-top:20px;}
			.tz_content .t_right .r_table .r_table_list .t_tab{border-collapse:collapse;width:98%;text-align:center;margin:0 1%;}
			.tz_content .t_right .r_table .r_table_list tr th{line-height:40px;background:#eee;text-align:center;}
			.tz_content .t_right .r_table .r_table_list tr td{border:1px solid #ddd;line-height:40px;}
			.tz_content .t_right .r_table .r_table_list .t_tab thead{border:1px solid #ddd;}
			.tz_content .t_right .r_table .r_table_list .t_tab tbody tr:hover{background:#EAEAEA;}

			/*头部导航和消息提示小于1360的时候 用下边的样式*/
			@media screen and (max-width:1360px){/*h_nav start*/
			.tz_content .t_header .h_nav{margin-left:200px;}
			.tz_content .t_header .h_nav ul li{width:80px;}

			.tz_content .t_right .r_message .m_list .m_pic{display:none;}
			.tz_content .t_right .r_message .m_list .m_desc{text-align:center;}
			}
			/*头部导航和左侧导航小于1024的时候 用下边的样式*/
			@media screen and (max-width:1024px){/*t_left start*/
			.tz_content .t_left{width:50px;}
			.tz_content .t_left .l_logo{height:54px;background:url("${basePath}/images/admin/index/logo1.png") no-repeat center;}
			.tz_content .t_left .l_nav ul li a{padding-left:16px;height:52px;}
			.tz_content .t_left .l_nav ul li a span{display:none;}

			/*h_nav start*/
			.tz_content .t_header .h_nav{margin-left:50px;}
			.tz_content .t_header .h_nav ul li{width:60px;}
			.tz_content .t_header .h_nav ul li a span{display:none;}
			.tz_content .t_header .h_nav ul li a i{margin:14px auto;}

			.tz_content .t_header .h_info .h_user{display:none;}
			.tz_content .t_right{margin-left:0;}
			.tz_content .t_right .r_location{margin-left:50px;}
			.tz_content .t_right .r_message{margin-left:50px;}
			.tz_content .t_right .r_table{margin-left:60px;}
			}



		</style>

	</head>
<body>


	<div class="tz_content">

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
						<a href="#" class="h_sel">
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
						<a href="${basePath }/toadmin/adminPage/toCheckoutCenter">
							<i class="h_icon4"></i>
							<span>结算中心</span>
						</a>
					</li>
					<li>
						<a href="${basePath }/toadmin/adminPage/toCustomerManage">
							<i class="h_icon5"></i>
							<span>顾客管理</span>
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
				<div class="h_user">当前用户：${admin.account } , 身份：系统管理员</div>
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
				<p>您当前所在位置：首页</p>
			</div>
			<!--end r_location-->
			
			<!--r_message start-->
			<div class="r_message">
				<div class="m_list m_1">
					<div class="m_pic"></div>
					<div class="m_desc">
						<span>20</span>
						<p>所有用户数</p>
					</div>
				</div>
				<div class="m_list m_2">
					<div class="m_pic"></div>
					<div class="m_desc">
						<span>0</span>
						<p>新增用户数</p>
					</div>				
				</div>
				<div class="m_list m_3">
					<div class="m_pic"></div>
					<div class="m_desc">
						<span>10</span>
						<p>所有栏目数</p>
					</div>				
				</div>
				<div class="m_list m_4">
					<div class="m_pic"></div>
					<div class="m_desc">
						<span>10</span>
						<p>所有资讯数</p>
					</div>				
				</div>
				<div class="m_list m_5">
					<div class="m_pic"></div>
					<div class="m_desc">
						<span>4</span>
						<p>新增资讯数</p>
					</div>				
				</div>
				<div class="m_list m_6">
					<div class="m_pic"></div>
					<div class="m_desc">
						<span>0</span>
						<p>所有应用数</p>
					</div>				
				</div>
				<div class="m_list m_7">
					<div class="m_pic"></div>
					<div class="m_desc">
						<span>4</span>
						<p>新增评论数</p>
					</div>				
				</div>
				<div class="m_list m_8">
					<div class="m_pic"></div>
					<div class="m_desc">
						<span>5</span>
						<p>新上传的图片</p>
					</div>				
				</div>
				<div class="m_list m_9">
					<div class="m_pic"></div>
					<div class="m_desc">
						<span>6</span>
						<p>所有音乐数</p>
					</div>				
				</div>
				<div class="m_list m_10">
					<div class="m_pic"></div>
					<div class="m_desc">
						<span>2</span>
						<p>新增数</p>
					</div>				
				</div>
				<div class="clear"></div>
			</div>
			<!--end r_message-->

			<!--r_table start-->
			<div class="r_table">
				<div class="r_title">
					<i></i>
					<p>后台控制台信息</p>
				</div>

				<!--r_label start-->
				<div class="r_label" style="display:none;">
					<ul>
						<li>
							<a href="#">
								<i class="l_icon1"></i>
								<span>添加</span>
							</a>
						</li>
						<li>
							<a href="#">
								<i class="l_icon2"></i>
								<span>编辑</span>
							</a>
						</li>
						<li>
							<a href="#">
								<i class="l_icon3"></i>
								<span>添加章节</span>
							</a>
						</li>
						<li>
							<a href="#">
								<i class="l_icon4"></i>
								<span>上传资料</span>
							</a>
						</li>
						<li>
							<a href="#">
								<i class="l_icon5"></i>
								<span>置顶</span>
							</a>
						</li>
						<li>
							<a href="#">
								<i class="l_icon6"></i>
								<span>取消置顶</span>
							</a>
						</li>
						<li>
							<a href="#">
								<i class="l_icon7"></i>
								<span>生成静态页面</span>
							</a>
						</li>
						<li>
							<a href="#">
								<i class="l_icon8"></i>
								<span>删除</span>
							</a>
						</li>
						<li>
							<a href="#">
								<i class="l_icon9"></i>
								<span>审核信息</span>
							</a>
						</li>
						<li>
							<a href="#">
								<i class="l_icon10"></i>
								<span>刷新数据</span>
							</a>
						</li>
						<li>
							<a href="#">
								<i class="l_icon11"></i>
								<span>标记</span>
							</a>
						</li>

					</ul>
				</div>
				<!--end r_label-->

				<!--r_search start-->
				<div class="r_search" style="display:none;">
					<input type="button" value="GO" class="r_btn"/>
					<input type="text" class="r_text"/>
				</div>
				<div class="clear"></div>
				<!--end r_search-->
				
				<!--r_table_list start-->
				<div class="r_table_list">
					<table class="t_tab">
						<thead>
							<tr>
								<th>ID</th>
								<th>名称</th>
								<th>值</th>
							</tr>
						</thead>
						<tbody>
							<tr>
								<td>01</td>
								<td>运行环境</td>
								<td>${runtimeMap.vmName }</td>
							</tr>
							<tr>
								<td>02</td>
								<td>运行环境版本</td>
								<td>${runtimeMap.runtimeV }</td>
							</tr>
							<tr>
								<td>03</td>
								<td>虚拟机提供者</td>
								<td>${runtimeMap.vmVendor }</td>
							</tr>
							<tr>
								<td>04</td>
								<td>操作系统</td>
								<td>${runtimeMap.os }</td>
							</tr>
							<tr>
								<td>05</td>
								<td>操作系统时区</td>
								<td>${runtimeMap.timeZone }</td>
							</tr>
							<tr>
								<td>06</td>
								<td>操作系统语言</td>
								<td>${runtimeMap['language'] }</td>
							</tr>
						</tbody>
					</table>
				</div>
				<!--end r_table_list-->
				
			</div>
			<!--end r_table-->

		</div>
		<!--end t_right-->

	</div>

<script type="text/javascript">
	$(function(){
		var account="${admin.account}"
		showInfo("管理员："+account+"，欢迎来到shm小型酒店后台管理中心。","success");
	});
	
	// 点击logo回到前台首页
	function toIndex(){
		window.location.href = basePath+"/index.jsp";
	}
</script>
</body>
</html>