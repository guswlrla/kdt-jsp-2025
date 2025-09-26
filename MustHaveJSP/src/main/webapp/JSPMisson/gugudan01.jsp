<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>구구단 Type1 (JSP)</title>
</head>
<body>
	<table>
		<% for(int i = 2; i <= 9; i++) { %>
		<h2><%= i %>단</h2>
		<% for(int j = 1; j <= 9; j++) { %>
			<p><%= i %> * <%= j %> = <%= i * j %></p>
		<% } 
		} %>
		
		<!-- 자바 코드로 표현 -->
		<%
		// for(int i = 2; i <= 9; i++) {
		// out.println("<h2>" + i + "단</h2>");
		// for(int j = 1; j <= 9; j++) {
		// out.println(i + " * " + j + " = " + i * j);
		// out.println("<br/>");
		// }
		// out.println("<br />");
		// }
		%>
	</table>
</body>
</html>