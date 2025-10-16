package edu.pnu;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.ResultSetMetaData;
import java.sql.Statement;
import java.util.Scanner;

public class QueryStatement {
	static Scanner sc = new Scanner(System.in);
	
	public static void main(String[] args) {
		Connection con = null;
		
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			con = DriverManager.getConnection("jdbc:mysql://localhost:3306/world", "musthave", "tiger");
			//method1(con);
			//method2(con);
			//method2_1(con);
			method2_2(con);
			//method3(con);
			//method4(con);
			//method5(con);
			//method6(con);
			//method7(con);
		} catch(Exception e) {
			System.out.println("연결 실패 : " + e.getMessage());
		} finally {
			try {
				if (con != null) con.close();
			} catch (Exception e) {
				System.out.println("오류 : " + e.getMessage());
			}
		}
	}

	// 메타데이터 출력하는 함수
	private static void printQuery(Connection con, String query) throws Exception {
		Statement stmt = con.createStatement();
		ResultSet rs = stmt.executeQuery(query);
		
		ResultSetMetaData meta = rs.getMetaData();
		int fields = meta.getColumnCount();
		
		while(rs.next()) {
			for(int i = 1; i <= fields; i++) {
				if(i != 1) {
					System.out.print(", ");
				}
				System.out.print(rs.getString(i));
			}
			System.out.println();
		}
		rs.close();
		stmt.close();
	}
	
	// 인구 수를 입력 받아서 그보다 많은 인구를 가진 도시를 출력
	private static void method1(Connection con) throws Exception {
		System.out.print("population : ");
		int population = sc.nextInt();
		
		String query = "select * from city where population > " + population;
		printQuery(con, query);
	}
	
	// 국가 코드를 입력 받아서 해당 국가의 도시의 이름과 인구를 출력
	private static void method2(Connection con) throws Exception {
		System.out.print("country code : ");
		String countryCode = sc.next();
		
		String query = "select name, population from city where countrycode = '" + countryCode + "'";
		printQuery(con, query);
	}
	
	// 국가 명의 일부를 입력 받아서 해당 국가의 도시의 이름과 인구를 출력
	private static void method2_1(Connection con) throws Exception {
		System.out.print("country name : ");
		String countryName = sc.next();
		
		String query = "select city.name, city.population, country.name from city inner join country on country.code = city.countrycode where country.name like '%" + countryName + "%'";
		printQuery(con, query);
	}
	
	// 국가 코드 또는 국가 명의 일부를 입력 받아서 해당 국가의 도시명과 인구 출력
	private static void method2_2(Connection con) throws Exception {
		System.out.print("country name or code : ");
		String country = sc.next();
		
		if(country.length() == 3) { // 국가 코드로 받을 경우(이 방법밖에 몰겟다)
			String query = "select city.name, city.population from city inner join country on country.code = city.countrycode where Country.code = '" + country + "'";
			printQuery(con, query);
		}
		else { // 국가명으로 받을 경우
			String query = "select city.name, city.population from city inner join country on country.code = city.countrycode where country.name like '%" + country + "%'";
			printQuery(con, query);
		}
	}
	
	// 대륙을 입력 받아서 해당 대륙에 위치한 국가를 출력
	private static void method3(Connection con) throws Exception {
		System.out.print("continent : ");
		String continent = sc.next();
		
		String query = "select name, population from country where continent = '" + continent + "'";
		printQuery(con, query);
	}
	
	// 넓이를 입력 받아서 입력 값보다 작은 면적을 가진 국가의 이름과 면적을 출력
	private static void method4(Connection con) throws Exception {
		System.out.print("surface area : ");
		Double area = sc.nextDouble();
		
		String query = "select name, surfaceArea from country where surfaceArea < " + area;
		printQuery(con, query);
	}
	
	// 대한민국의 District를 입력 받아서 해당 지역에 있는 모든 도시를 출력
	private static void method5(Connection con) throws Exception {
		System.out.print("District of KOR : ");
		String area = sc.next();
		
		String query = "select name from city where district = '" + area + "'";
		printQuery(con, query);
	}
	
	// 언어를 입력 받아서 해당 언어가 국가 공식 언어인 국가명을 출력
	private static void method6(Connection con) throws Exception {
		System.out.print("language : ");
		String lang = sc.next();
		
		String query = "select country.name from country inner join countrylanguage on code = countrycode where language = '" + lang + "'";
		printQuery(con, query);
	}
	
	// CountryLanguage에서 사용자가 입력 비율 이상인 언어의 국가 코드와 비율을 출력
	private static void method7(Connection con) throws Exception {
		System.out.print("percentage : ");
		Float percentage = sc.nextFloat();
		
		String query = "select countrycode, Percentage from countrylanguage where percentage > " + percentage;
		printQuery(con, query);
	}
}
