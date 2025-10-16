package edu.pnu;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

public class QueryExecuteUpdateUpdate {
	public static void main(String[] args) throws Exception {
		Connection con = null;
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			con = DriverManager.getConnection("jdbc:mysql://localhost:3306/myfirstdb", "scott", "tiger");
			
			String mobile = "010-1111-9999";
			int id = 2;
			
			String sql = "update phonebook set mobile=? where id=?";
			PreparedStatement psmt = con.prepareStatement(sql);
			
			psmt.setString(1, mobile);
			psmt.setInt(2, id);
			
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
