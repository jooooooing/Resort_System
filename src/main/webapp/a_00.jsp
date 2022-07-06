<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Periwinkle Mansion</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
	rel="stylesheet">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
<link href="style.css" rel="stylesheet" type="text/css">
<style>

</style>
</head>
<body>
	<jsp:include page="menu.jsp"></jsp:include>
	
	<div class="container" id = "wrapper">
		<div align="center">
			<br>
			<div><b>Periwinkle Mansion</b>은 이주현, 권지혜의 집입니다.
			<br>Periwinkle은 빙카, 페리윙클(협죽도과의 식물), 일일초라고 불리는 꽃이며 연보라 색을 지칭합니다.</div>
			<table>

			<tr>
			<td><img src='assets/periwinkle.webp' style="width:300px; height:200px;"></td>
			</tr>
			</table>
		</div>
	</div>

<%-- 	<jsp:include page="footer.jsp"></jsp:include>
 --%>
</body>
</html>