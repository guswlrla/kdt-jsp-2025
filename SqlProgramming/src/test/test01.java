package test;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

class CountryDTO {
	String code;
	String name;
	int population;
	
	public String toString() {
		return code + "|" + name + "|" + population; 
	}
}

public class test01 {
	public static void main(String[] args) throws Exception {
		// Driver Loading
		Class.forName("com.mysql.cj.jdbc.Driver");
		
		// Connection
		Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/world", "musthave", "tiger");
		
		// 질의 객체
		Statement st = con.createStatement();
		
		// 질의 실행
		ResultSet rs = st.executeQuery("select code,name, population from country limit 10");
		
		List<CountryDTO> list = new ArrayList<>();
		// 커서 프로세싱
		while(rs.next()) {
			CountryDTO dto = new CountryDTO();
			dto.code = rs.getString(1);
			dto.name = rs.getString(2);
			dto.population = rs.getInt(3);
			list.add(dto);
		}
		
		for (CountryDTO c : list) {
			System.out.println(c);
		}
		
		// 자원 해제
		rs.close();
		st.close();
		con.close();
	}
}
