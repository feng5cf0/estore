<%@page language="java" contentType="text/html; charset=utf-8"%>
<%@include file="/tagDeclare.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
	<head>
		<%@include file="/headDeclare.jsp"%>
		<script type="text/javascript">
				function confirm(){
					<c:if test="${nextUrl != null}">
						window.location.href="${nextUrl}";
					</c:if>
					<c:if test="${nextUrl == null}">
						history.back();
					</c:if>
				}
		</script>
	</head>
	<body>
		<div id="infoxx">
			<div class="infoxx1">
				您的操作页面已成功！
			</div>
			<div class="infoxx1">
				<span class="dmg-listli-item2"> <input type="button"
						value="确定" class="button2"
						onmouseover="this.className='button2Over'"
						onmouseout="this.className='button2Out'" onclick="confirm();" />
				</span>
			</div>
		</div>
	</body>
</html>



