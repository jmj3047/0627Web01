package User;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

//Data Access Object = 데이터에 접근 하는 역할을 맡은 객체
//ctrl shift o: 자동 import  	
//alt shift s: source
public class UserDAO {
	
	private Connection conn; //자바랑 db랑 연결하는 객체
	private PreparedStatement pstmt; 	//쿼리 준비
	private ResultSet rs;	//결과를 담은 객체
	
	//생성자
	public UserDAO() {
		try {
			String dbURL = "jdbc:mysql://localhost:3306/JSP_TEST?serverTimzone=UTC";
			//Java Data Base Connectivity
			String dbId = "root";
			String dbPassword = "0000";
			
			Class.forName("com.mysql.jdbc.Driver");
			conn = DriverManager.getConnection(dbURL, dbId, dbPassword);
			
		} catch(Exception e) {
			e.printStackTrace();
			
		}
	}
	
}
