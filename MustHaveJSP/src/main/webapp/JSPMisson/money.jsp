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
String disMoney = request.getParameter(money);

int count50000 = 0;
int count10000 = 0;
int count5000 = 0;
int count1000 = 0;

if(money != null) {
	int dm = Integer.parseInt(disMoney);
	
	count50000 = dm / 50000; // 오만원권
	count10000 = (dm % 50000) / 10000; // 일만원권
	count5000 = (dm % 10000) / 5000; // 오천원권
	count1000 = (dm % 5000) / 1000; // 천원권
}
else {
	money = "";
	disMoney = "";
}

%>
	<form>
		<div style="border: 1px solid gray; padding: 5px; display: inline-block;">
			지불금액 : <input type="text" name="money" value="<%= money %>" placeholder="숫자를 입력하세요."/><br/>
			할인금액 : <input type="text" name="discount" value="<%= disMoney %>" readonly/><br/>
			오만원권 : <input type="text" value="<%= count50000 %>" readonly/><br/>
			일만원권 : <input type="text" value="<%= count10000 %>" readonly/><br/>
			오천원권 : <input type="text" value="<%= count5000 %>" readonly/><br/>
			일천원권 : <input type="text" value="<%= count1000 %>" readonly/><br/>
			<input type="submit" value="실행" style="width: 100%; margin-top: 5px;"/>
		</div>
	</form>
</body>
</html>