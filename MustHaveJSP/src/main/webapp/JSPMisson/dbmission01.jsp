<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>dbmission01</title>
<link rel="stylesheet" href="css/style.css">
</head>
<body>
	<div>
	<%
	Connection con = null;
	PreparedStatement psmt = null;
	ResultSet rs = null;
	
	try{
		Class.forName("com.mysql.cj.jdbc.Driver");
		
		String url = "jdbc:mysql://localhost:3306/world";
		String id = "musthave";
		String pw = "tiger";
		
		con = DriverManager.getConnection(url, id, pw);
		
		// 1. 인구 수를 입력 받아서 그보다 많은 인구를 가진 도시를 검색해서 출력하세요.(City)
		/*
		int population = 1000000;
		String spopulation = request.getParameter("population");
		if(spopulation != null) {
			population = Integer.parseInt(spopulation);
		}
		
		psmt = con.prepareStatement("select * from city where population > ?");
		psmt.setInt(1, population);
		rs = psmt.executeQuery();
		
		out.println("<table>");
		out.println("<tr>");
		out.println("<th>id</th>");
		out.println("<th>name</th>");
		out.println("<th>countryCode</th>");
		out.println("<th>district</th>");
		out.println("<th>population</th>");
		out.println("</tr>");
		while(rs.next()) {
			out.println("<tr>");
			out.println("<td>");
			out.println(rs.getString("id"));
			out.println("</td>");
			out.println("<td>");
			out.println(rs.getString("name"));
			out.println("</td>");
			out.println("<td>");
			out.println(rs.getString("countryCode"));
			out.println("</td>");
			out.println("<td>");
			out.println(rs.getString("district"));
			out.println("</td>");
			out.println("<td>");
			out.println(rs.getString("population"));
			out.println("</td>");
			out.println("</tr>");
		}
		out.println("</table>");
		*/
		
		// 2. 국가코드의 일부를 입력 받아서 해당 국가의 국가코드, 도시명, 도시인구수를 검색해서 출력하세요.(City)
		/*
		String countryCode = request.getParameter("code");
		if(countryCode == null) {
			countryCode = "kor";
		}
		
		psmt = con.prepareStatement("select countryCode, District, population from city where countrycode like ?");
		psmt.setString(1, "%" + countryCode + "%");
		rs = psmt.executeQuery();
		
		out.println("<table>");
		out.println("<tr>");
		out.println("<th>countryCode</th>");
		out.println("<th>District</th>");
		out.println("<th>population</th>");
		out.println("</tr>");
		while(rs.next()) {
			out.println("<tr>");
			out.println("<td>");
			out.println(rs.getString("countryCode"));
			out.println("</td>");
			out.println("<td>");
			out.println(rs.getString("District"));
			out.println("</td>");
			out.println("<td>");
			out.println(rs.getString("population"));
			out.println("</td>");
			out.println("</tr>");
		}
		out.println("</table>");
		*/
		
		// 3. 국가 명의 일부를 입력 받아서 국가명, 도시명, 도시인구수를 검색해서 출력하세요. (City, Country Join)
		/*
		String country = request.getParameter("country");
		if(country == null) {
			country = "kor";
		}
		
		psmt = con.prepareStatement("select c2.name as 'country_name', c1.name as 'city_name', c1.Population from city c1 join country c2 on c1.CountryCode = c2.Code where c2.name like ?");
		psmt.setString(1, "%" + country + "%");
		rs = psmt.executeQuery();
		
		out.println("<table>");
		out.println("<tr>");
		out.println("<th>국가명</th>");
		out.println("<th>도시명</th>");
		out.println("<th>도시인구수</th>");
		out.println("</tr>");
		while(rs.next()) {
			out.println("<tr>");
			out.println("<td>");
			out.println(rs.getString("country_name"));
			out.println("</td>");
			out.println("<td>");
			out.println(rs.getString("city_name"));
			out.println("</td>");
			out.println("<td>");
			out.println(rs.getString("population"));
			out.println("</td>");
			out.println("</tr>");
		}
		out.println("</table>");
		*/
		
		// 4. 대륙을 입력 받아서 해당 대륙에 위치한 국가를 검색해서 출력하세요. (Country.Continent)
		/*
		String continent = request.getParameter("continent");
		if(continent == null) {
			continent = "asia";
		}
		
		psmt = con.prepareStatement("select name, continent from country where Continent = ?");
		psmt.setString(1, continent);
		rs = psmt.executeQuery();
		
		out.println("<table>");
		out.println("<tr>");
		out.println("<th>name</th>");
		out.println("<th>continent</th>");
		out.println("</tr>");
		while(rs.next()) {
			out.println("<tr>");
			out.println("<td>");
			out.println(rs.getString("name"));
			out.println("</td>");
			out.println("<td>");
			out.println(rs.getString("continent"));
			out.println("</td>");
			out.println("</tr>");
		}
		out.println("</table>");
		*/
		
		// 5. 넓이(10,0002 km)를 입력 받아서 입력 값보다 작은 면적을 가진 국가의 이름과 면적을 면적 오름차순으로 검색해서 출력하세요.(Country.SurfaceArea)
		/*
		int surface = 0;
		String strSurface = request.getParameter("surface");
		if(strSurface != null) {
			surface = Integer.parseInt(strSurface);
		}
		
		psmt = con.prepareStatement("select name, SurfaceArea from country where SurfaceArea < ? order by SurfaceArea");
		psmt.setInt(1, surface);
		rs = psmt.executeQuery();
		
		out.println("<table>");
		out.println("<tr>");
		out.println("<th>name</th>");
		out.println("<th>SurfaceArea</th>");
		out.println("</tr>");
		while(rs.next()) {
			out.println("<tr>");
			out.println("<td>");
			out.println(rs.getString("name"));
			out.println("</td>");
			out.println("<td>");
			out.println(rs.getString("SurfaceArea"));
			out.println("</td>");
			out.println("</tr>");
		}
		out.println("</table>");
		*/
		
		// 6. 대한민국의 District를 입력 받아서 해당 지역에 있는 모든 도시를 검색해서 출력하세요. (예:'Kyonggi', City)
		/*
		String district = request.getParameter("district");
		if(district == null) {
			district = "kyonggi";
		}
		
		psmt = con.prepareStatement("select name, District from city where District = ?");
		psmt.setString(1, district);
		rs = psmt.executeQuery();
		
		out.println("<table>");
		out.println("<tr>");
		out.println("<th>name</th>");
		out.println("<th>District</th>");
		out.println("</tr>");
		while(rs.next()) {
			out.println("<tr>");
			out.println("<td>");
			out.println(rs.getString("name"));
			out.println("</td>");
			out.println("<td>");
			out.println(rs.getString("District"));
			out.println("</td>");
			out.println("</tr>");
		}
		out.println("</table>");
		*/
		
		// 7. 언어를 입력 받아서 해당 언어가 국가 공식 언어인 국가코드를 출력하세요. (예:'Spanish', CountryLanguage)
		/*
		String lang = request.getParameter("lang");
		if(lang == null) {
			// 파라미터값이 null이면 기본값을 설정해서 redirect한다. (파라미터 기본값을 주소창 위에 보여주게 함)
			response.sendRedirect("./dbmission01.jsp?lang=spanish");
			return;
		}
		
		psmt = con.prepareStatement("select countryCode, language from CountryLanguage where language = ?");
		psmt.setString(1, lang);
		rs = psmt.executeQuery();
		
		out.println("<table>");
		out.println("<tr>");
		out.println("<th>countryCode</th>");
		out.println("<th>language</th>");
		out.println("</tr>");
		while(rs.next()) {
			out.println("<tr>");
			out.println("<td>");
			out.println(rs.getString("countryCode"));
			out.println("</td>");
			out.println("<td>");
			out.println(rs.getString("language"));
			out.println("</td>");
			out.println("</tr>");
		}
		out.println("</table>");
		*/
		
		// 8. 언어를 입력 받아서 해당 언어가 국가 공식 언어인 국가명을 출력하세요. (Country,CountryLanguage Join)
		/*
		String lang = request.getParameter("lang");
		if(lang == null) {
			// 파라미터값이 null이면 기본값을 설정해서 redirect한다. (파라미터 기본값을 주소창 위에 보여주게 함)
			response.sendRedirect("./dbmission01.jsp?lang=spanish");
			return;
		}
		
		psmt = con.prepareStatement("select c.name as '국가명', cl.Language as '언어' from country c join countrylanguage cl on c.code = cl.CountryCode where Language = ?");
		psmt.setString(1, lang);
		rs = psmt.executeQuery();
		
		out.println("<table>");
		out.println("<tr>");
		out.println("<th>국가명</th>");
		out.println("<th>언어</th>");
		out.println("</tr>");
		while(rs.next()) {
			out.println("<tr>");
			out.println("<td>");
			out.println(rs.getString("국가명"));
			out.println("</td>");
			out.println("<td>");
			out.println(rs.getString("언어"));
			out.println("</td>");
			out.println("</tr>");
		}
		out.println("</table>");
		*/
		
		// 9. CountryLanguage에서 사용자가 입력 비율 이상인 언어의 국가 코드와 비율을 검색해서 출력하세요.
		String strPercent = request.getParameter("pecentage");
		if(strPercent == null) {
			response.sendRedirect("./dbmission01.jsp?pecentage=0");
			return;
		}
		float percent = Integer.parseInt(strPercent);
		
		psmt = con.prepareStatement("select CountryCode, Percentage from countrylanguage where Percentage >= ?");
		psmt.setFloat(1, percent);
		rs = psmt.executeQuery();
		
		out.println("<table>");
		out.println("<tr>");
		out.println("<th>CountryCode</th>");
		out.println("<th>Percentage</th>");
		out.println("</tr>");
		while(rs.next()) {
			out.println("<tr>");
			out.println("<td>");
			out.println(rs.getString("CountryCode"));
			out.println("</td>");
			out.println("<td>");
			out.println(rs.getString("Percentage"));
			out.println("</td>");
			out.println("</tr>");
		}
		out.println("</table>");

	} catch(Exception e) {
		e.printStackTrace();
	} finally {
		try {
			if(rs != null) rs.close();
			if(psmt != null) psmt.close();
			if(con != null) con.close();
			
			System.out.println("JDBC 자원 해제");
		} catch(Exception e) {
			e.printStackTrace();
		}
	}
	%>
	</div>
</body>
</html>