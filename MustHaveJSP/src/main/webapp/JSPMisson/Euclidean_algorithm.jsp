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

if(num1 != null && num2 != null) {
	int n1 = Integer.parseInt(num1);
	int n2 = Integer.parseInt(num2);
	
	int min = Math.min(n1, n2);
	int max = Math.max(n1, n2);
	int rem = max % min;
	
	while(true) {
		
	}
	if(rem == 0) {
		int gdc = min;
		int lcm = (n1 * n2) / gdc;
	}
	else {
		max = min;
		min = rem;
	}
}

%>

	<form>
		<div>
			숫자1 : <input type="text" name="num1" /><br/>
			숫자2 : <input type="text" name="num2"/><br/>
			최대공약수 : <input type="text" name="LCM" value="<%=  %>" readonly/><br/>
			최대공배수 : <input type="text" name="GCD" value="<%=  %>" readonly/><br/>
			<input type="submit" value="실행"/>
		</div>
	</form>
</body>
</html>