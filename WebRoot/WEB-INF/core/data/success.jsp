<%@page language="java" contentType="text/html; charset=utf-8"%>
<%@include file="/tagDeclare.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
	<head>
		<%@include file="/headDeclare.jsp"%>
		<script type="text/javascript">
				function confirm(){
					<c:choose>
						<c:when test="${nextUrl != null and nextUrl != ''}">
							eval("${nextUrl}");
						</c:when>
						<c:otherwise>
							window.close();
						</c:otherwise>
					</c:choose>
				}
		</script>
	</head>
	<body>
		<div class="doing">
			<div class="font24">
				您的操作已成功！
			</div>
			<div></div>
			<div class="centent">
				<input type="button" value="确　定" class="button4"
					onmouseover="this.className='button4Over'"
					onmouseout="this.className='button4Out'" onclick="confirm();" />
			</div>
		</div>
	</body>
</html>



