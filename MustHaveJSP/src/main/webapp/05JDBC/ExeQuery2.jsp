<%@ page import="common.JDBConnect" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.PreparedStatement" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JDBC</title>
<style>
	table {
		border: 1px solid;
		border-collapse: collapse;
	}

	td, tr, th {
		border: 1px solid;
		padding: 4px 10px;
	}

	th {
		text-align: center;
		background-color: lightgray;
	}
</style>

</head>
<body>
	<h2>회원 목록 조회 테스트2(executeQuery() 사용)</h2>
	<%
	// DB에 연결
	JDBConnect jdbc = new JDBConnect();
	
	// 쿼리문 생성
	String sql = "select id, pass, name, regidate from member";
	jdbc.stmt = jdbc.con.createStatement();
	
	// 쿼리 수행
	jdbc.rs = jdbc.stmt.executeQuery(sql);
	out.println("<table>");
	out.println("<tr>");
	out.println("<th>id</th>");
	out.println("<th>pass</th>");
	out.println("<th>name</th>");
	out.println("<th>regidate</th>");
	out.println("</tr>");
	while(jdbc.rs.next()) {
		out.println("<tr>");
		out.println("<td>");
		out.println(jdbc.rs.getString("id"));
		out.println("</td>");
		out.println("<td>");
		out.println(jdbc.rs.getString("pass"));
		out.println("</td>");
		out.println("<td>");
		out.println(jdbc.rs.getString("name"));
		out.println("</td>");
		out.println("<td>");
		out.println(jdbc.rs.getString("regidate"));
		out.println("</td>");
		out.println("</tr>");
	}
	out.println("</table>");
	
	// 연결 닫기
	jdbc.close();
	%>
</body>
</html>