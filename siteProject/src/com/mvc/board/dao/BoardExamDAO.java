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

import oracle.jdbc.proxy.annotation.Pre;

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
	public ArrayList<BoardExamVO> getBoardExamList(BoardExamVO bvo) {
		ArrayList<BoardExamVO> list = new ArrayList<BoardExamVO>();
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		StringBuffer sql = new StringBuffer(); 
		sql.append("SELECT num, author, title, content, ");
		sql.append("TO_CHAR(writeday, 'YYYY/MM/DD') writeday, ");
		sql.append("readCnt, repRoot, repStep, repIndent FROM board_exam ");
		if("title".equals(bvo.getSearch())) {
			sql.append("WHERE title LIKE ? ");
		} else if("content".equals(bvo.getSearch())) {
			sql.append("WHERE content LIKE ? ");
		} else if("author".equals(bvo.getSearch())) {
			sql.append("WHERE author LIKE ? ");
		} 
		
		sql.append("ORDER BY repRoot desc, repStep asc");
		
		try {
			con = getConnection();
			pstmt = con.prepareStatement(sql.toString());
			if(!"all".equals(bvo.getSearch())) {
				pstmt.setString(1,  "%" + bvo.getKeyword() + "%");

			}
			
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				BoardExamVO listVo = new BoardExamVO();
				listVo.setNum(rs.getInt("num"));
				listVo.setAuthor(rs.getString("author"));
				listVo.setTitle(rs.getString("title"));
				listVo.setContent(rs.getString("content"));
				listVo.setWriteday(rs.getString("writeday"));
				listVo.setReadcnt(rs.getInt("readcnt"));
				listVo.setReproot(rs.getInt("reproot"));
				listVo.setRepstep(rs.getInt("repstep"));
				listVo.setRepindent(rs.getInt("repstep"));
				
				list.add(listVo);
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
	
	/**
	 * insertBoardExam() 메서드 : 게시물 등록
	 * 
	 * @param bvo : 게시물의 정보를 담은 객체
	 * @return boolean 성공 여부 리턴.
	 */
	public boolean insertBoardExam(BoardExamVO bvo) {
		boolean success = false;
		Connection con = null;
		PreparedStatement pstmt = null;
		
		StringBuffer sql = new StringBuffer();
		sql.append("INSERT INTO board_exam(num, author, title, content, reproot, repstep, repindent, passwd) ");
		sql.append("VALUES(board_exam_seq.NEXTVAL, ?, ?, ?, board_exam_seq.CURRVAL, 0, 0, ?)");
		
		try {
			con = getConnection();
			con.setAutoCommit(false);
			
			pstmt = con.prepareStatement(sql.toString());
			pstmt.setString(1, bvo.getAuthor());
			pstmt.setString(2, bvo.getTitle());
			pstmt.setString(3, bvo.getContent());
			pstmt.setString(4, bvo.getPasswd());
			
			if(pstmt.executeUpdate() == 1) {
				con.commit();
				success = true;
			}else {
				con.rollback();
			}
		} catch (SQLException sqle) {
			System.out.println("insertBoardExam 쿼리 error [ " + sqle + " ]");
			sqle.printStackTrace();
		} catch (Exception e) {
			System.out.println("insertBoardExam 쿼리 error [ " + e + " ]");
			e.printStackTrace();
		} finally {
			try {
				if(pstmt != null) pstmt.close();
				if(con != null) con.close();
			} catch (Exception e) {
				System.out.println("insertBoardExam 쿼리 error [ " + e + " ]");
				e.printStackTrace();
			}
		}
		
		return success;
	}
	
	/**
	 * updateBoardExam() : 게시물 수정
	 * @param bvo
	 * @return
	 */
	public boolean updateBoardExam(BoardExamVO bvo) {
		Connection con = null;
		PreparedStatement pstmt = null;
		boolean success = false;
		
		StringBuffer sql = new StringBuffer();
		sql.append("UPDATE board_exam SET title = ?, content = ? ");
		if(bvo.getPasswd() != "") sql.append(", passwd = ? ");
		sql.append("WHERE num = ?");
		
		
		try {
			con = getConnection();
			pstmt = con.prepareStatement(sql.toString());
			pstmt.setString(1, bvo.getTitle());
			pstmt.setString(2, bvo.getContent());
			if(bvo.getPasswd() != "") {
				pstmt.setString(3, bvo.getPasswd());
				pstmt.setInt(4, bvo.getNum());
			}else {
				pstmt.setInt(3,  bvo.getNum());
			}
			
			if(pstmt.executeUpdate() == 1) 
				success = true;
			
		} catch (SQLException sqle) {
			System.out.println("updateBoardExam 쿼리 error [ " + sqle + " ]");
			sqle.printStackTrace();
		} catch (Exception e) {
			System.out.println("updateBoardExam 쿼리 error [ " + e + " ]");
			e.printStackTrace();
		} finally {
			try {
				if(pstmt != null) pstmt.close();
				if(con != null) con.close();
			} catch (Exception e) {
				System.out.println("updateBoardExam 쿼리 error [ " + e + " ]");
				e.printStackTrace();
			}
		}
		
		return success;
	}
	
	/**
	 * deleteBoardExam() : 게시물 삭제
	 * @param num
	 */
	public void deleteBoardExam(String num) {
		Connection con = null;
		PreparedStatement pstmt = null;
		
		StringBuffer sql = new StringBuffer();
		sql.append("DELETE FROM board_exam WHERE num = ?");
		
		try {
			con = getConnection();
			pstmt = con.prepareStatement(sql.toString());
			pstmt.setString(1, num);
			
			pstmt.executeUpdate();
		} catch (SQLException sqle) {
			System.out.println("deleteBoardExam 쿼리 error [ " + sqle + " ]");
			sqle.printStackTrace();
		} catch (Exception e) {
			System.out.println("deleteBoardExam 쿼리 error [ " + e + " ]");
			e.printStackTrace();
		} finally {
			try {
				if(pstmt != null) pstmt.close();
				if(con != null) con.close();
			} catch (Exception e) {
				System.out.println("deleteBoardExam 쿼리 error [ " + e + " ]");
				e.printStackTrace();
			}
		}
	}
	
	/**
	 * readCount() : 조회수 증가를 위한 메서드
	 * @param num
	 */
	public void getReadCount(String num) {
		Connection con = null;
		PreparedStatement pstmt = null;

		StringBuffer sql = new StringBuffer();
		sql.append("UPDATE board_exam ");
		sql.append("SET readCnt = readCnt + 1 ");
		sql.append("WHERE num = ?");
				
		try {
			con = getConnection();
			pstmt = con.prepareStatement(sql.toString());
			pstmt.setInt(1, Integer.parseInt(num));
			pstmt.executeUpdate();
		} catch (SQLException sqle) {
			sqle.printStackTrace();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if(pstmt != null) pstmt.close();
				if(con != null) con.close();
			} catch (SQLException sqle) {
				sqle.printStackTrace();
			}
		}
	}
	
	/**
	 * boardDetail() : 상세 내역 조회 메서드
	 * 
	 * @param num
	 * @return BoardExamVO 객체
	 */
	public BoardExamVO boardDetail(String num) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		BoardExamVO bvo = new BoardExamVO();
		StringBuffer sql = new StringBuffer();
		sql.append("SELECT num, author, title, content, ");
		sql.append("TO_CHAR(writeday, 'YYYY-MM-DD HH24:MI:SS') writeday, ");
		sql.append("readCnt, repRoot, repIndent, repStep ");
		sql.append("FROM board_exam WHERE num = ?");
		
		try {
			con = getConnection();
			pstmt = con.prepareStatement(sql.toString());
			pstmt.setInt(1, Integer.parseInt(num));
			
			rs = pstmt.executeQuery();
			if(rs.next()){
				bvo.setNum(rs.getInt("num"));
				bvo.setTitle(rs.getString("title"));
				bvo.setAuthor(rs.getString("author"));
				bvo.setContent(rs.getString("content"));
				bvo.setWriteday(rs.getString("writeday"));
				bvo.setReadcnt(rs.getInt("readCnt"));
				bvo.setReproot(rs.getInt("repRoot"));
				bvo.setRepstep(rs.getInt("repStep"));
				bvo.setRepindent(rs.getInt("repIndent"));
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
		
		return bvo;
	}
	
	public int boardPasswdChk(String num, String passwd) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int result = 0;
		
		try {
			con = getConnection();
			StringBuffer sql = new StringBuffer();
			sql.append("SELECT NVL((SELECT 1 FROM board_exam ");
			sql.append("WHERE num=? AND passwd=?), 0) ");
			sql.append("as result FROM dual");
			
			pstmt = con.prepareStatement(sql.toString());
			pstmt.setInt(1, Integer.parseInt(num));
			pstmt.setString(2, passwd);
			
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
