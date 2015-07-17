<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%><%@ page contentType="text/html;charset=UTF-8" %> 
<%@ page import = "Xproer.*" %>
<%@ page import="org.apache.commons.lang.StringUtils" %>
<%
/// <summary>
/// 只负责更新数据表中文件上传进度信息。
/// 调用位置：HttpUploader.js中HttpUploader_Process事件
/// 更新记录：
///		2012-4-18 创建
/// </summary>
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";

String suid 		= request.getParameter("uid");
String sfid 		= request.getParameter("fid");
String sPostedLen 	= request.getParameter("PostedLength");
String percent 		= request.getParameter("Percent");

if (StringUtils.isBlank(suid)
	|| StringUtils.isBlank(sfid)
	|| StringUtils.isBlank(sPostedLen)
	|| StringUtils.isBlank(percent) )
{
	return;
}

int uid = Integer.parseInt(suid);
int fid = Integer.parseInt(sfid);
long postedLength = Long.parseLong(sPostedLen);

HttpUploaderDB db = new HttpUploaderDB(this.getServletContext());
db.UpdateProgress(uid, fid, postedLength, postedLength, percent);
%>