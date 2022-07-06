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
	<jsp:include page="menu.jsp"></jsp:include>

		<div class="container" id = "wrapper">
	<h3 id="welcome">Dining Room</h3>
		<div class="img">
			<table>
			<tr>
			<td><div id= "table-header"><b>Before</b></div></td>
			<td><div id= "table-header"><b>After</b></div></td>
			</tr>
			<tr>
			<td><img src='assets/dining_bf.JPG' style="width: 500px; height: 400px;"></td>
			<td><img src='assets/dining_af.JPG' style="width: 500px; height: 400px;"></td>
			</tr>
			</table>
		</div>
	</div>

	<%-- <jsp:include page="footer.jsp"></jsp:include> --%>

</body>
</html>