package edu.pnu;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.ResultSetMetaData;
import java.util.Scanner;

public class QueryPreparedStatement {
	static Scanner sc = new Scanner(System.in);

	public static void main(String[] args) {
		Connection con = null;
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			con = DriverManager.getConnection("jdbc:mysql://localhost:3306/world", "musthave", "tiger");
			 method1(con);
			 method2(con);
			 method2_1(con);
			 method2_2(con);
			 method3(con);
			 method4(con);
			 method5(con);
			 method6(con);
			 method7(con);

		} catch (Exception e) {
			System.out.println("연결 실패 : " + e.getMessage());
		} finally {
			try {
				if (con != null)
					con.close();
			} catch (Exception e) {
				System.out.println("오류 : " + e.getMessage());
			}
		}
	}

	private static void printQuery(ResultSet rs) throws Exception {
		ResultSetMetaData meta = rs.getMetaData();
		int fields = meta.getColumnCount();

		while (rs.next()) {
			for (int i = 1; i <= fields; i++) {
				if (i != 1) {
					System.out.print(", ");
				}
				System.out.print(rs.getString(i));
			}
			System.out.println();
		}
		rs.close();
	}

	// 1. 인구 수를 입력 받아서 그보다 많은 인구를 가진 도시를 출력
	private static void method1(Connection con) throws Exception {
		System.out.print("population : ");
		int population = sc.nextInt();

		PreparedStatement psmt = con.prepareStatement("select * from city where population > ?");
		psmt.setInt(1, population);

		ResultSet rs = psmt.executeQuery();
		printQuery(rs);
	}

	// 2. 국가 코드를 입력 받아서 해당 국가의 도시의 이름과 인구를 출력
	private static void method2(Connection con) throws Exception {
		System.out.print("country code : ");
		String countryCode = sc.next();

		PreparedStatement psmt = con.prepareStatement("select name, population from city where countrycode = ?");
		psmt.setString(1, countryCode);

		ResultSet rs = psmt.executeQuery();
		printQuery(rs);
	}

	// 2-1. 국가 명의 일부를 입력 받아서 해당 국가의 도시의 이름과 인구를 출력
	private static void method2_1(Connection con) throws Exception {
		System.out.print("country name : ");
		String countryName = sc.next();

		PreparedStatement psmt = con.prepareStatement(
				"select city.name, city.population, country.name from city inner join country on country.code = city.countrycode where country.name like ?");
		psmt.setString(1, "%" + countryName + "%");

		ResultSet rs = psmt.executeQuery();
		printQuery(rs);
	}

	// 2-2. 국가 코드 또는 국가 명의 일부를 입력 받아서 해당 국가의 도시명과 인구 출력
	private static void method2_2(Connection con) throws Exception {
		System.out.print("country name or code : ");
		String country = sc.next();

		if (country.length() == 3) { // 국가 코드로 받을 경우
			PreparedStatement psmt = con.prepareStatement(
					"select city.name, city.population from city inner join country on country.code = city.countrycode where Country.code = ?");
			psmt.setString(1, country);
			ResultSet rs = psmt.executeQuery();
			printQuery(rs);
		} else { // 국가명으로 받을 경우
			PreparedStatement psmt = con.prepareStatement(
					"select city.name, city.population from city inner join country on country.code = city.countrycode where country.name like ?");
			psmt.setString(1, "%" + country + "%");
			ResultSet rs = psmt.executeQuery();
			printQuery(rs);
		}
	}

	// 3. 대륙을 입력 받아서 해당 대륙에 위치한 국가를 출력
	private static void method3(Connection con) throws Exception {
		System.out.print("continent : ");
		String continent = sc.next();

		PreparedStatement psmt = con.prepareStatement("select name, population from country where continent = ?");
		psmt.setString(1, continent);
		
		ResultSet rs = psmt.executeQuery();
		printQuery(rs);
	}

	// 4. 넓이를 입력 받아서 입력 값보다 작은 면적을 가진 국가의 이름과 면적을 출력
	private static void method4(Connection con) throws Exception {
		System.out.print("surface area : ");
		Double area = sc.nextDouble();

		PreparedStatement psmt = con.prepareStatement("select name, surfaceArea from country where surfaceArea < ?");
		psmt.setDouble(1, area);

		ResultSet rs = psmt.executeQuery();
		printQuery(rs);
	}

	// 5. 대한민국의 District를 입력 받아서 해당 지역에 있는 모든 도시를 출력
	private static void method5(Connection con) throws Exception {
		System.out.print("District of KOR : ");
		String area = sc.next();

		PreparedStatement psmt = con.prepareStatement("select name from city where district = ?");
		psmt.setString(1, area);
		
		ResultSet rs = psmt.executeQuery();
		printQuery(rs);
	}

	// 6. 언어를 입력 받아서 해당 언어가 국가 공식 언어인 국가명을 출력
	private static void method6(Connection con) throws Exception {
		System.out.print("language : ");
		String lang = sc.next();

		PreparedStatement psmt = con.prepareStatement("select country.name from country inner join countrylanguage on code = countrycode where language = ?");
		psmt.setString(1, lang);
		
		ResultSet rs = psmt.executeQuery();
		printQuery(rs);
	}

	// 7. CountryLanguage에서 사용자가 입력 비율 이상인 언어의 국가 코드와 비율을 출력
	private static void method7(Connection con) throws Exception {
		System.out.print("percentage : ");
		Float percentage = sc.nextFloat();

		PreparedStatement psmt = con.prepareStatement("select countrycode, Percentage from countrylanguage where percentage > ?");
		psmt.setFloat(1, percentage);
		
		ResultSet rs = psmt.executeQuery();
		printQuery(rs);
	}

}
