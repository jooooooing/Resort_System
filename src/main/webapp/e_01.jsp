<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@ page import="java.sql.*,javax.sql.*, java.io.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공지사항 게시판</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>

</head>
<body>
	<jsp:include page="menu.jsp" />
	<h3>공지사항 게시판</h3>
	<table cellspacing=1 width=600 border=1>
		<tr>
			<td width=50>
				<p align=center>번호</p>
			</td>
			<td width=500>
				<p align=center>제목</p>
			</td>
			<td width=100>
				<p align=center>등록일</p>
			</td>
		</tr>

		<%
		Class.forName("com.mysql.cj.jdbc.Driver");
		Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/kopoctc", "root", "koposw31");
		Statement stmt = conn.createStatement();//Statement 객체 생성
		ResultSet rset = stmt.executeQuery("select * from resort_notice order by id desc;");
		while (rset.next()) {
			int id = rset.getInt(1);
		%>
		<tr>
			<td align=center><%=id%></td>
			<td>
				<a href='notice_view.jsp?key=<%=id%>'><%=rset.getString(2)%></a>
			</td>
			<td align=center><%=rset.getString(3)%></td>
		</tr>
		<%
		}
		%>
	</table>
	<br>
	<table>
		<tr>
			<td width=550></td>
			<td>
				<input align=right type=submit OnClick="window.location.href='resort_notice_insert.jsp'" value=신규></input>
			</td>
		</tr>
	</table>

	<table cellspacing=3 cellpadding=20>

		<%
rset.close();
stmt.close();
conn.close();
%>

		</tr>
	</table>
	<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>
</head>