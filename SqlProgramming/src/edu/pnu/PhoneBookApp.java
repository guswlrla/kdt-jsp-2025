package edu.pnu;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.ResultSetMetaData;
import java.sql.Statement;
import java.util.Scanner;

public class PhoneBookApp {
	private static Scanner sc = new Scanner(System.in);
	private static String url = "jdbc:mysql://localhost:3306/myfirstdb";

	private static void insertPhonebook(Connection con) throws Exception {
		System.out.print("삽입할 이름을 입력하세요. : ");
		String name = sc.next();
		System.out.print("삽입할 휴대폰 번호를 입력하세요. : ");
		String mobile = sc.next();
		System.out.print("삽입할 집 전화번호를 입력하세요. : ");
		String home = sc.next();
		System.out.print("삽입할 회사명을 입력하세요. : ");
		String company = sc.next();
		System.out.print("삽입할 이메일을 입력하세요. : ");
		String email = sc.next();
		
		String sql = "insert into phonebook(name, mobile, home, company, email) values(?, ?, ?, ?, ?)";
		PreparedStatement psmt = con.prepareStatement(sql);
		
		psmt.setString(1, name);
		psmt.setString(2, mobile);
		psmt.setString(3, home);
		psmt.setString(4, company);
		psmt.setString(5, email);

		psmt.executeUpdate();
	}

	private static void updatePhonebook(Connection con) throws Exception {
		System.out.print("수정할 id를 숫자로 입력하세요. : ");
		int id = sc.nextInt();
		sc.nextLine();
		
		System.out.print("수정할 컬럼을 입력하세요. : ");
		String col = sc.next();
		if(!col.matches("name|mobile|home|company|email")) {
			System.out.println("잘못된 컬럼을 입력하셨습니다.");
			return;
		}
		
		System.out.print("새로운 값을 입력하세요. : ");
		String val = sc.next();
		
		String sql = "update phonebook set " + col + "=? where id=?";
		PreparedStatement psmt = con.prepareStatement(sql);
		
		psmt.setString(1, val);
		psmt.setInt(2, id);
		
		psmt.executeUpdate();
	}

	private static void deletePhonebook(Connection con) throws Exception {
		System.out.print("삭제할 id를 숫자로 입력하세요. : ");
		int id = sc.nextInt();
		
		String sql = "delete from phonebook where id=?";
		PreparedStatement psmt = con.prepareStatement(sql);
		
		psmt.setInt(1, id);
		
		psmt.executeUpdate();
	}

	private static void selectAllPhonebook(Connection con) throws Exception {
		String sql = "select * from phonebook";
		PreparedStatement psmt = con.prepareStatement(sql);
		ResultSet rs = psmt.executeQuery();
		
		String[] cols = {"name", "mobile", "home", "company", "email"};
		while(rs.next()) {
			for(String col : cols) {
				System.out.print(rs.getString(col) + " ");
			}
			System.out.println();
		}
		rs.close();
	}

	private static void nativeQuery(Connection con) throws Exception {
		sc.nextLine();
		System.out.println("sql : ");
		String sql = sc.nextLine();
		String pre = sql.substring(0, 6).toLowerCase();
		Statement stmt = con.createStatement();
		if(!pre.startsWith("select")) {
			int cnt = stmt.executeUpdate(sql);
			if(pre.startsWith("insert")) System.out.println(cnt + "건이 입력되었습니다.");
			else if(pre.startsWith("update")) System.out.println(cnt + "건이 수정되었습니다.");
			else if(pre.startsWith("delete")) System.out.println(cnt + "건이 삭제되었습니다.");
			return;
		}
		ResultSet rs = stmt.executeQuery(sql);
		ResultSetMetaData meta = rs.getMetaData();
		while (rs.next()) {
			for (int i = 1; i <= meta.getColumnCount(); i++) {
				if (i != 1) {
					System.out.print(", ");
				}
				System.out.print(rs.getString(i));
			}
			System.out.println();
		}
	}

	public static void main(String[] args) throws Exception {
		Connection con = DriverManager.getConnection(url, "scott", "tiger");
		boolean flag = true;
		while (flag) {
			System.out.print("[I]nsert/[U]pdate/[D]elete/[S]elect/[N]ative/[Q]uit : ");
			char c = sc.next().toUpperCase().charAt(0);

			switch (c) {
			case 'I':
				insertPhonebook(con);
				break;
			case 'U':
				updatePhonebook(con);
				break;
			case 'D':
				deletePhonebook(con);
				break;
			case 'S':
				selectAllPhonebook(con);
				break;
			case 'N':
				nativeQuery(con);
				break;
			case 'Q':
				flag = false;
				break;
			}
		}
		System.out.println("Bye~");
	}

}
