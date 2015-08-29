<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s" %>
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
<script type="text/javascript" charset="utf-8" src="js/afterSale/customerSer.js?v=141"> </script>
<script type="text/javascript" src="js/layer/layer.js" ></script>
</head>
<body>
	<div class="right">
		<table border="0" align="center" cellpadding="0" cellspacing="0"
			class="status">
			<tr>
				<td>售后管理&gt;客服管理</td>
				<td align="right">&nbsp;</td> 
			</tr>
		</table>
		<form action="" method="post" id="addForm">
		<fieldset>
		<legend>添加客服</legend>
		<input type="hidden" id="id"  name="id" value=""></input>
		<fieldset class="form form-aligned noborder">
			<div class="control-group">
	          <label><span style="color:red">*</span>编写人</label>
	          <input type="text" id="createUser" name="customerSer.createUser"  placeholder="30个字符" value="" class="input" />
	         </div>
	        <div class="control-group">
	         <label><span style="color:red">*</span>QQ拥有人</label>
	          <input type="text" id="name" name="customerSer.name"  placeholder="最大200个字符" value="" class="input" />
	        </div>
	        <div class="control-group">
	         <label><span style="color:red">*</span>qq生成的代码</label>
	         <textarea id="code" escape="false" name="customerSer.qqCode" rows="15" cols="100" ></textarea>
 			 <%--  <s:textarea name="customerSer.qqCode" ></s:textarea>
 			  <s:property escape=""/> --%>
 			  
	        </div>
	        <div class="control-group">
	        	
		 	</div>
		 	
		</fieldset>
		<br />	
		<div align="center" style="margin-bottom: 30px">
			<input type="button" class="btn" onclick="back();" value="返回" />&nbsp;
			<input class="btn-secondary btn" type="button"  id="btnSave" value="保存" />
		</div>
		</form>
	</div>
</body>
<script type="text/javascript">
	
    //实例化编辑器
    //建议使用工厂方法getEditor创建和引用编辑器实例，如果在某个闭包下引用该编辑器，直接调用UE.getEditor('editor')就能拿到相关的实例
    var ue = UE.getEditor('content');
</script>
</html>