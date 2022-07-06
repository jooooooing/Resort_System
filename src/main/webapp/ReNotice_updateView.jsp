<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<%@ page contentType="text/html; charset=utf-8"%>
<%@ page import="java.sql.*,javax.sql.*, java.io.*"%>

<%@ page import="java.util.Calendar"%>
<html>
<head>
<title>글 수정</title>
 <style>
    .container {
      max-width: 600px;
      margin:0 auto;
    }
    table {
      text-align: center;
    }
    .align-left {
      text-align: left;
    }
    .table-view {
      width: 600px;
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
    .pagination {
      margin:0 auto;
    }
  </style>
  
  <link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
	rel="stylesheet">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
  
<SCRIPT LANGUAGE="JavaScript">
	//특수문자 금지 (이름)
	function characterCheck(obj) {
		var regExp = /[ \{\}\[\]\/?.,;:|\)*~`!^\-_+┼<>@\#$%&\'\"\\\(\=]/gi;
		if (regExp.test(obj.value)) {
			alert("특수문자는 입력하실 수 없으셔요.");
			obj.value = obj.value.substring(0, obj.value.length - 1); // 입력한 특수문자 한자리 지움
		}
	}
</SCRIPT>
</head>
<%
String today = new java.text.SimpleDateFormat("yyyy-MM-dd").format(new java.util.Date());
Class.forName("com.mysql.cj.jdbc.Driver");
Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/kopoctc", "root", "koposw31");
Statement stmt = conn.createStatement(); //객체생성
String id_from_view = request.getParameter("key");
ResultSet rset = stmt.executeQuery("select * from resort_review where id='" + id_from_view + "';");
request.setCharacterEncoding("UTF-8"); // 한글 처리

String title = "";
String date = "";
String content = "";
int id = 0;

while(rset.next()){
id = rset.getInt(1);
title = rset.getString(2);
content = rset.getString(4);	
}

%>
<body>
<jsp:include page="menu.jsp" />
<br>
<div class="container">
<FORM METHOD="POST" action="ReNotice_updateData.jsp">
<center>
<table width=650 border=1 cellspacing=0 cellpadding=5>
		<tr>
			<td><b>번호</b></td>
			<td><%=id%><input type=hidden name=id value=<%=id%>></td>
			<!--hidden 은 사용자가 변경해선 안되는 데이터를 보낼 때 사용-->
		</tr>
		<tr>
			<td><b>제목</b></td>
			<td><input type=text name=title size=70 maxlength=70
				value=<%=title%> onkeyup="characterCheck(this)"
				onkeydown="characterCheck(this)" required></td>
		</tr>
		<tr>
			<td><b>일자</b></td>
			<td><%=today%></td>
		</tr>
		<tr>
			<td><b>내용</b></td>
			<td><textarea
					style='width: 500px; height: 250px; overflow-y: scroll'
					name=content cols=70 row=600 required><%=content%></textarea></td>
		</tr>


	</table>

	<table width=650>
		<tr>
			<td width=600></td>
			<td><input type=button value="취소"
				OnClick="window.location='e_02_review.jsp?from=0&cnt=15&page=1'"></td>
			<td><input type=submit value="저장"></td>
		</tr>
	</table>
</center>
	
</FORM>
		<%
		rset.close();
		stmt.close();
		conn.close();
		%>


</body>
</html>
