<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>액션 태그 - UseBean</title>
</head>
<body>
	<jsp:useBean id="dto" class="membership.MemberDTO"/>
	<jsp:setProperty property="*" name="dto"/>
	<ul>
		<li>id : <jsp:getProperty name="dto" property="id" />
		<li>password : <jsp:getProperty name="dto" property="pass" />
		<li>이름 : <jsp:getProperty name="dto" property="name" />
		<li>등록일 : <jsp:getProperty name="dto" property="regidate" />
	</ul>
</body>
</html>