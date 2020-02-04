package com.student;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class SubjectDAO {
//	private static final String JDBC_URL = "jdbc:oracle:thin:@localhost:1521:orcl";
//	private static final String USER = "javauser";
//	private static final String PASSWD = "java1234";
	
	private static SubjectDAO instance = new SubjectDAO();
	
	public static SubjectDAO getInstance() {
		return instance;
	}
	
//	private SubjectDAO() {
//		try {
//			Class.forName("oracle.jdbc.driver.OracleDriver");
//		}catch (ClassNotFoundException cnfe) {
//			cnfe.printStackTrace();
//		}
//	}
			
//	private Connection getConnection() throws SQLException{
//		Connection con = DriverManager.getConnection(JDBC_URL, USER, PASSWD);
//		return con;
//	}

	private Connection getConnection() throws Exception{
		Context ctx = new InitialContext();
		DataSource ds = (DataSource)ctx.lookup("java:comp/env/jdbc/Oracle11g");
		return ds.getConnection();
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
}