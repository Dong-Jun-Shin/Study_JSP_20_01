package com.mvc.member.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import com.mvc.member.vo.MemberVO;

public class MemberDAO {
	private DataSource ds;

	private static MemberDAO bdao = new MemberDAO();

	public static MemberDAO getInstance() {
		return bdao;
	}

	private MemberDAO() {
	}

	private Connection getConnection() throws Exception{
		// DataSource 얻기, 커넥션 풀 사용
		Context ctx = new InitialContext();
		ds = (DataSource)ctx.lookup("java:comp/env/jdbc/Oracle11g");
		// java:comp/env - 가상의 디렉토리
		// jdbc/Oracle11g - 지정한 리소스 이름
		
		return ds.getConnection();
	}
	
	public MemberVO memberLogin() {
		
		return null;
	}

	public int memberInsert() {
		
		return 0;
	}

	public int memberUpdate() {
		
		return 0;
	}
	
	public int memberDelete() {
		
		return 0;
	}
	
	/**
	 * memberCheck() : 아이디나 비밀번호를 체크하는 메서드
	 * @param sort ('id': 아이디를 조건으로 검색, 'pwd' : 비밀번호를 조건으로 검색)
	 * @param val 체크할 값
	 * @return (1 : 성공, 0 : 실패)
	 */
	public int memberCheck(String sort, String val) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int result = 0;
		
		if(sort.equals("id")) sort = "m_id";
		if(sort.equals("pwd")) sort = "m_passwd";
		
		StringBuffer sql = new StringBuffer();
		sql.append("SELECT NVL((");
		sql.append("SELECT 1 FROM member WHERE " + sort + "=? ");
		sql.append("), 0) as result FROM dual");

		try {
			con = getConnection();
			pstmt = con.prepareStatement(sql.toString());
			pstmt.setString(1, val);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				result = rs.getInt("result");
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
			}catch (SQLException sqle) {
				sqle.printStackTrace();
			}
		}
		
		return result;
	}
}
