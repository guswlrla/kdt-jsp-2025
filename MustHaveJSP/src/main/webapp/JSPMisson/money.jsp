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
String price = request.getParameter("price");

int discountPrice = 0;
int count50000 = 0;
int count10000 = 0;
int count5000 = 0;
int count1000 = 0;

if(price != null) {
	int intPrice = Integer.parseInt(price);
	int discount = intPrice % 100; // 다시해
	discountPrice = intPrice - discount;
	
	count50000 = discountPrice / 50000; // 오만원권
	count10000 = (discountPrice % 50000) / 10000; // 일만원권
	count5000 = (discountPrice % 10000) / 5000; // 오천원권
	count1000 = (discountPrice % 5000) / 1000; // 천원권
}

%>
	<form>
		<div style="border: 1px solid gray; padding: 5px; display: inline-block;">
			지불금액 : <input type="text" name="price" value="<%= price == null ? "" : price %>" placeholder="숫자를 입력하세요."/><br/>
			할인금액 : <input type="text" name="discountPrice" value="<%= discountPrice %>" readonly/><br/>
			오만원권 : <input type="text" value="<%= count50000 %>" readonly/><br/>
			일만원권 : <input type="text" value="<%= count10000 %>" readonly/><br/>
			오천원권 : <input type="text" value="<%= count5000 %>" readonly/><br/>
			일천원권 : <input type="text" value="<%= count1000 %>" readonly/><br/>
			<input type="submit" value="실행" style="width: 100%; margin-top: 5px;"/>
		</div>
	</form>
</body>
</html>