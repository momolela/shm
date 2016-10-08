<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@include file="/commons/taglib.jsp" %>
<!doctype html>
<html >
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
		<title>评论中心</title>
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
			.fm_content .t_header .h_nav ul li a .h_icon4{background-position:-68px 0px;}
			.fm_content .t_header .h_nav ul li a:hover .h_icon4{background-position:-68px -25px;}
			.fm_content .t_header .h_nav ul li a .h_icon5{background-position:-91px 0;}
			.fm_content .t_header .h_nav ul li a:hover .h_icon5{background-position:-91px -25px;}
			.fm_content .t_header .h_nav ul li a .h_icon6{background-position:-113px -25px;}
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
			.fm_content .t_right{background:#f3f4f5;margin-left:200px;}

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
						<a href="#" class="h_sel">
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
				<p>您当前所在位置：首页 &gt; 评论中心</p>
			</div>
			<!--end r_location-->
			
			<div class="r_content">
				<ul class="nav">
					<li style="float: left;width: 80px;height: 30px;text-align: center;">
						<a href="#" style="color: #999999;font-weight: bold;display: block;width: 80px;height: 40px;line-height: 40px;">审核通过</a>
					</li>
					<li style="float: left;width: 80px;height: 30px;text-align: center;">
						<a href="#" style="color: #999999;font-weight: bold;display: block;width: 80px;height: 40px;line-height: 40px;">等待审核</a>
					</li>
				</ul>
				
				<div style="width:100%;height:100%;margin:20px 0 0 20px;">
					<div class="selectRoom" style="width:100%;height:40px;">
						<span style="display:inline-block;width:50px;height:30px;float:left;line-height:30px;">客房号：</span>
						<div style="position:relative;width:100%;height:100%;">
							<input class="customerName" id="customerName" type="text" placeholder="请输入客房号搜索" style="float:left;width:150px;height:30px;padding-left:5px;"/>
							<div class="name_xiala" style="display:none;width:155px;height:auto;background:#fff;position:absolute;top:31px;left:50px;border:1px solid #eee;z-index: 999;">
								<ul style="width:155px;height:100%;">
								</ul>
							</div>
							<div class="clear"></div>
						</div>
					</div>
					<div class="commentsList1" style="width:94%;height:auto;border:1px solid #eee;padding:10px;padding-top:0;margin-top:20px;min-height:300px;">
						<ul></ul>
					</div>
				</div>
				
				<div style="width:100%;height:100%;margin:20px 0 0 20px;">
					<div class="commentsList0" style="width:94%;height:auto;border:1px solid #eee;padding:10px;padding-top:0;margin-top:20px;min-height:300px;">
						<ul></ul>
					</div>
				</div>
			</div>
			
		</div>
		<!--end t_right-->

	</div>
	
<script type="text/javascript">
	var localdata;
	$(function(){
		ajaxLoad();
	});
	
	// 加载页面的所需数据
	function ajaxLoad(){
		$.ajax({
			url: basePath+"/admin/commentsManage/findAllComments",
			type: 'post',
			success: function(data){
				localdata = data.datamap;
				for(var i = 0;i<localdata.commentsList1.length;i++){
					var html = "<li class='animated fadeInRight' style='animation-delay:0."+i+"s;width:100%;height:60px;border:1px solid #eee;margin-top:10px;background:#bbf3b8;'>"+
		"							<div style='float:left;width:500px;height:30px;line-height:30px;margin:15px 0 0 30px;'>"+localdata.commentsList1[i].comments+"</div>"+
		"							<div style='float:left;width:140px;height:30px;line-height:30px;margin:15px 0 0 0px;'>房间号："+localdata.commentsList1[i].roomId.roomName+"</div>"+
		"							<div style='float:left;width:140px;height:30px;line-height:30px;margin:15px 0 0 0px;'>顾客：<img src='${basePath }/"+localdata.commentsList1[i].userId.picUrl+"' style='width:20px;height:20px;border-radius:50%;margin-right:5px;'/>"+localdata.commentsList1[i].userId.realName+"</div>"+
		"							<div style='float:left;width:160px;height:30px;line-height:30px;margin:15px 0 0 0px;'>时间："+localdata.commentsList1[i].createTime+"</div>"+
		"							<div style='margin-right:20px;float:right;width:30px;height:30px;margin-top:15px;'><i commentsid='"+localdata.commentsList1[i].id+"' class='del1' style='display:inline-block;width:20px;height:20px;margin:8px 0 0 10px;cursor:pointer;background:url(${basePath}/images/admin/index/ht_icon.png) -420px -50px;'></i></div>"+
		"						</li>";
					$(".commentsList1 ul").append(html);
				}
				for(var i = 0;i<localdata.commentsList0.length;i++){
					var html = "<li class='animated fadeInRight' style='animation-delay:0."+i+"s;width:100%;height:60px;border:1px solid #eee;margin-top:10px;background:rgba(255,0,0,.2);'>"+
		"							<div style='float:left;width:500px;height:30px;line-height:30px;margin:15px 0 0 30px;'>"+localdata.commentsList0[i].comments+"</div>"+
		"							<div style='float:left;width:140px;height:30px;line-height:30px;margin:15px 0 0 0px;'>房间号："+localdata.commentsList0[i].roomId.roomName+"</div>"+
		"							<div style='float:left;width:140px;height:30px;line-height:30px;margin:15px 0 0 0px;'>顾客：<img src='${basePath }/"+localdata.commentsList0[i].userId.picUrl+"' style='width:20px;height:20px;border-radius:50%;margin-right:5px;'/>"+localdata.commentsList0[i].userId.realName+"</div>"+
		"							<div style='float:left;width:160px;height:30px;line-height:30px;margin:15px 0 0 0px;'>时间："+localdata.commentsList0[i].createTime+"</div>"+
		"							<div style='margin-right:20px;float:right;width:60px;height:30px;margin-top:15px;'><i commentsid='"+localdata.commentsList0[i].id+"' class='yes0' style='display:inline-block;width:20px;height:20px;margin:8px 0 0 10px;cursor:pointer;background:url(${basePath}/images/admin/index/ht_icon.png) -170px -49px;'></i><i commentsid='"+localdata.commentsList0[i].id+"' class='del0' style='display:inline-block;width:20px;height:20px;margin:8px 0 0 10px;cursor:pointer;background:url(${basePath}/images/admin/index/ht_icon.png) -420px -50px;'></i></div>"+
		"						</li>";
					$(".commentsList0 ul").append(html);
				}
				$(".del0").on("click",function(){
					var commentsid = $(this).attr("commentsid");
					$.ajax({
						url: basePath+"/admin/commentsManage/delCommentsById",
						data: {"commentsId":commentsid},
						type: 'post',
						success:function(data){
							if(data.result=="success"){
								$(".commentsList0 ul").empty();
								$(".commentsList1 ul").empty();
								ajaxLoad();
								showInfo("删除成功~","success");
							}
						}
					});
				});
				$(".yes0").on("click",function(){
					var commentsid = $(this).attr("commentsid");
					$.ajax({
						url: basePath+"/admin/commentsManage/changeCommentsStatusById",
						data: {"commentsId":commentsid},
						type: 'post',
						success:function(data){
							if(data.result=="success"){
								$(".commentsList0 ul").empty();
								$(".commentsList1 ul").empty();
								ajaxLoad();
								showInfo("已经审核通过~","success");
							}
						}
					});
				});
				$(".del1").on("click",function(){
					var commentsid = $(this).attr("commentsid");
					$.ajax({
						url: basePath+"/admin/commentsManage/delCommentsById",
						data: {"commentsId":commentsid},
						type: 'post',
						success:function(data){
							if(data.result=="success"){
								$(".commentsList0 ul").empty();
								$(".commentsList1 ul").empty();
								ajaxLoad();
								showInfo("删除成功~","success");
							}
						}
					});
				});
			}
		});
	}

	// 点击logo回到前台首页
	function toIndex(){
		window.location.href = basePath+"/page/toIndex";
	}
	
	// --------------------------jqweigt控件jqxTabs
	$(".r_content").jqxTabs({
		theme: theme,
		width: '100%',
		position: 'top',
		autoHeight: true
	});
	
	$("#customerName").keyup(function(){
		$(".name_xiala ul").empty();
		var html = new Array();
		var text = $(this).val();
		$(".name_xiala").show();
		for(var i = 0;i<localdata.commentsList1.length;i++){
			if(localdata.commentsList1[i].roomId!=null){
				if(localdata.commentsList1[i].roomId.roomName[0]==text||localdata.commentsList1[i].roomId.roomName[0]==text){
					html.push("<li class='name_li' id='"+localdata.commentsList1[i].id+"' style='line-height:30px;width:155px;height:30px;background:#fff;text-indent:10px;cursor:pointer;'>"+localdata.commentsList1[i].roomId.roomName+"</li>");
				}
			}
		}
		$(".name_xiala ul").append(html);
		if(text==""){
			$(".name_xiala").hide();
			$(".commentsList1 ul").empty();
			ajaxLoad();
		}
		$(".name_li").on("click",function(){
			var text = $(this).text();
			$("#customerName").val($(this).text());
			$(".name_xiala").hide();
			$(".commentsList1 ul").empty();
			//--------展示数据
			var id = $(this).attr("id");
			for(var i = 0;i<localdata.commentsList1.length;i++){
				if(localdata.commentsList1[i].roomId.roomName==text){
					var html = "<li class='animated fadeInRight' style='animation-delay:0."+i+"s;width:100%;height:60px;border:1px solid #eee;margin-top:10px;background:#bbf3b8;'>"+
	"								<div style='float:left;width:500px;height:30px;line-height:30px;margin:15px 0 0 30px;'>"+localdata.commentsList1[i].comments+"</div>"+
	"								<div style='float:left;width:140px;height:30px;line-height:30px;margin:15px 0 0 0px;'>房间号："+localdata.commentsList1[i].roomId.roomName+"</div>"+
	"								<div style='float:left;width:140px;height:30px;line-height:30px;margin:15px 0 0 0px;'>顾客：<img src='${basePath }/"+localdata.commentsList1[i].userId.picUrl+"' style='width:20px;height:20px;border-radius:50%;margin-right:5px;'/>"+localdata.commentsList1[i].userId.realName+"</div>"+
	"								<div style='float:left;width:160px;height:30px;line-height:30px;margin:15px 0 0 0px;'>时间："+localdata.commentsList1[i].createTime+"</div>"+
	"								<div style='margin-right:20px;float:right;width:30px;height:30px;margin-top:15px;'><i style='display:inline-block;width:20px;height:20px;background:url(${basePath }/images/admin/index/ht_icon.png) -420px -50px;margin:8px 0 0 10px;cursor:pointer;'></i></div>"+
	"							</li>";
					$(".commentsList1 ul").append(html);
				}
			}
		});
	});
</script>
</body>
</html>