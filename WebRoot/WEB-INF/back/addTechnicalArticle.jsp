<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
 <base href="<%=basePath%>">
<title>Insert title here</title>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<link href="css/manager/css.css" type="text/css" rel="stylesheet" />
<link href="css/manager/iconfont.css" type="text/css" rel="stylesheet" />
<link href="css/manager/uikit.css" type="text/css" rel="stylesheet" />
<script type="text/javascript" charset="utf-8" src="js/jquery-1.3.2.min.js"> </script>
<script type="text/javascript" charset="utf-8" src="ueditor/ueditor.config.js"></script>
<script type="text/javascript" charset="utf-8" src="ueditor/ueditor.all.js"> </script>
<script type="text/javascript" charset="utf-8" src="ueditor/lang/zh-cn/zh-cn.js"></script>
<script type="text/javascript" charset="utf-8" src="js/technicalArticle/technicalArticle.js"> </script>
<script type="text/javascript" src="js/layer/layer.js" ></script>
</head>
<body>
	<div class="right">
		<table border="0" align="center" cellpadding="0" cellspacing="0"
			class="status">
			<tr>
				<td>售后管理&gt;技术文章</td>
				<td align="right">&nbsp;</td> 
			</tr>
		</table>
		<form action="" method="post" id="addForm">
		<fieldset>
		<legend>技术文章编写</legend>
		<input type="hidden" id="id"  name="id" value=""></input>
		<fieldset class="form form-aligned noborder">
			<div class="control-group">
	          <label><span style="color:red">*</span>编写人</label>
	          <input type="text" id="code" name="technicalArticle.createUser"  placeholder="30个字符" value="" class="input" />
	         </div>
	        <div class="control-group">
	         <label><span style="color:red">*</span>文章标题</label>
	          <input type="text" id="title" name="technicalArticle.title"  placeholder="最大200个字符" value="" class="input" />
	        </div>
	        <div class="control-group">
	         <label><span style="color:red">*</span>文章内容</label>
	        </div>
	        <div class="control-group">
		 		<script id="content" name="technicalArticle.content" type="text/plain" style="width:1024px;height:450px;"></script>
		 	</div>
		</fieldset>
		<br />	
		<div align="center" style="margin-bottom: 30px">
			<input type="button" class="btn" onclick="back();" value="返回" />&nbsp;
			<input class="btn-secondary btn" type="button" onclick="saveContent();" id="btnSave" value="保存" />
		</div>
		</form>
	</div>
<script type="text/javascript">
	
    //实例化编辑器
    //建议使用工厂方法getEditor创建和引用编辑器实例，如果在某个闭包下引用该编辑器，直接调用UE.getEditor('editor')就能拿到相关的实例
    var ue = UE.getEditor('content',{allowDivTransToP: false});
</script>
</body>
</html>