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

<style>
#wrapper{
  height: auto;
  min-height: 100%;
  padding-bottom: 10px;
}
</style>
</head>
<body>
	<jsp:include page="menu.jsp"></jsp:include>

	<div class="container" id="wrapper">
	<br>
	<p><b>Periwinkle Mansion</b>은 이주현, 권지혜의 집입니다.</p>
	<p>Periwinkle은 빙카, 페리윙클(협죽도과의 식물), 일일초라고 불리는 꽃이며 연보라 색을 지칭합니다.</p>
	<div>
	<img src='assets/periwinkle.webp' style="width:500px; height:400px;">
	</div>
	</div>

	<jsp:include page="footer.jsp"></jsp:include>

</body>
</html>