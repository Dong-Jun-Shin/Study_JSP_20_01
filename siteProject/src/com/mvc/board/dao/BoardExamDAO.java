package com.mvc.board.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import com.mvc.board.vo.BoardExamVO;

public class BoardExamDAO {
	private DataSource ds;

	private static BoardExamDAO bdao = new BoardExamDAO();

	public static BoardExamDAO getInstance() {
		return bdao;
	}

	private BoardExamDAO() {
	}

	private Connection getConnection() throws Exception{
		// DataSource 얻기, 커넥션 풀 사용
		Context ctx = new InitialContext();
		ds = (DataSource)ctx.lookup("java:comp/env/jdbc/Oracle11g");
		// java:comp/env - 가상의 디렉토리
		// jdbc/Oracle11g - 지정한 리소스 이름
		
		return ds.getConnection();
	}
	
	
	/**
	 * getBoardExamList() 메서드 : 게시판 목록 조회(검색 처리 제외)
	 * 
	 * @return ArrayList<BoardVO> 리턴.
	 */
	public ArrayList<BoardExamVO> getBoardExamList() {
		ArrayList<BoardExamVO> list = new ArrayList<BoardExamVO>();
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		StringBuffer sql = new StringBuffer(); 
		sql.append("SELECT num, author, title, content, ");
		sql.append("TO_CHAR(writeday, 'YYYY/MM/DD') writeday, ");
		sql.append("readCnt, repRoot, repStep, repIndent FROM board_exam ");
		sql.append("ORDER BY repRoot desc, repStep asc");
		
		try {
			con = getConnection();
			pstmt = con.prepareStatement(sql.toString());
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				BoardExamVO bvo = new BoardExamVO();
				bvo.setNum(rs.getInt("num"));
				bvo.setAuthor(rs.getString("author"));
				bvo.setTitle(rs.getString("title"));
				bvo.setContent(rs.getString("content"));
				bvo.setWriteday(rs.getString("writeday"));
				bvo.setReadcnt(rs.getInt("readcnt"));
				bvo.setReproot(rs.getInt("reproot"));
				bvo.setRepstep(rs.getInt("repstep"));
				bvo.setRepindent(rs.getInt("repstep"));
				
				list.add(bvo);
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
		
		return list;
	}
}
