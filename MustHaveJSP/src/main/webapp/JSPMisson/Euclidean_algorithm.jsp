<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>유클리드 호제법</title>
</head>
<body>
<%
String num1 = request.getParameter("num1");
String num2 = request.getParameter("num2");

int gcd = 0;
int lcm = 0;

if(num1 != null && num2 != null) {
		int n1 = Integer.parseInt(num1);
		int n2 = Integer.parseInt(num2);
		
		int min = Math.min(n1, n2);
		int max = Math.max(n1, n2);
	while(true) {
		int rem = max % min;
	
		if(rem == 0) {
			gcd = min;
			lcm = (n1 * n2) / gcd;
			break;
		}
		else {
			max = min;
			min = rem;
			continue;
		}
	}
}
else {
	num1 = "";
	num2 = "";
}
%>
	<form>
		<div style="border: 1px solid gray; padding: 5px; display: inline-block;">
			숫자1 : <input type="text" name="num1" value="<%= num1 %>" placeholder="숫자를 입력하세요." style="float: right;"/><br/>
			숫자2 : <input type="text" name="num2" value="<%= num2 %>" placeholder="숫자를 입력하세요." style="float: right;"/><br/>
			최대공약수 : <input type="text" name="GCD" value="<%= gcd %>" readonly/><br/>
			최대공배수 : <input type="text" name="LCM" value="<%= lcm %>" readonly/><br/>
			<input type="submit" value="실행" style="width: 100%; margin-top: 5px;"/>
		</div>
	</form>
</body>
</html>