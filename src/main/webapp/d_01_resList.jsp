<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<%@ page contentType="text/html; charset=utf-8"%>
<%@ page import="java.sql.*,javax.sql.*, java.io.*"%>

<html>
<head>
<title>Periwinkle Mansion</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>

<style>
.container {
	margin-top: 5px;
	display: flex;
	justify-content: center;
	align-items: center;
}

.pagination {
	display: flex;
	justify-content: center;
	align-items: center;
}

.div_btn {
	float: right;
}
</style>

<%
String no_page = "1";
int size_page = 30;
int count_total = 0;
int size_group_page = 30;

if (request.getParameter("page") != null) {
	no_page = request.getParameter("page");
}

Class.forName("com.mysql.cj.jdbc.Driver");
Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/kopoctc", "root", "koposw31");
Statement stmt = conn.createStatement();//Statement 객체 생성
String sql1 = "select * from resort_resv;";
ResultSet rset1 = stmt.executeQuery(sql1);
rset1.next();
count_total = rset1.getInt(1);

stmt = conn.createStatement();
String sql2 = "select * from resort_resv limit " + ((Integer.parseInt(no_page) - 1) * size_page) + "," + size_page
		+ ";";
ResultSet rset2 = stmt.executeQuery(sql2);
%>
</head>

<body>
	<jsp:include page="menu.jsp" />
	<div class="container">
		<h3>Coming Soon</h3>

		<%-- 		<table class="table table-bordered table-striped table-sm thead-dark table-hover">
			<tr>
				<td>날짜</td>
				<td>1번</td>
				<td>2번</td>
				<td>3번</td>
				<td>4번</td>
				<td>5번</td>
				<td>6번</td>
				<td>7번</td>
			</tr>
			<%
			while (rset2.next()) {
				out.println("<tr>");
				out.println("<td>" + rset2.getDate("resv_date") + "</td>");
				out.println("<td>" + rset2.getInt("room") + "</td>");
				out.println("<td>" + rset2.getString("addr") + "</td>");
				out.println("<td>" + rset2.getString("telnum") + "</td>");
				out.println("<td>" + rset2.getString("in_name") + "</td>");
				out.println("<td>" + rset2.getString("comment") + "</td>");
				out.println("<td>" + rset2.getDate("write_date") + "</td>");
				out.println("<td>" + rset2.getString("processing") + "</td>");
				out.println("</tr>");
			}
			%>
		</table> --%>
	</div>

	<%
	rset2.close();
	rset1.close();
	stmt.close();
	conn.close();
	%>
	<%-- 	<jsp:include page="footer.jsp"></jsp:include> --%>
</body>
</html>
</head>
