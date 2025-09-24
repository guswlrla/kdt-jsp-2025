<%@page import="java.io.IOException"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>구구단 Type3 (JSP)</title>
</head>
<body>
<%
int val = 2;
try {
	out.println("<h2>" + val + "단</h2>");
	for(int j = 1; j <= 9; j++) {
		out.println(val + " * " + j + " = " + val * j);
		out.println("<br/>");
	}
	if(val >= 2 && val <= 9) {
		val = Integer.parseInt("val");
	}
	
} catch (Exception e) {
	out.println("잘못된 값을 입력하셨습니다. (2부터 9까지 입력)");
}
%>

</body>
</html>