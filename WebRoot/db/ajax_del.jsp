<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%><%@ page contentType="text/html;charset=UTF-8"%><%@ page import="Xproer.*" %><%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";

String fid = request.getParameter("fid");
String uid = request.getParameter("uid");
int ret = 0;

if (fid.length() > 0
	&& uid.length() > 0)
{
	HttpUploaderDB db = new HttpUploaderDB(this.getServletContext());
	db.Delete(uid, fid);
	ret = 1;
}
XDebug.Output("返回值",ret);
%><%=ret %>