package fileupload;

import java.util.List;
import java.util.Vector;

import common.JDBConnect;

public class MyFileDAO extends JDBConnect {
	public int insertFile(MyFileDTO dto) {
		int applyResult = 0;
		try {
			String query = "insert into myfile (title, cate, ofile, sfile) values (?, ?, ?, ?)";
			
			psmt = con.prepareStatement(query);
			psmt.setString(1, dto.getTitle());
			psmt.setString(2, dto.getCate());
			psmt.setString(3, dto.getOfile());
			psmt.setString(4, dto.getSfile());
			
			applyResult = psmt.executeUpdate();
		} catch(Exception e) {
			System.out.println("insert 중 예외 발생");
			e.printStackTrace();
		}
		return applyResult;
	}
	
	// 파일 목록을 반환
	public List<MyFileDTO> myFileList() {
		List<MyFileDTO> fileList = new Vector<>();
		
		// 쿼리문 작성
		String query = "select * from myfile order by idx desc";
		try {
			stmt = con.createStatement();
			rs = stmt.executeQuery(query);
			
			while(rs.next()) { // 목록 안의 파일 수만큼 반복
				// DTO에 저장
				MyFileDTO dto = new MyFileDTO();
				dto.setIdx(rs.getString(1));
				dto.setTitle(rs.getString(2));
				dto.setCate(rs.getString(3));
				dto.setOfile(rs.getString(4));
				dto.setSfile(rs.getString(5));
				dto.setPostdate(rs.getString(6));
				
				fileList.add(dto); // 목록에 추가
			}
		} catch(Exception e) {
			System.out.println("select 시 예외 발생");
			e.printStackTrace();
		}
		return fileList;
	}
}
