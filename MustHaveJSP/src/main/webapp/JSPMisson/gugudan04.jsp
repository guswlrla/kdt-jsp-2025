<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>구구단 Type4 (JSP)</title>
</head>
<body>
<table>
<%
int col = 3;
try{
	String param = request.getParameter("val");
	if(param != null) {
		col = Integer.parseInt(param);
		if(col < 1 || col > 8) {
			throw new Exception();
		}
	}
} catch(Exception e) {
	out.print("잘못된 값을 입력하셨습니다. (최대 8개)");
	return;
}

if(col >= 1 && col <= 8) {
for (int start = 2; start <= 9; start += col) {
	int end = Math.min(start+col-1, 9);
%>
	<tr>
		<% for(int i = start; i <= end; i++) { %>
		<td><h2><%= i %>단</h2></td>
		<% } %>
	</tr>
	<tr>
		<% for(int j = 1; j <= 9; j++) { %>
			<% for(int i = start; i <= end; i++) { %>
			<td style="padding-right: 80px"><%= i %> * <%= j %> = <%= i*j %></td>
			<% } %>
	</tr>
		<% } %>
<% } %>
<% } else { out.println(""); } %>

</table>
</body>
</html>