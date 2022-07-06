<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<%@ page contentType="text/html; charset=utf-8"%>
<%@ page import="java.sql.*,javax.sql.*, java.io.*"%>
<%@ page import="java.util.Calendar"%>

<html>
<head>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
<%
Class.forName("com.mysql.cj.jdbc.Driver");
Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/kopoctc", "root", "koposw31");
Statement stmt = conn.createStatement(); //객체생성
String id_notice = request.getParameter("key");

Integer id = 0;

id = Integer.parseInt(id_notice);

ResultSet rset = stmt.executeQuery("select * from resort_notice where id = " + id + ";");
rset.next();
Integer id_notice2 = rset.getInt(1);//번호
String title = rset.getString(2); //제목
String today = rset.getString(3); // 날짜
String content = rset.getString(4); //내용
%>
<title>Periwinkle Mansion</title>
</head>
<body>
	<jsp:include page="menu.jsp" />
	<br>
	<table border=1 cellspacing=0 cellpadding=5>

		<tr>
			<td>
				<b>번호</b>
			</td>
			<td width=480 colspan=3 align=left>
				<input type='hidden' name="id" value=<%=id%>><%=id%></td>
		</tr>

		<tr>
			<td>
				<b>제목</b>
			</td>
			<td width=480 colspan=3 align=left>
				<input type='hidden' name="title" value=<%=title%>><%=title%></td>
		</tr>

		<tr>
			<td>
				<b>일자</b>
			</td>
			<td width=480 colspan=3 align=left>
				<input type='hidden' name="today" value=<%=today%>><%=today%></td>
		</tr>

		<tr>
			<td>
				<b>내용</b>
			</td>
			<td width=480 colspan=3 align=left>
				<textarea rows="10px" cols="60px" readonly><%=content%></textarea></td>
		</tr>
		<%
		rset.close();
		stmt.close();
		conn.close();
		%>

	</table>
	<table width=540>

		<tr>
			<td width=500></td>
			<td>
				<input type=button value="목록" OnClick="location.href='e_01_notice.jsp'">
			</td>
			<td>
				<input type=button value="수정" OnClick="location.href='notice_updateView.jsp?key=<%=id%>'">
			</td>
			<td>
				<input type=button value="삭제" OnClick="location.href='notice_delete.jsp?key=<%=id%>'">
			</td>
		</tr>
	</table>

</body>
</html>


