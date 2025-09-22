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
try {
	int dan = Integer.parseInt(request.getParameter("val"));
	if(dan >= 2 && dan <= 9) {
		out.println("<h2>" + dan + "단</h2>");
		for(int j = 1; j <= 9; j++) {
			out.println(dan + " * " + j + " = " + dan * j);
			out.println("<br/>");
		}
		out.println("<br/>");
	}
	else {
		out.println("잘못된 값을 입력하셨습니다. (2부터 9까지 입력하세요.)");
	}
} catch (Exception e) {
	out.println("값을 입력하세요.");
}
%>

</body>
</html>