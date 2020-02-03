package team.board;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

public class BoardDAO {
	private static final String JDBC_URL = "jdbc:oracle:thin:@192.168.0.131:1521:orcl";
	private static final String USER = "javauser";
	private static final String PASSWD = "java1234";
	
	private static BoardDAO instance = new BoardDAO();
	
	public static BoardDAO getInstance() {
		return instance;
	}
	
	private BoardDAO() {
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
		}catch(ClassNotFoundException cnfe) {
			cnfe.printStackTrace();
		}
	}
	
	private Connection getConnection() throws SQLException {
		Connection con = DriverManager.getConnection(JDBC_URL, USER, PASSWD);
		return con;
	}
	
	// 게시물 목록 전체 조회
	public ArrayList<BoardVO>getBoardList(){
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		ArrayList<BoardVO> list = new ArrayList<BoardVO>();
		BoardVO vo = null;
		
		StringBuffer sql = new StringBuffer();
		sql.append("SELECT b_num, b_title, b_writer, b_reg_date, b_hits FROM board");
		
		try {
			con = getConnection();
			pstmt = con.prepareStatement(sql.toString());
			rs = pstmt.executeQuery();
			
			// ResultSet의 결과에서 모든 행을 각각의 StudentVO 객체에 저장
			while(rs.next()) {
				// 한 행의 학생정보를 저장할 학생을 위한 빈즈 객체 생성
				vo = new BoardVO();
				
				// 한 행의 학생정보를 자바 빈즈 객체에 저장
				vo.setB_num(rs.getInt("b_num"));
				vo.setB_title(rs.getString("b_title"));
				vo.setB_writer(rs.getString("b_writer"));
				vo.setB_reg_date(rs.getString("b_reg_date"));
				vo.setB_hits(rs.getString("b_hits"));
				
				list.add(vo);
			}
		}catch(SQLException sqle){
			sqle.printStackTrace();
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			try {
				if(rs != null) rs.close();
				if(pstmt != null) pstmt.close();
				if(con != null) con.close();
			} catch (SQLException sqle) {
				System.out.println(sqle.toString());
				sqle.printStackTrace();
			}
		}
		
		return list;
	}

	// 게시물 검색 조회
	public ArrayList<BoardVO> getSearchBoard(String sort) {
		ArrayList<BoardVO> list = new ArrayList<BoardVO>();
		
		return list;
	}
	
	// 게시물 정보 조회
	// DetailsDAO의 내용 조회를 활용해서 해도 되고, JOIN문을 활용해도 됨
	public ArrayList<BoardVO> getSelBoard(HttpServletRequest request) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		ArrayList<BoardVO> list = new ArrayList<BoardVO>();
		BoardVO vo = null;
		
		StringBuffer sql = new StringBuffer();
		sql.append("SELECT b.b_num, b.b_title, b.b_writer, b.b_reg_date, b.b_hits, d.b_content, d.b_file ");
		sql.append("FROM board b INNER JOIN details d ON b.b_num = d.b_num WHERE b.b_num=?");
		
		try {
			con = getConnection();
			pstmt = con.prepareStatement(sql.toString());
			pstmt.setString(1, request.getParameter("b_num"));
			rs = pstmt.executeQuery();
			
			// ResultSet의 결과에서 모든 행을 각각의 StudentVO 객체에 저장
			while(rs.next()) {
				// 한 행의 학생정보를 저장할 학생을 위한 빈즈 객체 생성
				vo = new BoardVO();
				
				// 한 행의 학생정보를 자바 빈즈 객체에 저장
				vo.setB_file(rs.getString("b_file"));
				vo.setB_title(rs.getString("b_title"));
				vo.setB_writer(rs.getString("b_writer"));
				vo.setB_content(rs.getString("b_content"));
				vo.setB_hits(rs.getString("b_hits"));
				
				vo.toString();
				
				list.add(vo);
			}
		}catch(SQLException sqle){
			sqle.printStackTrace();
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			try {
				if(rs != null) rs.close();
				if(pstmt != null) pstmt.close();
				if(con != null) con.close();
			} catch (SQLException sqle) {
				System.out.println(sqle.toString());
				sqle.printStackTrace();
			}
		}
		
		return list;
	}
	
	// 게시물 내용 목록 조회
	public ArrayList<BoardVO> getSelDetails(String b_num) {
		ArrayList<BoardVO> list = new ArrayList<BoardVO>();

		return list;
	}
	
	// 게시물 등록 
	// SQL문을 작성할 때, 테이블(board, details)에 분리되서 입력하도록 만들기
	// 사용해서 내용 등록도 같이 이루어지도록 하기
	public int BoardInsert(BoardVO vo) {
		int result = 0;
		
		return result;
	}
}
