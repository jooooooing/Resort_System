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
Statement stmt = conn.createStatement();
Statement stmt2 = conn.createStatement();
String id = request.getParameter("key");
String addViewCnt = "update resort_notice set viewcnt = viewcnt+1 where id = " + id + ";";
stmt2.execute(addViewCnt);
String viewOne = "select * from resort_notice where id = '" + id + "';"; //해당 번호만 조회
ResultSet rset = stmt.executeQuery(viewOne); //쿼리문을 실행하고 반환한 값을 저장.
String title = "";
String contents = "";
String rootid = "";
int recnt, relevel, viewcnt = 0;

rset.next();
title = rset.getString(2);
contents = rset.getString(4);
recnt = rset.getInt(7);
relevel = rset.getInt(6);
viewcnt = rset.getInt(8);
rootid = rset.getString(5);
%>
<title>Periwinkle Mansion</title>
</head>
<body>
	<jsp:include page="menu.jsp" />
	<center>
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
				<input type='hidden' name="today" value=<%=rset.getDate(3)%>><%=rset.getDate(3)%></td>
		</tr>

		<tr>
			<td>
				<b>내용</b>
			</td>
			<td width=480 colspan=3 align=left>
				<textarea rows="10px" cols="60px" readonly><%=contents%></textarea></td>
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
	
	</center>
	

</body>
</html>


