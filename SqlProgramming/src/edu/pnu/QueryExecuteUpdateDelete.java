package edu.pnu;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

public class QueryExecuteUpdateDelete {
	public static void main(String[] args) throws Exception {
		Connection con = null;
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			con = DriverManager.getConnection("jdbc:mysql://localhost:3306/myfirstdb", "scott", "tiger");
			
			int id = 1;
			
			String sql = "delete from phonebook where id=?";
			PreparedStatement psmt = con.prepareStatement(sql);
			
			psmt.setInt(1, id);
			
			psmt.executeUpdate();
		} catch(Exception e) {
			System.out.println("연결 실패 : " + e.getMessage());
		} finally {
			try {
				if (con != null) con.close();
			} catch(Exception e) {
				System.out.println("오류 : " + e.getMessage());
			}
		}
	}
}
