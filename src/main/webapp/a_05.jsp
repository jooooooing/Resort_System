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
			<table>
			<tr>
			<td><div id= "table-header"><b>Before</b></div></td>
			<td><div id= "table-header"><b>After</b></div></td>
			</tr>
			<tr>
			<td><img src='assets/lib_bf.JPG' style="width:400px; height:300px;"></td>
			<td><img src='assets/lib_af.jpeg'style="width:400px; height:300px;"></td>
			</tr>
			</table>
			<div><b>서재입니다.</b></div>
		</div>
	</div>

<%-- 	<jsp:include page="footer.jsp"></jsp:include>
 --%>
</body>
</html>