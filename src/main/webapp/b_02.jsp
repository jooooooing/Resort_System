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
.info {
	text-align : center;
}

.route {
	text-align : left;
}

</style>
</head>
<body>
	<jsp:include page="menu.jsp"></jsp:include>

	<h3>대중교통으로 오시는 방법</h3>
	<table class="table table-bordered table-striped table-sm thead-dark table-hover info">
		<tr>
			<td>노선번호</td>
			<td>승차위치</td>
			<td>배차간격/소요시간</td>
			<td>노선</td>
		</tr>
		<tr>
			<td>3</td>
			<td>1호선 안양역</td>
			<td>20분/10분</td>
			<td class="route">안양역 2번출구 > 안앙역 후문 버스승강장(09314 주공뜨란채후문 방면) > 3번 버스 탑승 > 평촌자이아이파크3문.양성교회/더포레스트힐 정류장 하차</td>
		</tr>
		<tr>
			<td>3-1</td>
			<td>1호선 안양역</td>
			<td>30분/15분</td>
			<td class="route">안양역 1번출구 > 안양역 버스승강장(09213 청원놀이터 방면) > 3-1번 버스 탑승 > 평촌자이아이파크3문.양성교회/더포레스트힐 정류장 하차</td>
		</tr>
		<tr>
			<td>7</td>
			<td>4호선 범계역</td>
			<td>7분/15분</td>
			<td class="route">범계역 3번출구 > 목련선경아파트 버스승강장(10063 동안구청,달안 방면) > 7번 버스 탑승 > 평촌자이아이파크3문.양성교회/더포레스트힐 정류장 하차</td>
		</tr>
	</table>
	
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