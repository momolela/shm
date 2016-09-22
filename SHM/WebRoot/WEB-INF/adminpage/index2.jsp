<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@include file="/commons/taglib.jsp" %>
<!DOCTYPE HTML>
<html>
  <head>
    <title>shm后台管理中心</title>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<%@include file="/commons/public.jsp" %>
  </head>
  
<body>
   <div style="width:100%;height:300px;box-shadow:0px 0px 10px #000;">这是后台管理的首页</div>
   <a href="${basePath }/admin/admin/logout" id="logout"><input id="button" type="button" value="退出"/></a>
   
<script type="text/javascript">
	var inter = progressBar(0, 20, null);
	inter = progressBar(20, 50, inter);
	inter = progressBar(50, 80, inter);
	progressBar(80, 100, inter, function(){
        showInfo("保存成功！", "success");
    });
    
    $("#button").jqxButton({
    	theme : theme,
		template : "primary",
		cursor : "pointer",
		width : '100',
		height : '30'
	});
</script>
</body>
  
</html>
