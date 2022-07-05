<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Periwinkle Mansion</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>

<style>
</style>
</head>
<body>
	<jsp:include page="menu.jsp"></jsp:include>

	<div class="container">
		Dining Room
		<div class="img">
			<img src='assets/dining_bf.JPG' style="width: 500px; height: 400px;"> 
			<img src='assets/dining_af.JPG' style="width: 500px; height: 400px;">
		</div>
	</div>


	<jsp:include page="footer.jsp"></jsp:include>

</body>
</html>