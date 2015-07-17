<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%><%@ page contentType="text/html;charset=UTF-8"%><%@ page import="Xproer.*" %><%@ page import="java.net.URLDecoder" %><%@ page import="java.io.*" %><%
/*
	此页面主要用来向数据库添加一条记录。
	一般在 HttpUploader.js HttpUploader_MD5_Complete(obj) 中调用
	更新记录：
		2012-05-24 完善
*/
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";

String md5 			= request.getParameter("md5");
String uid 			= request.getParameter("uid");
String fileLength 	= request.getParameter("fileLength");
String fileSize 	= request.getParameter("fileSize");
String pathLocal	= request.getParameter("pathLocal");
String diretoryName = request.getParameter("diretoryName");
//System.out.println("....diretoryName="+diretoryName);
pathLocal = pathLocal.replaceAll("\\+","%20");
//客户端使用的是encodeURIComponent编码，
pathLocal = URLDecoder.decode(pathLocal,"UTF-8");//utf-8解码

String json = "0";

//参数为空
if (md5 == null
	|| uid == null
	|| fileSize == null)
{
	out.write("param is null\n");
	return;
}

if (md5.length() > 0
	&& uid.length() > 0
	&& fileSize.length() > 0)
{
	File f = new File(pathLocal);	
	int pos = pathLocal.lastIndexOf(".");
	String ext = pathLocal.substring(pos+1);
	ext.toLowerCase();
	
	//文件名称。QQ2012.exe
	pos = pathLocal.lastIndexOf("/");
	String name = pathLocal.substring(pos+1);
	
	HttpUploaderDB db = new HttpUploaderDB(this.getServletContext());
	//xdb_files inf = db.GetFileInfByMd5(md5);
	//数据库存在相同文件
	/*if ( null != inf)
	{
		inf.setFileNameLocal( f.getName() );
		inf.setFilePathLocal( pathLocal );
		inf.setFileNameRemote( md5 + "." + ext);
		inf.setIsDeleted(false);
		inf.setFid(db.Add(inf));
	}//数据库不存在相同文件
	else
	{*/
		HttpUploaderCfg cfg = new HttpUploaderCfg(this.getServletContext());
		//创建上传文件夹
		cfg.CreateUploadPath(diretoryName);
		xdb_files inf = new xdb_files();

		inf.setFileNameLocal( name );
		inf.setFilePathLocal( pathLocal );
		inf.setFileNameRemote( md5 + "." + ext);
		inf.setFileSize(fileSize);
		inf.setFileMD5(md5);
		inf.setFileLength(fileLength);
		inf.setFilePathRemote( cfg.GetUploadPath() + inf.getFileNameRemote());
		inf.setFilePathRelative( cfg.GetRelatPath() + inf.getFileNameRemote());
		inf.setFid( db.Add(inf) );
	//}
	json = inf.ToJson();
}
out.write(json);
%>