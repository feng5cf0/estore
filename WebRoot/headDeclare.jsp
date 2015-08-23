<%@page language="java" contentType="text/html; charset=utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@include file="/tagDeclare.jsp" %>
<title><s:property value="getText('index.title')"/></title>
<%
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ request.getContextPath() + "/";
	pageContext.setAttribute("basePath", basePath);
%>
<base href="<%=basePath%>" />
<base target="_self"></base>
<link href="css/css.css" type="text/css" rel="stylesheet" />
<link href="css/selectBox.css" type="text/css" rel="stylesheet" />
<link href="css/dtree.css" rel="StyleSheet" type="text/css" />
<script type="text/javascript" src="js/jquery.js">
</script>
<script src="js/dtree.js" type="text/javascript">
</script>
<script src="js/selectAll.js" type="text/javascript">
</script>
<script src="js/showtable.js" type="text/javascript">
</script>
<script type="text/javascript" src="js/util.js">
</script>

<link href="css/table.css" type="text/css" rel="stylesheet" />
<script language="javascript" type="text/javascript"
	src="${basePath}js/My97DatePicker/WdatePicker.js">
</script>
<script type="text/javascript" src="js/window.js">
</script>
<script type="text/javascript" src="js/dateUtil.js">
</script>
<script type="text/javascript" src="js/validator.js">
</script>
<script type="text/javascript" src="js/json2.js">
</script>
<script type="text/javascript" src="js/jquery.messager.js">
</script>
<meta http-equiv="pragma" content="no-cache" />
<meta http-equiv="Cache-Control" content="no-cache, must-revalidate" />
<meta http-equiv="expires" content="0" />
<%@include file="js/error.jsp"%>
<link href="js/loadmask/jquery.loadmask.css" rel="stylesheet"
	type="text/css" />
<script type="text/javascript" src="js/loadmask/jquery-latest.pack.js">
</script>
<script type='text/javascript' src='js/loadmask/jquery.loadmask.js'>
</script>
<script type='text/javascript' src='js/jquery.js'>
</script>
