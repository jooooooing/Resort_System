<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<%@ page contentType="text/html; charset=utf-8"%>
<%@ page import="java.sql.*,javax.sql.*, java.io.*"%>

<html>
<head>
</head>
<body>
	<%
	Class.forName("com.mysql.cj.jdbc.Driver");

	Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/kopoctc", "root", "koposw31");
	String id = request.getParameter("key");
	String sql = "delete from resort_review where id= " + id + ";";
	
	PreparedStatement pstmt = conn.prepareStatement(sql);
	
	pstmt.executeUpdate();

	pstmt.close();
	conn.close();
	
	%>
	
	<script>
	alert("삭제완료");
	window.location.href="e_02_review.jsp?from=0&cnt=15&page=1"; //특정페이지로의 이동
	</script>
</body>
</html>