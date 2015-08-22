<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<head>
<title>Insert title here</title>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<link href="css/manager/css.css" type="text/css" rel="stylesheet" />
<link href="css/manager/iconfont.css" type="text/css" rel="stylesheet" />
<link href="css/manager/uikit.css" type="text/css" rel="stylesheet" />
<script type="text/javascript" charset="utf-8" src="js/afterSale/customerSer.js?v=111"> </script>
</head>
<body>
	<div class="right">
		<table border="0" align="center" cellpadding="0" cellspacing="0"
			class="status">
			<tr>
				<td>系统管理&gt;客服管理&gt;详情</td>
				<td align="right">&nbsp;</td> 
			</tr>
		</table>
		<form action="" method="post" id="detailForm">
		<fieldset>
		<legend>协议信息</legend>
		<input type="hidden" id="id"  name="id" value="${customerSer.id }"></input>
		<fieldset class="form form-aligned noborder">
			<div class="control-group">
	          <label>客服姓名</label>
	          	<c:out value="${customerSer.name }"></c:out>
	         </div>
	        <div class="control-group">
	          <label>编辑者</label>
	          	<c:out value="${customerSer.createUser }"></c:out>
	         </div>
	        <div class="control-group">
	         <label>qq生成代码</label>
	        </div>
	        <div  class="help_content">
	        	<span id="spanContent">
	        		 <c:out value="${customerSer.qqCode }" escapeXml="false"></c:out>
				</span>
		 	</div>
		</fieldset>
		<br />	
		<div align="center" style="margin-bottom: 30px">
			<input type="button" class="btn" onclick="back();" value="返回" />&nbsp;&nbsp;
		</div>
		</form>
	</div>
</body>
</html>