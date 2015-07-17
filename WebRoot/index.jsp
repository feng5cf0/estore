<%@ page language="java"  pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
	String serverIp = "10.10.33.76";//服务器地址
	String ip = "";
	session.invalidate();
	//获取客户端真实IP
	if(request.getHeader("x-forwarded-for")==null){
		ip=request.getRemoteAddr();
	}else{
		ip=request.getHeader("x-forwarded-for");
	}
	if(serverIp.equals(ip)){
		response.sendRedirect("http://lams.landicorp.com/core/index.action");
	}else{
		response.sendRedirect(basePath+"core/index.action");
	}
	
%>