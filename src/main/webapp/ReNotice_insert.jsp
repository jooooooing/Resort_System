<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<%@ page contentType="text/html; charset=utf-8"%>
<%@ page import="java.sql.*,javax.sql.*, java.io.*"%>

<%@ page import="java.util.Calendar"%>
<html>
<head>
<title>새 글 추가</title>
<style type="text/css">

 .container {
      max-width: 600px;
      margin:0 auto;
    }
    table {
      text-align: center;
    }
    td {
      border: 1px solid black;
    }
    .table-input {
      width: 600px;
      border-collapse: collapse;
      align: center;
    }
    .table-input td {
      height: 30px;
      border: 1px solid grey;
    }
    td.title {
      border-right: 3px double grey;
      background-color: lightgrey;
    }
    .align-left {
      text-align: right;
    }
    a {
      color: black;
      text-decoration: none;
    }
    a:hover {
      text-decoration: underline;
    }
    textarea {
      width: 450px; 
      height: 250px;
    }
    div.div-button {
      text-align: right;
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
Class.forName("com.mysql.cj.jdbc.Driver");
Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/kopoctc", "root", "koposw31");
Statement stmt = conn.createStatement(); //객체생성
String today = new java.text.SimpleDateFormat("yyyy-MM-dd").format(new java.util.Date());
%>
<body>
<jsp:include page="menu.jsp" />
<div class="container">
	<FORM METHOD=POST name="fm" action="ReNotice_write.jsp">
<center>
<br>
		<table class="table-input">
			<tr>
				<td class="title"><b>번호</b></td>
				<td width="450px">신규(insert)<input type=hidden name=id value='INSERT'></td>
				<!--hidden 은 사용자가 변경해선 안되는 데이터를 보낼 때 사용-->
			</tr>
			<tr>
				<td class="title"><b>제목</b></td>
				<td><input type="text" name=title size=70 maxlength=70
					onkeyup="characterCheck(this)" onkeydown="characterCheck(this)"
					required></td>
			</tr>
			<tr>
				<td class="title"><b>일자</b></td>
				<td><%=today%></td>
			</tr>
			<tr>
				<td class="title"><b>내용</b></td>
				<td><textarea name="content" cols="70" row="600">
				</textarea>
				<input type="hidden" name="relevel" value="0">
                </td>
			</tr>
		</table>
		<br>
		<table class="div-button">
			<tr>
				<td width=550></td>
				<td><input type=button value="취소"
					onClick="window.location='e_02_review.jsp?from=0&cnt=15&page=1'"></td>
				<td><input type=submit value="쓰기"></td>
			</tr>
		</table>
		
		
</center>
	</div>
	</FORM>
			<%
stmt.close();
conn.close();
%>
</body>
</html>
