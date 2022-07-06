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
<link href="style.css" rel="stylesheet" type="text/css">
<style>

</style>
</head>
<body>
	<div id="header">
	<jsp:include page="menu.jsp"></jsp:include>	
	</div>

	<div class="container-fluid box" id="wrapper">
		<div class="text-center">
			<h3 id="welcome">Welcome to Periwinkle Mansion!</h3>
			<div> <img src="assets/APL_3108.jpg" style="width:800px; height:600px;">
			</div>
			<%
			Date now = new Date();
			SimpleDateFormat format = new SimpleDateFormat("hh:mm:ss a");
			%>
			<h3 id="welcome">현재 접속 시각 : <%=format.format(now)%></h3>
		</div>
	</div>

<%-- 	<div id="footer">
	<jsp:include page="footer.jsp"></jsp:include>
	</div> --%>
	

</body>
</html>