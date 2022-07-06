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

</style>
</head>
<body>
	<jsp:include page="menu.jsp"></jsp:include>

	<div class="container-fluid">
	
	<h4>자가용으로 오시는 방법</h4>
	<p>
	<b>네비게이션 주소 검색시 아래 주소로 검색하여 주시기 바랍니다.
	<p>
	더포레스트힐(임곡 주공 그린빌) : 경기도 안양시 임곡로 43
	<p>
	네비게이션 검색 ▶ 더포레스트힐(임곡 주공 그린빌)</b>
	</div>
	
			<div class="map">
	<!-- 1. 약도 노드 -->
	<div id="daumRoughmapContainer1656942899026" class="root_daum_roughmap root_daum_roughmap_landing"></div>

	<!-- 2. 설치 스크립트 -->
	<script charset="UTF-8" class="daum_roughmap_loader_script" src="https://ssl.daumcdn.net/dmaps/map_js_init/roughmapLoader.js"></script>

	<!-- 3. 실행 스크립트 -->
	<script charset="UTF-8">
		new daum.roughmap.Lander({
			"timestamp" : "1656942899026",
			"key" : "2au4k",
			"mapWidth" : "640",
			"mapHeight" : "360"
		}).render();
	</script>
	</div>

<%-- 	<jsp:include page="footer.jsp"></jsp:include> --%>

</body>
</html>