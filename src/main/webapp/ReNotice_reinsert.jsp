<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<%@ page contentType="text/html; charset=utf-8"%>
<%@ page import="java.sql.*,javax.sql.*, java.io.*"%>
<%@ page import="java.text.SimpleDateFormat"%>
<%@ page import="java.util.Date"%>

<html>
<head>
<style>
#btn {
	float: right;
	margin-right: 15px;
}

.pagination {
	display: flex;
	justify-content: center;
	align-items: center;
}

.container {
	max-width: 600px;
	margin: 0 auto;
}

table {
	text-align: center;
}

.align-left {
	text-align: left;
}

.table-view {
	width: 700px;
	border: 1px solid black;
	border-collapse: collapse;
}

.table-view td {
	height: 30px;
	border: 1px solid grey;
}

.title {
	background-color: lightgrey;
	border-bottom: 3px double black;
}

a {
	color: black;
	text-decoration: none;
}

a:hover {
	text-decoration: underline;
}

div.div-button {
	text-align: right;
}

</style>

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>

</head>
<body>
	<jsp:include page="menu.jsp" />
	<%
	String today = new java.text.SimpleDateFormat("yyyy-MM-dd").format(new java.util.Date());

	Class.forName("com.mysql.cj.jdbc.Driver");
	Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/kopoctc", "root", "koposw31");

	String id = request.getParameter("key");
	String sql = "select * from resort_review where id= " + id + ";";

	PreparedStatement pstmt = conn.prepareStatement(sql);

	ResultSet rset = pstmt.executeQuery();
	rset.next();

	int rootid = rset.getInt("rootid");
	int relevel = rset.getInt("relevel") + 1;
	int recnt = rset.getInt("recnt");
	%>
	<br>
	<div class="container">
		<FORM METHOD=POST name='fm' action="ReNotice_writeReply.jsp">
			<table class="table-view">
				<tr >
					<td class="title">
						<b>번호</b>
					</td>
					<td width="450px" colspan="3">신규</td>
				</tr>
				<tr>
					<td class="title">
						<b>제목</b>
					</td>
					<td colspan="3">
						<input type="text" name=title size=70 maxlength=70 onkeyup="characterCheck(this)" onkeydown="characterCheck(this)" required>
					</td>
				</tr>
				<tr>
					<td class="title">
						<b>일자</b>
					</td>
					<td><%=today%><input type="hidden" name="date" value="<%=today%>">
					</td>
				</tr>
				<tr>
					<td class="title">
						<b>내용</b>
					</td>
					<td>
						<textarea style='width: 500px; height: 250px; overflow-y: scroll' name=content cols=70 row=600 required></textarea>
						<input type="hidden" name="relevel" value="0">
					</td>
				</tr>
				</tr>
				<tr>
					<td class="title">
						<b>원글</b>
					</td>
					<td>
						<input type="number" name="rootid" value="<%=rootid%>" readonly> <input type="hidden" name="id" value="<%=id%>">
					</td>
				</tr>
				<tr>
					<td class="title">
						<b>댓글 수준</b>
					</td>
					<td>
						<input type="number" name="relevel" value="<%=relevel%>" readonly>
					</td>
					<td class="title">
						<b>댓글 순서</b>
					</td>
					<td>
						<input type="text" value="저장시 부여" readonly> <input type="hidden" name="recnt" value="<%=recnt%>">
					</td>
				</tr>
			</table>
			<table width=650>
				<tr>
					<td width=600></td>
					<td>
						<input type=button value="취소" onClick="window.location='e_02_review.jsp?from=0&cnt=15&page=1'">
					</td>
					<td>
						<input type=submit value="쓰기" onClick="window.location='e_02_review.jsp?from=0&cnt=15&page=1'">
					</td>
				</tr>
				<%
				rset.close();
				pstmt.close();
				conn.close();
				%>

			</table>
	</div>
	</FORM>
</body>
</html>