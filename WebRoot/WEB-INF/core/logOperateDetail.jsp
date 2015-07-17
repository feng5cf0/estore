<%@page language="java" contentType="text/html; charset=utf-8"%>
<%@include file="/tagDeclare.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
		<title>查看日志</title>
		<link href="../css/css.css" rel="stylesheet" type="text/css" />
		<script type="text/javascript" src="../js/dtree.js">
</script>
	</head>

	<body>
		<div id="rightcontent">
			<div id="road" class="road">
				<div class="roadItem">
					<div class="roadIcon"></div>
					<div class="roadItem2">
						您当前位置：实时监控 &gt; 操作监控&gt; 操作监控详情
					</div>
				</div>
			</div>
			<div class="roadbody1">
				<div class="roadbody">
					<div class="righttitle">
						<div class="tab1">
							<table width="100%" border="0" cellspacing="0" cellpadding="0">
								<tr>
									<td class="tabl">
										&nbsp;
									</td>
									<td class="tabm">
										日志信息
									</td>
									<td class="tabr">
										&nbsp;
									</td>
								</tr>
							</table>
						</div>
					</div>
					<div class="buttonbg1"></div>
					<div class="divtable">
						<table width="100%" border="0" cellspacing="1" cellpadding="0"
							bgcolor="#cecece">
							<tr>
								<td width="200" class="tableitem1">
									操作名称：
								</td>
								<td class="tableitem3">
									<c:choose>
										<c:when test="${operateLog.right==null}">
									非法URL
									</c:when>
										<c:otherwise>
									${operateLog.right.rightName}
									</c:otherwise>
									</c:choose>
								</td>
							</tr>
							<tr>
								<td class="tableitem4">
									访问URL：
								</td>
								<td class="tableitem2">
									${operateLog.accessUrl}
								</td>
							</tr>
							<tr>
								<td class="tableitem1">
									操作状态：
								</td>
								<td class="tableitem3">
									<c:choose>
										<c:when test="${operateLog.status==1}">成功</c:when>
										<c:otherwise>失败</c:otherwise>
									</c:choose>
								</td>
							</tr>
							<tr>
								<td class="tableitem4">
									操作ip：
								</td>
								<td class="tableitem2">
									${operateLog.clientIp}
								</td>
							</tr>
							<tr>
								<td class="tableitem1">
									操作用户：
								</td>
								<td class="tableitem3">
									${operateLog.user.userName}
								</td>
							</tr>
							<tr>
								<td class="tableitem4">
									是否合法：
								</td>
								<td class="tableitem2">
									<c:choose>
										<c:when test="${operateLog.isLegal==1}">是</c:when>
										<c:otherwise>否</c:otherwise>
									</c:choose>
								</td>
							</tr>
							<tr>
								<td class="tableitem1">
									操作时间：
								</td>
								<td class="tableitem3">
									<f:formatDate value="${operateLog.time}"
										pattern="yyyy-MM-dd HH:mm:ss" />
								</td>
							</tr>
							<tr>
								<td class="tableitem4">
									操作时长(毫秒)：
								</td>
								<td class="tableitem2">
									${operateLog.lastingTime}
								</td>
							</tr>
							<tr>
								<td class="tableitem1">
									具体参数：
								</td>
								<td class="tableitem3">
									${operateLog.param}
								</td>
							</tr>
							<tr>
								<td class="tableitem4">
									描述：
								</td>
								<td class="tableitem2">
									${operateLog.description}
								</td>
							</tr>
						</table>
					</div>
					<div class="tablebottom">
						<div class="button4body">
							<table width="100%" border="0" align="center" cellpadding="0"
								cellspacing="1">
								<tr>
									<td align="center">
										<input type="button" value="关 闭" class="button4"
											onMouseOver="this.className='button4Over'"
											onMouseOut="this.className='button4Out'"
											onclick="window.close();" />
									</td>
								</tr>
							</table>
						</div>
					</div>
				</div>
			</div>
		</div>
	</body>
</html>

