<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@include file="/commons/taglib.jsp" %>
<!DOCTYPE html>
<html>
	<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<title>shm后台登录页面</title>
	<%@include file="/commons/public.jsp" %>
	<style type="text/css">
		body{background:#2b9c6b/* url(images/login_bg.jpg) no-repeat*/ !important;color:#2f3437 !important;font-size:12px !important;}
		#login_div{width:100%;height:100%;}
		#login_div .login_bt{width:100%;height:30%;position:relative;}
		#login_div .login_logo{width:450px;height:75px;position:absolute;top:50%;left:50%;margin-left:-225px;margin-top:-32.5px;}
		#login_div .login_nr{width:100%;height:300px;background:rgba(47,52,55,0.8);filter:progid:DXImageTransform.Microsoft.gradient(startcolorstr=#7F2f3437,endcolorstr=#7F2f3437);}
		#login_div .login_zi{width:316px;margin:0 auto;}
		#login_div .tishi{width:100%;height:55px;line-height:55px;color:#ffffff;visibility: hidden;}
		#login_div .tishi span{display:block;width:16px;height:16px;margin-top:20px;float:left;}
		#login_div .tishi p{float:left;padding-left:5px;}
		#login_div .icon_close{background:url(${basePath }/images/admin/login/icon_close.png) no-repeat;}
		#login_div .icon_ok{background:url(${basePath }/images/admin/login/icon_ok.png) no-repeat;}
		#login_div .box{width:100%;height:44px;margin-bottom:8px;background:#d3d5dc;-moz-border-radius:6px;-webkit-border-radius:6px;border-radius:6px;}
		#login_div .user_box{width:252px;height:44px;line-height:44px;padding-left:12px;border:0px;background:none;float:left;}
		#login_div .user_pic{width:52px;height:44px;background:url(${basePath }/images/admin/login/icon_username.png) no-repeat center;float:left;}
		#login_div .password_pic{width:52px;height:44px;background:url(${basePath }/images/admin/login/icon_key.png) no-repeat center;float:left;}
		#login_div .yanzheng,#login_div .yz_box{width:62%;line-height:44px;background:none;border:0px;float:left;text-indent:10px;}
		#login_div .yz_change,#login_div .yz_pic{width:38%;line-height:43px;text-align:center;float:right;text-indent:-10px;}
		#login_div .yz_change a{color:#ffffff;}
		#login_div .yz_change span{color:#28b779;}
		#login_div .submit_btn{width:100%;height:44px;text-align:center;color:#ffffff;font-size:18px;border:0px;background:#28b779;-moz-border-radius:6px;-webkit-border-radius:6px;border-radius:6px;cursor:pointer;}
	</style>

	<link rel="stylesheet" type="text/css" href="${basePath }/js/sg/css/common.css">
	
	
	</head>

<body>
	<div id="login_div">

		<div class="login_bt">
			<div class="login_logo">
				<img src="${basePath}/images/admin/login/shm_logo.png" width="450" height="75" />
			</div>
		</div>

		<div class="login_nr">
			<div class="login_zi">
				<div class="tishi" style="display:none;">
					<span class="icon_close"></span>
					<p>您输入的用户名或密码不正确，请重新输入！</p>
				</div>
				<div class="tishi">
					<span class="icon_ok"></span>
					<p>输入正确，恭喜您登录成功！</p>
				</div>
				<div class="box">
					<input name="" type="text" id="account" placeholder="请输入账号"  maxlength="50" class="user_box" required/>
					<div class="user_pic"></div>
				</div>
				<div class="box">
					<input name="" type="password" id="password" placeholder="请输入密码"  maxlength="50" class="user_box" required/>
					<div class="password_pic"></div>
				</div>
				<div class="yanzheng">
					<div class="box">
						<input name="" type="text" id="checkcode" class="yz_box" />
						<div class="yz_pic"><img src="${basePath }/checkcode" style="border:0;"/></div>
					</div>
				</div>
				<div class="yz_change">
					<a href="javascript:void(0)" onClick="randomCheckCode()">看不清，<span>换一张！</span></a>
				</div>
				<div class="clearfix"></div>
				<input onclick="tz_login(this)" type="button" class="submit_btn" value="登 录" />
			</div>
		</div>

	</div>

<script type="text/javascript">
	$(function(){
		$("input").keydown(function(event){
			if(event.which==13){
				tz_login();
			}
		});
	});

	function tz_login(){
		//为了更好的用户体验，改变按钮的背景色。
		$(".submit_btn").css("background","#209161");
		$(".submit_btn").val("登录中...");
		var account = $("#account").val();
		var password = $("#password").val();
		var checkcode = $("#checkcode").val();
		$.tzAjax.request({url:basePath+"/admin/admin/login",callback:function(data){
			if(data.result=="success"){
				window.location.href = basePath+"/toadmin/adminPage/toAdminIndex";
			}
		}},{"account":account,"password":password,"checkcode":checkcode});
		
		/* var account = $("#account").val();
		var password = $("#password").val();
		var checkcode = $("#checkcode").val();
		var parameter = "account="+account+"&password="+password+"&checkcode="+checkcode;
		sendRequest(basePath+"/user/admin/login",parameter,callback_adminLogin);
		
		//1.创建XMLHttpRequest
		var xmlHttp;
		function createXMLHttpRequest()
		{
			if(window.XMLHttpRequest)
			{
				xmlHttp = new XMLHttpRequest();
			}
			else if(window.ActiveXObject)
			{
				try {
				xmlHttp = new ActiveXObject("Msxm12.XMLHTTP");
			} catch (e) {
				xmlHttp = new ActiveXObject("Microsoft.XMLHTTP");
			}
			}
		}
	
		//2.异步请求的方法
		function sendRequest(url,parameter,callback)
		{
			createXMLHttpRequest();
			//当准备状态发生变化时调用callBack()
			xmlHttp.onreadystatechange=callback;
			xmlHttp.open("POST",url, true);
			xmlHttp.setRequestHeader("Content-type","application/x-www-form-urlencoded");
			xmlHttp.send(parameter);
		} 
		
		// 登录成功回调的方法
		function callback_adminLogin()
		{
			if(xmlHttp.readyState==4)
			{
				if(xmlHttp.status==200)
				{
					var data = eval("(" + xmlHttp.responseText +")" );
					if(data.result == "success")
					{
						// window.location.reload(location);
						alert();
					}
					else{
						document.getElementById("error_msg").innerHTML=data.message;
					}
				}
			}
		} */
	}
	// 更换验证码
	function randomCheckCode(){
		var src = basePath+"/checkcode?change="+Math.random();
		$(".yz_pic").find("img").attr("src",src);
	}
</script>
</body>
</html>