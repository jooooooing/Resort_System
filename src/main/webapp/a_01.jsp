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
	<h3>Kitchen</h3>
		<div class="img">
			<div><h4>Before After</h4></div>
			<img src='assets/kitchen_bf.JPG' style="width:500px; height:400px;">
			<img src='assets/kitchen_af.JPG' style="width:500px; height:400px;">
		</div>
	</div>

	<jsp:include page="footer.jsp"></jsp:include>

</body>
</html>