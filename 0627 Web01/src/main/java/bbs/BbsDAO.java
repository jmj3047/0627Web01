package bbs;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

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
		}finally {
			try {
				if(pstmt!=null) {
					pstmt.close();
				}
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
	}
	
	//글쓰기화면에서 내용을 작성후에 글쓰기 버튼 누르면 실행될 함수
	//글 id, 글제목, 내용, 글쓴이, 글쓴시간, 삭제 여부를 db에 저장해야 함
	public int write(String bbsTitle, String userID, String bbsContent) {
		/* String SQL = "INSERT INTO BBS VALUES (?,?,?,?,?,?)"; */
		String SQL = "INSERT INTO BBS (bbsID, bbsTitle, writer, crDate, bbsContent, bbsAvailable) VALUES (?,?,?,?,?,?)";
		
		try {
			int num = getNext();
			String date = getDate();
			
			
			pstmt = conn.prepareStatement(SQL); // 문자열 쿼리 대입
//			System.out.println("getNext"+getNext());
			
			pstmt.setInt(1,num); //getNext: 다 번호를 리턴하는 함수를 만들어줌
			
			pstmt.setString(2,bbsTitle); //제목
//			System.out.println("bbsTitle"+bbsTitle);
			pstmt.setString(3,userID); //글쓴이
//			System.out.println("getDate"+getDate());
			
			pstmt.setString(4,date); //getDate: 현재 시간 갖고오는 함수 만들어줌
			pstmt.setString(5,bbsContent);
			pstmt.setInt(6,1); //bbsAvailable 삭제 여부

			return pstmt.executeUpdate(); //CUD에 쓰는쿼리
			
			
		} catch (Exception e) {
			e.printStackTrace(); 
		}finally {
			try {
				if(pstmt!=null) {
					pstmt.close();
				}
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return -1; //데이터 베이스 오류
	}
	
	public int getNext() {
		String SQL = "select max(bbsID) from BBS";
		try {
			pstmt = conn.prepareStatement(SQL); // 문자열 쿼리 대입
			rs = pstmt.executeQuery();
			/* System.out.println("rs.getInt(1):"+rs.getInt(1)); */
			if (rs.next()) {
				return rs.getInt(1)+1; //다음에 들어갈수 = 현재들어있는 최고 숫자+1
			}
			
			
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			try {
				if(pstmt!=null) {
					pstmt.close();
				}
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return -1; //에러
	}
	
	public String getDate() {
		String SQL = "select NOW() from dual";
		try {
			pstmt = conn.prepareStatement(SQL); // 문자열 쿼리 대입
			rs = pstmt.executeQuery();
			if(rs.next()) {
				return rs.getString(1); //데이터 리스트의 첫번쨰꺼	
			}
			
			
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			try {
				if(pstmt!=null) {
					pstmt.close();
				}
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return "날짜 오류";
	}
	
	//글 목록 가져오는 함수
	//쿼리 = 인자(?)로 전달받은 글부터 최신순으로 10개만 가져오는 함수
	//그런데 함수는 페이지 번호. 그러면 해당 페이지에 마지막 번호가 몇인지 분석해 내야 함.
	public ArrayList<Bbs> getList(int pageNumber){
		String SQL = "select * from BBS where bbsID < ? and bbsAvailable  = 1 order by bbsID desc limit 10";
		ArrayList<Bbs> list = new ArrayList<Bbs>(); //껍데기 리스트
		try {
			int nextNum = getNext();
			int startNum = nextNum - (pageNumber -1)*10;
			pstmt = conn.prepareStatement(SQL);
			
			pstmt.setInt(1, startNum); //해당 페이지의 시작번호
			rs = pstmt.executeQuery(); //select문에 사용하는 쿼리
			while(rs.next()) {
				Bbs bbs = new Bbs();
				bbs.setBbsID(rs.getInt(1));
				bbs.setBbsTitle(rs.getString(2));
				bbs.setWriter(rs.getString(3));
				bbs.setCrDate(rs.getString(4));
				bbs.setBbsContent(rs.getString(5));
				bbs.setBbsAvailable(rs.getInt(6));
				list.add(bbs); //검색된 글들을 하나하나 리스트에 쌓기

			}
			
			
		} catch (Exception e) {
			e.printStackTrace();
		} /*
			 * finally { try { if(pstmt!=null) { pstmt.close(); } } catch (SQLException e) {
			 * e.printStackTrace(); } }
			 */
		return list; //다 쌓은 리스트 반환
	}
	
	
	
}
