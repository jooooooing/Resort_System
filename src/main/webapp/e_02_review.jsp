<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@ page import="java.sql.*,javax.sql.*, java.io.*"%>
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
<jsp:include page="menu.jsp" />
	<h3>이용후기</h3>
	<table class="table table-bordered table-striped table-sm thead-dark table-hover">
		<tr>
			<td>
				<p>번호</p>
			</td>
			<td>
				<p>제목</p>
			</td>
			<td>
				<p>등록일</p>
			</td>
		</tr>

		<%
		Class.forName("com.mysql.cj.jdbc.Driver");
		Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/kopoctc", "root", "koposw31");
		Statement stmt = conn.createStatement();//Statement 객체 생성
		ResultSet rset = stmt.executeQuery("select * from resort_review order by id desc;");
		while (rset.next()) {
			int id = rset.getInt(1);
		%>
		<tr>
			<td align=center><%=id%></td>
			<td>
				<a href='e_02_review_oneView.jsp?key=<%=id%>'><%=rset.getString(2)%></a>
			</td>
			<td align=center><%=rset.getString(3)%></td>
		</tr>
		<%
		}
		%>
	</table>
	<table>
		<tr>
			<td>
				<input align=right type=submit OnClick="window.location.href='notice_insert.jsp'" value=신규></input>
			</td>
		</tr>
	</table>

	<%
rset.close();
stmt.close();
conn.close();
%>

	<jsp:include page="footer.jsp"></jsp:include>

</body>
</html>