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
		<input type="radio" name="sel" value="type1" checked="checked"/>Type1 : 세로<br/>
		<input type="radio" name="sel" value="type2"/>Type2 : 가로<br/>
		<input type="radio" name="sel" value="type3"/>Type3 : 하나만 출력<br/>
		<input type="radio" name="sel" value="type4"/>Type4 : 여러개씩 묶어서 출력<br/>
		<input type="text" name="val" value="2" />단수/열수<br/>
		<input type="submit" value="선택"/>
	</form>
	<%
	String sel = request.getParameter("sel");
	String val = request.getParameter("val");
	System.out.println("sel : "+ sel);
	if(sel != null) {
		String url = "";
		if(sel.equals("type1"))
			url = "gugudan01.jsp";
		else if(sel.equals("type2"))
			url = "gugudan02.jsp";
		else if(sel.equals("type3"))
			url = "gugudan03.jsp?val=" + val;
		else
			url = "gugudan04.jsp?val=" + val;
		request.getRequestDispatcher(url).forward(request, response);
	}
	%>
</body>
</html>