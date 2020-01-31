package com.student;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class SubjectDAO {
	private static final String JDBC_URL = "jdbc:oracle:thin:@localhost:1521:orcl";
	private static final String USER = "javauser";
	private static final String PASSWD = "java1234";
	
	private static SubjectDAO instance = new SubjectDAO();
	
	public static SubjectDAO getInstance() {
		return instance;
	}
	
	private SubjectDAO() {
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
		}catch (ClassNotFoundException cnfe) {
			cnfe.printStackTrace();
		}
	}
			
	private Connection getConnection() throws SQLException{
		Connection con = DriverManager.getConnection(JDBC_URL, USER, PASSWD);
		return con;
	}
	
	/**
	 * getSubjectList() 메서드 : 학생 정보 조회
	 * @return ArrayList<StudentVO> 리턴.
	 */
	public ArrayList<SubjectVO> getSubjectList(){
		Connection con = null;
		PreparedStatement pstmt= null;
		ResultSet rs = null;
		
		ArrayList<SubjectVO> list = new ArrayList<SubjectVO>();
		SubjectVO svo = null;
		
		StringBuffer sql = new StringBuffer();
		sql.append("SELECT no, s_num, s_name FROM subject ORDER BY no");
		
		try {
			con = getConnection();
			pstmt = con.prepareStatement(sql.toString());
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				svo = new SubjectVO();
				
				svo.setNo(rs.getInt("no"));
				svo.setS_num(rs.getString("s_num"));
				svo.setS_name(rs.getString("s_name"));
				
				list.add(svo);
			}
		}catch (SQLException sqle) {
			sqle.printStackTrace();
		}catch (Exception e) {
			e.printStackTrace();
		}finally {
			try {
				if(rs != null) rs.close();
				if(pstmt != null) pstmt.close();
				if(con != null) con.close();
			} catch (Exception e) {
				e.printStackTrace();
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
		sql.append("SELECT NVL(LPAD(MAX(LTRIM(SUBSTR(std.sd_num,5,4), '0')), '4', '0'), '0001') AS s_num");
		sql.append("FROM student std INNER JOIN subject sbj ON std.s_num = sbj.s_num ");
		sql.append("WHERE sbj.s_num = ?");
		
		try {
			con = getConnection();
			pstmt = con.prepareStatement(sql.toString());
			pstmt.setString(1, subjectNum);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				serialNumber = rs.getString("s_num");
			}
		} catch (SQLException sqle) {
			sqle.printStackTrace();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if(rs != null) rs.close();
				if(pstmt != null) pstmt.close();
				if(con != null) con.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		
		return serialNumber;
	}
}	
