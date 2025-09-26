<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<style>
		table {
			border: 1px solid;
			border-collapse: collapse;
		}

		td, tr {
			border: 1px solid;
			padding: 4px 10px;
		}

		.title {
			text-align: center;
			background-color: lightgray;
		}
	</style>
<meta charset="UTF-8">
<title>구구단 Type2 (JSP)</title>
</head>
<body>
	<table>
		<tr class="title">
			<% for(int i = 2; i <= 9; i++) {%>
			<td><%= i %>단</td>
			<%} %>
		</tr>
		
		<tr>
			<% for(int j = 1; j <= 9; j++) { %>
				<% for(int i = 2; i <= 9; i++) { %>
					<td><%= i %> * <%= j %> = <%= i * j %></td>
				<% } %>
		</tr>
			<% } %>
	</table>
</body>
</html>