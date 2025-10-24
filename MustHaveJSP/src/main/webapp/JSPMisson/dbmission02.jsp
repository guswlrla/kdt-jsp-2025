<%@ page import="common.MyUtil" %>
<%@ page import="common.JDBConnect2" %>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>dbmission02</title>
<link rel="stylesheet" href="css/style.css">
</head>
<body>
	<div id="body-align">
	<%
	// 1. 인구 수를 입력 받아서 그보다 많은 인구를 가진 도시를 검색해서 출력하세요.(City)
	/*
	String strPopulation = request.getParameter("population");
	if (strPopulation == null) {
		response.sendRedirect("./dbmission02.jsp?population=1000000");
		return;
	}
	int population = Integer.parseInt(strPopulation);
	*/
	
	// 2. 국가코드의 일부를 입력 받아서 해당 국가의 국가코드, 도시명, 도시인구수를 검색해서 출력하세요.(City)
	/*
	String countryCode = request.getParameter("code");
	if(countryCode == null) {
		countryCode = "kor";
	}
	*/
	
	// 3. 국가 명의 일부를 입력 받아서 국가명, 도시명, 도시인구수를 검색해서 출력하세요. (City, Country Join)
	String country = request.getParameter("country");
	if(country == null) {
		country = "kore";
	}
	
	JDBConnect2 jdbc = new JDBConnect2();
	try{
		String sql1 = "select * from city where population > ?";
		String sql2 = "select countryCode, District, population from city where countrycode like ?";
		String sql3 = "select c2.name as 'country_name', c1.name as 'city_name', c1.Population from city c1 join country c2 on c1.CountryCode = c2.Code where c2.name like ?";
		jdbc.psmt = jdbc.con.prepareStatement(sql3);
		// jdbc.psmt.setInt(1, population);
		// jdbc.psmt.setString(1, "%"+countryCode+"%");
		jdbc.psmt.setString(1, "%"+country+"%");
		
		MyUtil.writeSQL(out, jdbc.psmt);
		
		jdbc.rs = jdbc.psmt.executeQuery();
		
		MyUtil.writeTableFromResultSet(out, jdbc.rs);
	} catch(Exception e) {
		out.println("Error:" + e.getMessage());
	} finally {
		jdbc.close();
	}
	%>
	</div>
</body>
</html>