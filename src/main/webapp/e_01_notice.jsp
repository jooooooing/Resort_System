<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@ page import="java.sql.*,javax.sql.*, java.io.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Periwinkle Mansion</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>

<style>

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

<%
String no_page = "1";
int size_page = 15;
int count_total = 0;
int size_group_page = 10;

if (request.getParameter("page") != null) {
	no_page = request.getParameter("page");
}

Class.forName("com.mysql.cj.jdbc.Driver");
Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/kopoctc", "root", "koposw31");
Statement stmt = conn.createStatement();//Statement 객체 생성

String query1 = "select count(*) from resort_notice;";
ResultSet rset1 = stmt.executeQuery(query1); // 총 레코드 수를 조회하는 쿼리문 실행하여 결과를 ResetSet 객체에 저장
rset1.next();
count_total = rset1.getInt(1);

stmt = conn.createStatement();
String query2 = "select * from resort_notice order by id desc limit " + ((Integer.parseInt(no_page) - 1) * size_page)
		+ ", " + size_page + ";";
ResultSet rset2 = stmt.executeQuery(query2);
%>

</head>
<body>
	<jsp:include page="menu.jsp" />
	<br>
	<div class="container">
	<table class="table-view">
		<tr class="title">
			<td width=50px align=center>
				<b>번호</b>
			</td>
			<td width=300px align=center>
				<b>제목</b>
			</td>
			<td width=100px align=center>
				<b>조회수</b>
			</td>
			<td width=100px align=center>
				<b>등록일</b>
			</td>
		</tr>

		<%
		ResultSet rset = stmt.executeQuery("select * from resort_notice order by id desc limit "
				+ ((Integer.parseInt(no_page) - 1) * size_page) + ", " + size_page + ";");
		while (rset.next()) {
			int id = rset.getInt(1);
			String title = rset.getString(2);
			int cnt = rset.getInt(7);
			String date = rset.getString(3);
		%>
		<tr>
			<td align=center><%=id%></td>
			<td align=left>
				<a href='e_01_notice_oneView.jsp?key=<%=id%>'><%=title%></a>
<%-- 				<a href='e_01_notice_oneView.jsp?key=<%=id%>'><%=rset.getString(2)%></a> --%>
			</td>
			<td align=center><%=cnt%></td>
<%-- 			<td align=center><%=rset.getString(7)%></td> --%>
			<td align=center><%=date%></td>
<%-- 			<td align=center><%=rset.getString(3)%></td> --%>
		</tr>
		<%
		}
		%>
	</table>
	<br>
	
	<table style="margin-left:auto; margin-right:auto;">
	    <tr>
	      <td width=600></td>
	      <td>
					<input type=submit OnClick="window.location.href='notice_insert.jsp'" value=신규></input>
				</td>
			</tr>
		</table>
	<div class="pagination">
		<%
		// 페이징 처리
		int no_page_now = Integer.parseInt(no_page); // request 파라미터로 들어온 현재 페이지 번호를 int형으로 변환하여 변수에 저장

		int no_page_start = (no_page_now / size_group_page) * size_group_page + 1; // 페이징 그룹의 첫 페이지 번호
		if ((no_page_now % size_group_page) == 0) { // 페이징 사이즈로 나누어 떨어지는 마지막 번호를 누르면 페이지가 넘어가는 예외를 처리
			no_page_start -= size_group_page;
		}

		int no_page_last = 0; // 와이파이 게시판의 마지막 페이지 번호
		if ((count_total % size_page) == 0) { // 총 레코드수가 리스트 사이즈로 나눠 떨어지면 그 몫이 총 페이지 개수 이지만
			no_page_last = count_total / size_page;
		} else { // 안 나눠 떨어지면 +1해줘야 총 페이지 개수이다.
			no_page_last = count_total / size_page + 1;
		}

		out.println("<table>");

		if (no_page_start != 1) { // 첫 페이징 그룹이 아닐 때만 <와 << 표시
			out.println("<tr><td><a href='e_01_notice.jsp'>&lt;&lt;</a></td>"); // << 출력하고 첫 페이지로 이동 링크
			out.println("<td><a href='e_01_notice.jsp?page=" + (no_page_start - 1) + "'>&lt;</a></td>"); // < 출력하고 이전 페이징 그룹의 마지막 페이지 링크
		}

		for (int i = no_page_start; i < no_page_start + size_group_page; i++) { // 현재 페이지 번호가 속한 페이징의 그룹의 (첫 페이지 번호) 부터 (첫 페이지 번호+페이징 그룹의 크기) 까지 반복
			if (i > no_page_last) { // i가 마지막 페이지 번호이면 없는 이후 페이지 번호는 출력할 필요 없으므로
				break; //   반복문 종료
			}

			if (i == no_page_now) { // 현재에 해당하는 페이지 번호이면 굵은 글씨로 표시
				out.println("<td><b><a href='e_01_notice.jsp?page=" + i + "'>" + i + "</a></b></td>"); // 현재 페이징 그룹에 해당하는 페이지 번호 출력
			} else { // 아니면 일반 굵기로 표시
				out.println("<td><a href='e_01_notice.jsp?page=" + i + "'>" + i + "</a></td>"); // 현재 페이징 그룹에 해당하는 페이지 번호 출력
			}
		}

		if (!(no_page_start <= no_page_last && no_page_last <= no_page_start + size_group_page) && (no_page_last != 0)) { // 마지막 페이징 그룹이 아닐 때와 출력할 데이터가 있을 때만 >와 >> 표시
			out.println("<td><a href='e_01_notice.jsp?page=" + (no_page_start + size_group_page) + "'>&gt;</a></td>"); // > 출력하고 다음 페이징 그룹의 첫 페이지 링크
			out.println("<td><a href='e_01_notice.jsp?page=" + no_page_last + "'>&gt;&gt;</a></td>"); // >> 출력하고 마지막 페이지로 이동 링크
		}

		out.println("<tr></table>");
		%>
	</div>



	</div>
	<%
rset.close();
stmt.close();
conn.close();
%>

</body>
</html>
</head>