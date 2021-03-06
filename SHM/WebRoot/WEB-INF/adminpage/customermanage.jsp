<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@include file="/commons/taglib.jsp" %>
<!doctype html>
<html >
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
		<title>用户管理</title>
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
			.fm_content .t_header .h_nav ul li a .h_icon5{background-position:-91px -25px;}
			.fm_content .t_header .h_nav ul li a .h_icon6{background-position:-113px 0;}
			.fm_content .t_header .h_nav ul li a:hover .h_icon6{background-position:-113px -25px;}
			.fm_content .t_header .h_nav ul li a .h_icon7{background-position:-133px 0;}
			.fm_content .t_header .h_nav ul li a:hover .h_icon7{background-position:-133px -25px;}
			.fm_content .t_header .h_nav ul li a .h_icon8{background-position:-152px 0;}
			.fm_content .t_header .h_nav ul li a:hover .h_icon8{background-position:-152px -25px;}

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
			
			.all_tab:hover{background:#eee;}
			.class_tab:hover{background:#eee;}

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
						<a href="#" class="h_sel">
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
				<p>您当前所在位置：首页 &gt; 用户管理</p>
			</div>
			<!--end r_location-->
			
			<!--  -->
			<div class="leftToolber" style="height:490px;width:94%;margin-left:30px;margin-top:20px;">
				<div id="indGrid" style="border:1px solid #eee;"></div>
				<div id="gridToolber" style='overflow: hidden; position: relative; height: 100%; width: 90%;'>
					<div style='float: left; padding: 2px; margin: 2px;'>
						<input type="button" id='addCustomer' value="前台新增顾客"/>
					</div>
					<div style='float: left; padding: 2px; margin: 2px;'>
						<input type="button" id='onlyCustomer' value="只看顾客"/>
					</div>
					<div style='float: left; padding: 2px; margin: 2px;'>
						<input type="button" id='onlyUser' value="只看会员"/>
					</div>
					<div style='float: left; padding: 2px; margin: 2px;'>
						<input type="button" id='allUser' value="全部用户"/>
					</div>
					<div style='float: left; padding: 2px; margin: 2px;'>
						<input type="button" id='updateUser' value="修改用户"/>
					</div>
				</div>
			</div>
			<!--  -->
			
			<!-- addCustomerBox start -->
			<div class="addCustomerBox">
				<div id="addCustomerBoxHeader">
					<span id="configContainer" style="float: left">前台新增顾客</span>
				</div>
				<div id="addCustomerBoxContent" style="overflow: hidden;position:relative;">
					<div class="input" style="width:330px;height:70%;margin:20px auto 0 auto;">
						<div style="width:100%;height:40px;"><span style="display:inline-block;width:80px;height:40px;font-size:15px;line-height:40px;">真实姓名：</span><input type="text" style="width:237px;height:30px;padding-left:10px;" class="realname" id="realname"/></div>
						<div style="width:100%;height:40px;"><span style="display:inline-block;width:80px;height:40px;font-size:15px;line-height:40px;float:left;">顾客性别：</span><div class="sex" id="sex"></div></div>
						<div style="width:100%;height:40px;"><span style="display:inline-block;width:80px;height:40px;font-size:15px;line-height:40px;float:left;">身份证号：</span><input type="text" style="width:237px;height:30px;padding-left:10px;" class="idcard" id="idcard"/></div>
						<div style="width:100%;height:40px;"><span style="display:inline-block;width:80px;height:40px;font-size:15px;line-height:40px;float:left;">手机号：</span><input type="text" style="width:237px;height:30px;padding-left:10px;" class="phonenum" id="phonenum"/></div>
					</div>
					<div style="position:absolute;bottom:20px;left:85px;">
						<input type="button" value="确定" id="ooButton_addc" />
						<input type="button" value="取消" id="ccButton_addc" style="margin-left:50px;"/>
					</div>
				</div>
			</div>
			<!-- addCustomerBox end -->
			
			<!--  -->
			<div style="display:none;"></div>
			<!--  -->
			
		</div>
		<!--end t_right-->

	</div>
	
<script type="text/javascript">
	var userMapList;
	$(function(){
		$.ajax({
			url:basePath+"/admin/userManage/findAllUser",
			type: 'post',
			success: function(data){
				console.log(data);
				if(data.result=="success"){
					refreshTreeData(data.datamap.userMapList);
					userMapList = data.datamap.userMapList;
				}
			}
		});
		
		//双击一行
		$("#indGrid").on('rowDoubleClick', function (event) {
			var args = event.args;
			var row = args.row;
			window.location = basePath+"/toadmin/adminPage/toCheckoutCenter?id="+row.id;
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
				$('#addCustomer').jqxButton({
					width: '130',
					imgSrc : basePath+"/images/admin/image/add.png"
				});
				$('#onlyCustomer').jqxButton({
					width: '130',
					imgSrc : basePath+"/images/admin/image/attribute_p.png"
				});
				$('#onlyUser').jqxButton({
					width: '130',
					imgSrc : basePath+"/images/admin/image/attribute_r.png"
				});
				$('#allUser').jqxButton({
					width: '130',
					imgSrc : basePath+"/images/admin/image/attribute_d.png"
				});
				$('#updateUser').jqxButton({
					width: '130',
					imgSrc : basePath+"/images/admin/image/icon-edit.png"
				});
			},
			columns : [ {
				text : '用户名',
				datafield : 'username',
				width : 120
			}, {
				text : '性别',
				datafield : 'sex',
				cellsalign : 'center',
				width : 120,
				align : 'center',
				cellsRenderer : sexFormat
			}, {
				text : '真实姓名',
				datafield : 'realname',
				cellsalign : 'center',
				width : 120,
				align : 'center'
			}, {
				text : '身份证号',
				datafield : 'idcard',
				width : 180,
				align : 'center',
				cellsalign : 'center'
			}, {
				text : '手机号',
				datafield : 'phonenum',
				width : 100,
				align : 'center',
				cellsalign : 'center'
			}, {
				text : '身份',
				datafield : 'status',
				width : 100,
				align : 'center',
				cellsalign : 'center',
				cellsRenderer : statusFormat
			},{
				text : '邮箱',
				datafield : 'email',
				width : 160,
				align : 'center',
				cellsalign : 'center',
				cellsformat : 'c2',
			},{
				text : '注册时间',
				datafield : 'createtime',
				align : 'center',
				cellsalign : 'center',
				cellsformat : 'c2',
			}]
		});
		
		var dataMap = [{sexName:"男",sexValue:"m"},{sexName:"女",sexValue:"f"}];
		var source ={
			datatype: "json",
			datafields: [{name:"sexName"},{name:"sexValue"}],
			localdata: dataMap
		};
		var dataAdapter = new $.jqx.dataAdapter(source);
		// 性别下拉框
		$("#sex").jqxDropDownList({
			theme : theme,
			source: dataAdapter,
			placeHolder : '请选择性别~',
			width: '120',
			height: '30',
			dropDownHeight: '50',
			displayMember: "sexName",
		    valueMember: "sexValue"
		});
		
		// jqweight控件----弹出框（添加顾客）
		$(".addCustomerBox").jqxWindow({
			isModal :true,
			modalOpacity: 0.3,
			theme : theme,
			width : 380,
			height : 280,
			resizable : false,
			autoOpen : false,
			cancelButton : $('#ccButton_addc'),
			okButton : $('#ooButton_addc'),
			initContent : function() {
				$('#ooButton_addc').jqxButton({
					theme : theme,
					template : "primary",
					cursor : "pointer",
					width : '80',
					height : '30'
				});
				$('#ccButton_addc').jqxButton({
					theme : theme,
					template : "info",
					cursor : "pointer",
					width : '80',
					height : '30'
				});
			}
		});
		$("#ooButton_addc").click(function(){
			var realname = $("#realname").val();
			var sex = $("#sex").val();
			var idcard = $("#idcard").val();
			var phonenum = $("#phonenum").val();
			if(realname!=""&&sex!=""&&idcard!=""&&phonenum!=""){
				$.ajax({
					url: basePath+"/admin/userManage/addCustomer",
					data: {"realname":realname,"sex":sex,"idcard":idcard,"phonenum":phonenum},
					type: 'post',
					success:function(data){
						if(data.result=="success"){
							window.location.reload(location);
						}
					}
				});
			}
		});
		
		// 点击前台添加顾客
		$("#addCustomer").click(function(){
			$(".addCustomerBox").jqxWindow('open');
		});
		
		// 点击只看顾客
		$("#onlyCustomer").click(function(){
			var userMapListCustomer = new Array();
			for(var i = 0;i<userMapList.length;i++){
				if(userMapList[i].status == "1"){
					userMapListCustomer.push(userMapList[i]);
				}
				refreshTreeData(userMapListCustomer);
			}
		});
		
		// 点击只看会员
		$("#onlyUser").click(function(){
			var userMapListUser = new Array();
			for(var i = 0;i<userMapList.length;i++){
				if(userMapList[i].status == "0"){
					userMapListUser.push(userMapList[i]);
				}
				refreshTreeData(userMapListUser);
			}
		});
		
		// 点击全部用户
		$("#allUser").click(function(){
			refreshTreeData(userMapList);
		});
		
		// 点击修改用户
		$("#updateUser").click(function(){
			var checkedRows = $("#indGrid").jqxTreeGrid('getCheckedRows');
			// 获取所有的客房的id
			if(checkedRows.length == 0){
				showInfo("请先勾选要修改的的用户~", 'warning');
				return;
			}else if(checkedRows.length == 1){
				$(".updateUserBox").jqxWindow('open');
			}else{
				showInfo("请不要勾选多个用户~", 'warning');
				return;
			}
		});
	});
	
	function sexFormat(row, column, value, rowData) {
		if (value == 'm') {
			return "男";
		} else if (value == 'f') {
			return "女";
		}
	}
	
	function statusFormat(row, column, value, rowData) {
		if (value == '0') {
			return "会员";
		} else if (value == '1') {
			return "顾客";
		}
	}
	
	// 加载表格数据
	function refreshTreeData(data) {
		var source = {
			dataType : "json",
			dataFields : [ {
				name : 'id',
				type : 'string'
			}, {
				name : 'username',
				type : 'string'
			}, {
				name : 'sex',
				type : 'string'
			}, {
				name : 'realname',
				type : 'string'
			}, {
				name : 'idcard',
				type : 'string'
			}, {
				name : 'phonenum',
				type : 'string'
			}, {
				name : 'status',
				type : 'string'
			}, {
				name : 'email',
				type : 'string'
			}, {
				name : 'createtime',
				type : 'string'
			}],
			id : 'id',
			localData : data
		};
		var dataAdapter = new $.jqx.dataAdapter(source);
		$("#indGrid").jqxTreeGrid({
			source : dataAdapter
		});
	}
	
	// 点击logo回到前台首页
	function toIndex(){
		window.location.href = basePath+"/page/toIndex";
	}
</script>
</body>
</html>