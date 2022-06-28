package user;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

// Data Access Object : 데이터에 접근하는 역할을 맡은 객체
public class UserDAO {
	
	private Connection conn; // 자바와 DB 연결하는 객체
	private PreparedStatement pstmt; // 쿼리 준비
	private ResultSet rs; // 쿼리 실행 후 결과를 담을 객체
	
	public UserDAO() {
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
	
	// 로그인 기능 수행 함수
	//  : 로그인 화면에서 사용자가 아이디, 비번을 입력하고 로그인 버튼을 클릭하면 실행
	public int login(String userID, String userPW) {
		String SQL = "SELECT userPassword FROM TABLE_USER WHERE userID=?";
		// 실행할 쿼리 (사용자가 입력한 아이디에 해당하는 비밀번호 추출)
		
		try {
			pstmt = conn.prepareStatement(SQL); // 문자열 쿼리 대입
			pstmt.setString(1,userID); // 첫번째 '?' 자리에 userID 값 대입
				// 다른 언어와 달리, SQL 쿼리에서의 인덱스는 1부터 시작
			rs = pstmt.executeQuery(); // 쿼리 실행 및 결과값 대입
			if(rs.next()) { // 결과 리스트에서 다음 행 데이터가 있을 경우 실행
				if(rs.getString(1).equals(userPW)) {
					// 남은 행 중 첫번째 값이 login 함수를 호출할 때 전달받은 userPW인 경우
					return 1; // 로그인 성공
				} else {
					return 0; // 로그인 실패
				}
			}
			return -1; // 아이디가 없음
		} catch (Exception e) {
			e.printStackTrace(); // 데이터베이스 오류
		}
		return -2;
	}
	
	
	// 회원가입 기능 구현
	public int join(User user) {
		String SQL = "INSERT INTO TABLE_USER VALUES(?,?,?,?)";
		// 실행할 쿼리. 아이디, 비밀번호, 이름, 성별
		
		try {
			pstmt = conn.prepareStatement(SQL); // 문자열 쿼리를 pstmt에 대입
			pstmt.setString(1,user.getUserID()); 
			pstmt.setString(2,user.getUserPassword()); 
			pstmt.setString(3,user.getUserName()); 
			pstmt.setString(4,user.getUserGender()); 
				// 다른 언어와 달리, SQL 쿼리에서의 인덱스는 1부터 시작
			
			return pstmt.executeUpdate(); //정상이면 1
			
		} catch (Exception e) {
			e.printStackTrace(); // 중복 발생이나 어떤이유로 예외가 발생하면
		}
		return -1;	// 중복발생
		
	}
	
}
