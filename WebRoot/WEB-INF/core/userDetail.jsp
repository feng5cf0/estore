<%@page language="java" contentType="text/html; charset=utf-8"%>
<%@include file="/tagDeclare.jsp"%>
		<%@include file="/headDeclare.jsp"%>
<html >
<head>
<script type="text/javascript">
function changePassword() {
	showSmallDialog("${basePath}core/userUpdatePassword!prepare.action");
}
</script>
	</head>
<body>
<div id="rightcontent">
	<div id="road" class="road">
	  <div class="roadItem">
      <div class="roadIcon"></div>
      <div class="roadItem2">您当前位置：用户资料</div>
      </div>	 
	</div>
    <div class="roadbody1">
    <div class="roadbody">
    <div class="righttitle">
    <div class="tab1">
      <table width="100%" border="0" cellspacing="0" cellpadding="0">
        <tr>
          <td class="tabl">&nbsp;</td>
          <td class="tabm">用户资料</td>
          <td class="tabr">&nbsp;</td>
        </tr>
      </table>
    </div>
     <div class="tab4"><%--${error}--%> </div>
    </div>
    <div class="buttonbg">
    <div class="divbutton">
    <input type="button" value="修改密码" class="button"
    onMouseOver="this.className='buttonOver'"
    onMouseOut="this.className='buttonOut'"
    onclick="changePassword()" />
    </div>
    </div> 
    <div class="divtable"><table width="100%" border="0" cellspacing="1" cellpadding="0" bgcolor="#cecece">
  <tr>
    <td width="200" class="tableitem1">用户名称：</td>
    <td class="tableitem3">	${user.userName} </td>
  </tr>
  <tr>
    <td class="tableitem4" >本次登录IP：</td>
    <td class="tableitem2">${user.loginIP}</td>
  </tr>
  <tr>
    <td class="tableitem1">本次登录时间：</td>
    <td class="tableitem3"><f:formatDate value="${user.loginTime}" pattern="yyyy-MM-dd HH:mm:ss" /></td>
  </tr>
  <tr>
    <td class="tableitem4">上次登录IP：</td>
    <td class="tableitem2">${user.lastLoginIP} </td>
  </tr>
  <tr>
    <td class="tableitem1">上次登录时间：</td>
    <td class="tableitem3">	<f:formatDate value="${user.lastLoginTime}" pattern="yyyy-MM-dd HH:mm:ss" /> </td>
  </tr>
</table>
</div>   
    </div>
    </div>
</div>
</body>
</html>

