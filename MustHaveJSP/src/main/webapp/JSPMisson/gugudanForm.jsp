<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>구구단 Type5 (JSP)</title>
</head>
<body>
	<form method=GET>
		<input type="radio" name="sel" checked="checked"/>Type1 : 세로<br/>
		<input type="radio" name="sel" />Type2 : 가로<br/>
		<input type="radio" name="sel" />Type3 : 하나만 출력<br/>
		<input type="radio" name="sel"/>Type4 : 여러개씩 묶어서 출력<br/>
		<input type="text" name="val" />단수/열수<br/>
		<input type="submit" value="선택"/>
	</form>
	<%
	
	%>
</body>
</html>