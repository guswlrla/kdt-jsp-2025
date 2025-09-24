<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>webAdder</title>
</head>
<body>
<%
int default1 = 10;
int default2 = 20;
String n1 = request.getParameter("num1");    
String n2 = request.getParameter("num2");    

if(n1 != null && n2 != null) {
	default1 = Integer.parseInt(n1);
	default2 = Integer.parseInt(n2);
}

int sum = default1 + default2;
%>
	<form method="POST">
		num1 : <input type="text" name="num1" value="<%= default1 %>" /><br/>
		num2 : <input type="text" name="num2" value="<%= default2 %>" /><br/>
		sum : <input type="text" name="sum" value="<%= sum %>" readonly/><br/>
		<input type="submit" value="계산하기" />
	</form>
</html>
</body>