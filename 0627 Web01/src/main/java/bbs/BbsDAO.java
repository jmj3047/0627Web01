package bbs;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

// Data Access Object : 데이터에 접근하는 역할을 맡은 객체
public class BbsDAO {
	
	private Connection conn; // 자바와 DB 연결하는 객체
	private PreparedStatement pstmt; // 쿼리 준비
	private ResultSet rs; // 쿼리 실행 후 결과를 담을 객체
	
	public BbsDAO() {
		try {
			String dbURL = "jdbc:mysql://localhost:3306/JSP_TEST?serverTimezone=UTC";
				// jdbc : Java DataBase Connectivity
			String dbID = "root";
			String dbPW = "0000";
			
			Class.forName("com.mysql.cj.jdbc.Driver");
			// 데이터베이스 드라이버를 로드할 뿐, 연결에 대한 행동은 하지 않음
			conn = DriverManager.getConnection(dbURL, dbID, dbPW);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	//글쓰기화면에서 내용을 작성후에 글쓰기 버튼 누르면 실행될 함수
	//글 id, 글제목, 내용, 글쓴이, 글쓴시간, 삭제 여부를 db에 저장해야 함
	public int write(String bbsTitle, String userName, String bbsContent) {
		String SQL = "INSERT INTO BBS VALUES (?,?,?,?,?,?)";
		
		try {
			pstmt = conn.prepareStatement(SQL); // 문자열 쿼리 대입
			pstmt.setInt(1,getNext()); //getNext: 다음 번호를 리턴하는 함수를 만들어줌
			pstmt.setString(2,bbsTitle); //제목
			pstmt.setString(3,userName); //글쓴이
			pstmt.setString(4,getDate()); //getDate: 현재 시간 갖고오는 함수 만들어줌
			pstmt.setString(5,bbsContent);
			pstmt.setInt(6,1); //bbsAvailable 삭제 여부

			return pstmt.executeUpdate(); // 쿼리 실행 및 결과값 대입
			
			
		} catch (Exception e) {
			e.printStackTrace(); // 데이터베이스 오류
		}
		return -1; //데이터 베이스 오류
	}
	
	public int getNext() {
		
		return 0;
	}
	
	public String getDate() {
		return "0";
	}
	
	
	
}
