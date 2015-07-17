<%@page language="java" contentType="text/html; charset=utf-8"%>
<%@include file="/tagDeclare.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
	<head>
		<%@include file="/headDeclare.jsp"%>
	</head>

	<body>
		<div class="doing" style="margin: 80px auto;">
			<div class="font14">
				发生一个未被处理的错误
			</div>
			<div>
				<table width="380px" border="0" align="center" cellpadding="0"
					cellspacing="0">
					<tr>
						<td class="font4">
							错误原因：
						</td>
					</tr>
					<tr>
						<td>
							1.操作对象：
							<s:property value="#session.operateLog.right.target" />
						</td>
					</tr>
					<tr>
						<td>
							2.失败原因:
							<s:property value="#session.operateLog.description" />
						</td>
					</tr>

					<tr>
						<td>
							请你联系您的管理员或技术支持，感谢您的配合。
						</td>
					</tr>
				</table>
			</div>
			<div>
				<table width="380" border="0" align="center" cellpadding="0"
					cellspacing="0">
					<tr>
						<td class="font4">
							您可以选择：
						</td>
					</tr>
					<tr>
						<td>
							<a href="${basePath}core/index.action">（1）重新登录</a>
						</td>
					</tr>
					<tr>
						<td>
							（2）
							<a href="javascript:history.go(-1);">返回上次页面</a>，但可能重复发生错误。
						</td>
					</tr>
				</table>
			</div>
			<!-- 
			<h3>
				错误信息
			</h3>

			<s:actionerror />

			<p>
				<s:property value="%{exception.message}" />
			</p>

			<hr />
			
			
				技术细节
			</h3>

			<p>
			
				<s:property value="%{exceptionStack}" />
		
				</p>
			 -->
		</div>
	</body>
</html>

