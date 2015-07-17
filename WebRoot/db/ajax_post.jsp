<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%><%@ page contentType="text/html;charset=UTF-8"%><%@ page import="java.net.URLDecoder" %><%@ page import = "Xproer.*" %><%@ page import="org.apache.commons.lang.StringUtils" %><%@ page import="com.jspsmart.upload.*" %>
<%
/*
	只负责拼接文件块。
	此页面一般由控件负责调用
	参数：
		uid
		fid
		md5
		fileSize
		rangePos
	更新记录：
		2012-4-12 更新文件大小变量类型，增加对2G以上文件的支持。
		2012-4-18 取消更新文件上传进度信息逻辑。
*/
//String path = request.getContextPath();
//String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";

com.jspsmart.upload.SmartUpload up = new com.jspsmart.upload.SmartUpload();
//初始化
up.initialize(pageContext);
//设置上载 的最大值
up.setMaxFileSize(500 * 1024 * 1024);
//上载文件
up.upload();
	
String struid 		= up.getRequest().getParameter("uid");
String strfid 		= up.getRequest().getParameter("fid");
String md5 			= up.getRequest().getParameter("md5");
String strFileSize 	= up.getRequest().getParameter("FileSize");
String strRangePos 	= up.getRequest().getParameter("RangePos");
String pathLocal	= up.getRequest().getParameter("pathLocal");
pathLocal = pathLocal.replaceAll("\\+","%20");
//客户端使用的是encodeURIComponent编码，
pathLocal = URLDecoder.decode(pathLocal,"UTF-8");//utf-8解码

//本地文件名称。QQ2012.exe
int pos = pathLocal.lastIndexOf("/");
String nameLocal = pathLocal.substring(pos+1);

//参数为空
if ( StringUtils.isBlank( strFileSize )
	|| StringUtils.isBlank( struid )
	|| StringUtils.isBlank( strfid )
	|| StringUtils.isBlank( md5 )
	|| StringUtils.isBlank( strRangePos )
	|| StringUtils.isBlank( pathLocal) )
{
	XDebug.Output("fileSize", strFileSize);
	XDebug.Output("uid", struid);
	XDebug.Output("fid", strfid);
	XDebug.Output("md5", md5);
	XDebug.Output("fileNameLocal", pathLocal);
	XDebug.Output("param is null");
	return;
}

if (strFileSize.length() > 0
	&& struid.length() > 0
	&& strfid.length() > 0
	&& md5.length() > 0
	&& strRangePos.length() > 0)
{
	long fileSize 	= Long.parseLong(strFileSize);
	long rangePos 	= Long.parseLong(strRangePos);
	int uid 		= Integer.parseInt(struid);
	int fid 		= Integer.parseInt(strfid);

	HttpUploaderDB db = new HttpUploaderDB(this.getServletContext());
	xdb_files inf = db.GetFileInfByFid(fid);
	
	com.jspsmart.upload.File rangeFile = up.getFiles().getFile(0);
	long rangeSize = rangeFile.getSize();//控件上传的文件块大小
	
	if (null!= inf)
	{
		//已上传大小 = 文件块索引 + 临时文件块大小
		long postedLength = rangePos + rangeSize;
		//上传百分比 = 已上传大小 / 文件总大小
		double per = ((double)postedLength / (double)fileSize) * 100;
		double perd = Math.round(per);
		String postedPercent = Double.toString(perd) + "%";
/*
		XDebug.Output("per", per);
		XDebug.Output("fileSize", fileSize);
		XDebug.Output("postedPercent", postedPercent);
		XDebug.Output("uid", struid);
		XDebug.Output("fid", strfid);
		XDebug.Output("rangePos", rangePos);
		XDebug.Output("postedLength", postedLength);
		XDebug.Output("postedPercent", postedPercent);
		*/
		//保存文件块数据
		FileResumer res = new FileResumer(this.getServletContext(),request);
		res.m_RangePos = rangePos;
		res.m_FileSize = fileSize;
		String remoteFilePath = inf.getFileFolderRemote() + nameLocal;
		//按原始文件名称保存
		res.SaveFileRange(rangeFile, remoteFilePath);
	}
	out.write("ok");
}
%>