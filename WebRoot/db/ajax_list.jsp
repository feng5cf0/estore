<%@ page language="java" contentType="text/html; charset=utf-8"%>
<%@ page import="Xproer.*" %> 
<%@ page import="java.util.*" %> 
<%@ page import="org.apache.commons.lang.*" %> 
<%

/*
注意，输出的文件路径会进行UrlEncode编码
以JSON格式返回文件列表。
客户端需要进行UrlDecode解码
格式：
	[{item1},{item2},{item3},{item4}]
	item = {s:0,filePathLocal:"D:\\Soft\\QQ2012.exe"}
更新记录：
	2012-05-24 完善
*/

String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";

String uid = request.getParameter("uid");
String json = "[]";


if(!StringUtils.isBlank(uid) )
{
	HttpUploaderDB db = new HttpUploaderDB(this.getServletContext());
	json = db.GetFilesJsonByUid(uid);
}
out.write(json);
%>