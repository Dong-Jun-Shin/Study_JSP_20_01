package com.student;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

//테이블 student를 위한 데이터베이스 연동 자바빈즈 프로그램
public class StudentDAO {
	// 데이터베이스 연결 관련 상수 선언 - 커넥션 풀을 사용함으로써 생략
//	private static final String JDBC_URL =  "jdbc:oracle:thin:@127.0.0.1:1521:orcl";
//	private static final String USER = "javauser";
//	private static final String PASSWD = "java1234";
	
	private static StudentDAO instance = new StudentDAO();
	
	public static StudentDAO getInstance() {
		return instance;
	}
	
	private StudentDAO() {
		
	}
	
	/* private StudentDAO() {} */
//	private StudentDAO() {
//		try {
//			Class.forName("oracle.jdbc.driver.OracleDriver");
//		}catch(ClassNotFoundException cnfe) {
//			cnfe.printStackTrace();
//		}
//	}
	
	// 커넥션 풀을 사용함으로써 생략
//	private Connection getConnection() throws SQLException{	
//		Connection con = DriverManager.getConnection(JDBC_URL, USER, PASSWD);
//		return con;
//	}

	// 커넥션 풀을 사용함으로써 생략
	private Connection getConnection() throws Exception{	
		Context ctx = new InitialContext();
		DataSource ds = (DataSource)ctx.lookup("java:comp/env/jdbc/Oracle11g");
		return ds.getConnection();
	}
	
	/**
	 * getStudentList() 메서드: 학생 정보 조회
	 * @return ArrayList<StudentVO> 리턴.
	 */
	public ArrayList<StudentVO> getStudentList(){
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		ArrayList<StudentVO> list = new ArrayList<StudentVO>();
		StudentVO vo = null;
		
		StringBuffer sql = new StringBuffer();
		sql.append("SELECT sd_num, sd_name, sd_id, s_name as s_num, sd_birth, ");
		sql.append("sd_phone, sd_address, sd_email, sd_date FROM student st INNER JOIN subject sb ON st.s_num = sb.s_num ORDER BY st.no");
		
		try {
			con = getConnection();
			pstmt = con.prepareStatement(sql.toString());
			rs = pstmt.executeQuery();
			
			// ResultSet의 결과에서 모든 행을 각각의 StudentVO 객체에 저장
			while(rs.next()) {
				// 한 행의 학생정보를 저장할 학생을 위한 빈즈 객체 생성
				vo = new StudentVO();
				
				// 한 행의 학생정보를 자바 빈즈 객체에 저장
				vo.setSd_num(rs.getString("sd_num"));
				vo.setSd_name(rs.getString("sd_name"));
				vo.setSd_id(rs.getString("sd_id"));
				vo.setS_num(rs.getString("s_num"));
				vo.setSd_birth(rs.getString("sd_birth").toString());
				vo.setSd_phone(rs.getString("sd_phone"));
				vo.setSd_address(rs.getString("sd_address"));
				vo.setSd_email(rs.getString("sd_email"));
				vo.setSd_date(rs.getDate("sd_date").toString());
				
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
	
	public String getStudentCount(String subjectNum) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String serialNumber = "";
		
		StringBuffer sql = new StringBuffer();
		sql.append("SELECT NVL(LPAD(MAX(TO_NUMBER(LTRIM(SUBSTR(sd_num,5,4), '0')))+1, 4, '0'), '0001') AS s_num ");
		sql.append("FROM student WHERE s_num = ?");
		
		try {
			con = getConnection();
			pstmt = con.prepareStatement(sql.toString());
			pstmt.setString(1, subjectNum);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				serialNumber = rs.getString("s_num");
			}
		} catch (SQLException sqle) {
			System.out.println("getStudentNumber 쿼리 error = [ " + sqle + " ]");
			sqle.printStackTrace();
		} catch (Exception e) {
			System.out.println("getStudentNumber error = [ " + e + " ]");
			e.printStackTrace();
		} finally {
			try {
				if(rs != null) rs.close();
				if(pstmt != null) pstmt.close();
				if(con != null) con.close();
			} catch (Exception e) {
				System.out.println("디비 연동 해제 error = [ " + e + " ]");
				e.printStackTrace();
			}
		}
		
		return serialNumber;
	}
	
	public int idCheck(String sd_id){
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int result = 0;
		
		StringBuffer sql = new StringBuffer();
		sql.append("SELECT nvl((SELECT 1 FROM student WHERE sd_id = ?), 0) AS state FROM dual");
		
		try {
			con = getConnection();
			pstmt = con.prepareStatement(sql.toString());
			pstmt.setString(1, sd_id);
			rs = pstmt.executeQuery();
			
			if(rs.next()) result = rs.getInt("state");			
		} catch (SQLException sqle) {
			System.out.println("idCheck 쿼리 error [ " + sqle + " ]");
			sqle.printStackTrace();
		} catch (Exception e) {
			System.out.println("idCheck 쿼리 error [ " + e + " ]");
			e.printStackTrace();
		} finally {
			try {
				if(rs != null) rs.close();
				if(pstmt != null) pstmt.close();
				if(con != null) con.close();
			}catch (SQLException sqle) {
				System.out.println("디비 연동 해제 error [ " + sqle + " ]");
				sqle.printStackTrace();
			}
		}
		
		return result;
	}
	
	public int studentInsert(StudentVO vo) {
		Connection con = null;
		PreparedStatement pstmt = null;
		int result = 0;
		
		StringBuffer sql = new StringBuffer();
		sql.append("INSERT INTO student(no, sd_num, sd_name, sd_id, sd_passwd, ");
		sql.append("s_num, sd_birth, sd_phone, sd_address, sd_email) "); 
		sql.append("VALUES(seq_student_no.NEXTVAL, ?, ?, ?, ?, ?, ?, ?, ?, ?)");

		try {
			con = getConnection();
			pstmt = con.prepareStatement(sql.toString());
			
			pstmt.setString(1, vo.getSd_num());
			pstmt.setString(2, vo.getSd_name());
			pstmt.setString(3, vo.getSd_id());
			pstmt.setString(4, vo.getSd_passwd());
			pstmt.setString(5, vo.getS_num());
			pstmt.setDate(6, Date.valueOf(vo.getSd_birth().toString()));
			pstmt.setString(7, vo.getSd_phone());
			pstmt.setString(8, vo.getSd_address());
			pstmt.setString(9, vo.getSd_email());
			result = pstmt.executeUpdate();
			 
		} catch (SQLException sqle) {
			System.out.println("idCheck 쿼리 error [ " + sqle + " ]");
			sqle.printStackTrace();
		} catch (Exception e) {
			System.out.println("idCheck 쿼리 error [ " + e + " ]");
			e.printStackTrace();
		} finally {
			try {
				if(pstmt != null) pstmt.close();
				if(con != null) con.close();
			}catch (SQLException sqle) {
				System.out.println("디비 연동 해제 error [ " + sqle + " ]");
				sqle.printStackTrace();
			}
		}
		
		return result;
	}
}	