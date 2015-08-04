<%@page language="java" contentType="text/html; charset=utf-8"%>
<%@include file="/tagDeclare.jsp"%>
<html>
<head>
	<%@include file="/headDeclare.jsp"%>
		<script type="text/javascript">
			function logout() {
				top.location.href = "${basePath}core/userLogin!logout.action";
			}
		</script>
</head>

<body>
<div id="headr">
<div class="headerbg1">
<div id="logo" class="headerbg "></div>
</div>
<div id="notice" class="notice">
<div id="noticeleft">
<div class="noticeimage"></div>
<script type="text/javascript">
  function disptime()
  	 { 
     var time = new Date( ); //获得当前时间
     var year = time.getFullYear( );//获得年、月、日
     var month = time.getMonth( )+1;
     var day = time.getDate( ); 
     var hour = time.getHours( ); //获得小时、分钟、秒 
     var minute = time.getMinutes( ); 
     var second = time.getSeconds( ); 
     if (minute < 10) //如果分钟只有1位，补0显示 
      minute="0"+minute; 
     if (second < 10) //如果秒数只有1位，补0显示 
      second="0"+second;
     /*设置文本框的内容为当前时间*/
     document.getElementById('nowTime').innerHTML = "公告：现在是"+ year+"年"+month+"月"+day+"日   "+hour+":"+minute+":"+second; 
  }
  setInterval("disptime();",1000); 
</script>
<div class="noticeItem" id="nowTime">
</div>
</div>
<div id="noticeright"><table width="170" border="0" cellpadding="1">
  <tr>
    <td width="16"><img src="css/images/user.png" width="11" height="16" /></td>
    <td><a target="contentFrame" href="${basePath}core/userDetail!detailUser.action">用户资料</a></td>
    <td width="16"><img src="css/images/password.png" width="11" height="16" /></td>
    <td><a href="javascript:logout()">注消</a></td>
  </tr>
</table>
</div>
</div>
</div>
<div class="clear"></div>
</body>
</html>