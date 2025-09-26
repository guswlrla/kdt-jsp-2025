<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>구구단 Type4 (JSP)</title>
</head>
<body>
<%
int val = 3;
for (int start = 2; start <= 9; start += val) {
	int end = Math.min(start+val-1, 9);
%>
<table>
	<tr>
		<% for(int i = 2; i <= val; i++) {%>
			<td><%= i %>단</td>
		<% } %>
	</tr>
	<tr>
		<% for(int j = 1; j <= 9; j++) { %>
			<% for(int i = start; i <= end; i++) { %>
			<td><%= i %> * <%= j %> = <%= i*j %></td>
			<% } %>
	</tr>
		<% } %>
<% } %>
</table>
</body>
</html>