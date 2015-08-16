<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
  	<%@include file="/headDeclare.jsp"%>
  	<%@include file="/tagDeclare.jsp"%>
    <base href="<%=basePath%>">
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	<link rel="stylesheet" type="text/css" href="css/default.css"/>
  </head>
  
 <body>
	<DIV id=floatTools class=float0831>
  		<DIV class=floatL>
  			<A style="DISPLAY: none" id=aFloatTools_Show class=btnOpen 
  				title="查看在线客服" onclick="javascript:$('#divFloatToolsView').animate({width: 'show', opacity: 'show'}, 'normal',function(){ $('#divFloatToolsView').show();kf_setCookie('RightFloatShown', 0, '', '/', 'www.istudy.com.cn'); });$('#aFloatTools_Show').attr('style','display:none');$('#aFloatTools_Hide').attr('style','display:block');" 
				href="javascript:void(0);">展开</A> <A id=aFloatTools_Hide class=btnCtn 
				title=关闭在线客服  onclick="javascript:$('#divFloatToolsView').animate({width: 'hide', opacity: 'hide'}, 'normal',function(){ $('#divFloatToolsView').hide();kf_setCookie('RightFloatShown', 1, '', '/', 'www.istudy.com.cn'); });$('#aFloatTools_Show').attr('style','display:block');$('#aFloatTools_Hide').attr('style','display:none');" 
				href="javascript:void(0);">
				收缩
			</A> 
		</DIV>
	  	<div id=divFloatToolsView class=floatR>
	    	<DIV class=tp></DIV>
	    		<DIV class=cn>
	      <UL>
	        <LI>
	          <H3 class=titZx>QQ咨询</H3>
	        </LI>
	        <LI><SPAN class=icoZx>在线咨询</SPAN> </LI>
	        <LI><a class=icoTc  href="http://wpa.qq.com/msgrd?v=3&uin=&site=qq&menu=yes">洪震平</a> </LI>
	        <LI><A class=icoTc href="javascript:void(0);">B老师</A> </LI>
	        <LI><A class=icoTc href="#">C老师</A> </LI>
	        <LI class=bot><A class=icoTc href="javascript:void(0);">D老师</A> </LI>
	      </UL>
	      <UL class=webZx>
	        <LI class=webZx-in><A href="http://www.lanrentuku.com/" target="_blank" style="FLOAT: left"><IMG src="images/right_float_web.png" border="0px"></A> </LI>
	      </UL>
	      <UL>
	        <LI>
	          <H3 class=titDh>电话咨询</H3>
	        </LI>
	        <LI><SPAN class=icoTl>400-000-0000</SPAN> </LI>
	        <LI class=bot>
	          <H3 class=titDc><A href="http://www.lanrentuku.com/" target="_blank">新版调查</A></H3>
	        </LI>
	      </UL>
	    </DIV>
	  </DIV>
	</DIV>
  </body>
</html>
