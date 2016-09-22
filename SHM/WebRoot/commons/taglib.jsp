<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="/WEB-INF/tld/tz.tld" prefix="tz" %>
<%
response.setHeader("Cache-Control","no-store");
response.setHeader("Pragrma","no-cache");
response.setDateHeader("Expires",0);
/*basePath：指的是绝对路径  path：指的是相对路径*/
String path = request.getContextPath();
int port = request.getServerPort();
String basePath = "";
if(port==80){
	 basePath = request.getScheme()+"://"+request.getServerName()+path;
}else{
	 basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path;
}
request.setAttribute("basePath", basePath);
%>