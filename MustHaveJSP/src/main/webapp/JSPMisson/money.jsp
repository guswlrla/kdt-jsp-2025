<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>최소 지폐 수 계산</title>
</head>
<body>
<%
String money = request.getParameter("money");

if(money != null) {
	int m = Integer.parseInt(money);
	
}

%>
	<form>
		<div style="border: 1px solid gray; padding: 5px; display: inline-block;">
			지불금액 : <input type="text" name="money" value="" placeholder="숫자를 입력하세요."/><br/>
			할인금액 : <input type="text" readonly/><br/>
			오만원권 : <input type="text" readonly/><br/>
			일만원권 : <input type="text" readonly/><br/>
			오천원권 : <input type="text" readonly/><br/>
			일천원권 : <input type="text" readonly/><br/>
			<input type="submit" value="실행" style="width: 100%; margin-top: 5px;"/>
		</div>
	</form>
</body>
</html>