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
int dan = 2; // 디폴트로 2단
try {
	String param = request.getParameter("val"); // 먼저 스트링으로 파라미터를 받아줌
	if(param != null) { // 파라미터가 null이 아니면
		dan = Integer.parseInt(param); // 파라미터를 int로 변환
		if(dan < 2 || dan > 9) { // dan이 2보다 작거나 9보다 크면
			throw new Exception(); // 예외를 던짐
		}
	}
} catch (Exception e) { // 예외가 발생했을 때
	out.println("잘못된 값을 입력하셨습니다. (2부터 9까지 입력)"); // 출력
	return; // val을 비워도 디폴트 단은 출력되길래 return으로 종료
}
if(dan >= 2 && dan <= 9 ) { // 파라미터에 2~9 아닌 값을 넣어도 출력은 되길래 조건문 걸었음
	out.println("<h2>" + dan + "단" + "</h2>");
	for(int i = 1; i <= 9; i++) {
		out.println(dan + " * " + i + " = " + dan * i + "<br>");
	}
}
else { // 조건에 성립안되면 예외 출력문만 보이게
	out.println("");
}
%>
</body>
</html>