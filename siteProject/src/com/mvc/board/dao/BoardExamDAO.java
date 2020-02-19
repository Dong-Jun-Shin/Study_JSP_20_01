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
	public ArrayList<BoardExamVO> getBoardExamList(BoardExamVO bvo) {
		ArrayList<BoardExamVO> list = new ArrayList<BoardExamVO>();
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		StringBuffer sql = new StringBuffer(); 
		sql.append("SELECT num, author, title, content, ");
		sql.append("TO_CHAR(writeday, 'YYYY/MM/DD') writeday, ");
		sql.append("readCnt, repRoot, repStep, repIndent, ");
		sql.append("(SELECT COUNT(num) FROM board_comment WHERE num = b.num) AS cCount ");
		sql.append("FROM board_exam b ");
		
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
				listVo.setRepindent(rs.getInt("repindent"));
				listVo.setcCount(rs.getInt("cCount"));
				
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
	
	/**
	 * boardPasswdChk() : 비밀번호 체크하는 메서드
	 * 
	 * @param num
	 * @param passwd
	 * @return
	 */
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
	
	/**
	 * makeReply() : repstep의 중첩을 막기 위해 기존 글들의 repstep을 더해준다.
	 * 
	 * @param root
	 * @param step
	 */
	public void makeReply(int root, int step) {
		Connection con = null;
		PreparedStatement pstmt = null;
		
		try {
			con = getConnection();
			
			StringBuffer sql = new StringBuffer();
			sql.append("UPDATE board_exam SET repstep = repstep + 1 ");
			sql.append("WHERE reproot = ? AND repstep > ?");
			
			pstmt = con.prepareStatement(sql.toString());
			pstmt.setInt(1, root);
			pstmt.setInt(2, step);
			pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if(pstmt != null) pstmt.close();
				if(con != null) con.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
	}
	
	/**
	 * insertReply() : 답변을 등록하는 메서드
	 * @param bvo 본래 게시글이 가지고 있는 bvo 정보
	 * @return return 결과 반환(true: 성공, false: 실패)
	 */
	public boolean insertReply(BoardExamVO bvo) {
		boolean success = false;
		Connection con = null;
		PreparedStatement pstmt = null;
		
		makeReply(bvo.getReproot(), bvo.getRepstep());

		StringBuffer sql = new StringBuffer();
		sql.append("INSERT INTO board_exam(num, author, passwd, title, content, reproot, repstep, repindent) ");
		sql.append("VALUES(board_exam_seq.NEXTVAL, ?, ?, ?, ?, ?, ?, ?)");
		
		try {
			con = getConnection();
			con.setAutoCommit(false);
			
			pstmt = con.prepareStatement(sql.toString());
			pstmt.setString(1, bvo.getAuthor());
			pstmt.setString(2, bvo.getPasswd());
			pstmt.setString(3, bvo.getTitle());
			pstmt.setString(4, bvo.getContent());
			pstmt.setInt(5, bvo.getReproot());
			pstmt.setInt(6, bvo.getRepstep() + 1);
			pstmt.setInt(7, bvo.getRepindent() + 1);
			
			if(pstmt.executeUpdate() == 1) {
				con.commit();
				success = true;
			}else {
				con.rollback();
			}
		} catch (SQLException sqle) {
			System.out.println("insertReply 쿼리 error [ " + sqle + " ]");
			sqle.printStackTrace();
		} catch (Exception e) {
			System.out.println("insertReply 쿼리 error [ " + e + " ]");
			e.printStackTrace();
		} finally {
			try {
				if(pstmt != null) pstmt.close();
				if(con != null) con.close();
			} catch (Exception e) {
				System.out.println("insertReply 쿼리 error [ " + e + " ]");
				e.printStackTrace();
			}
		}
		
		return success;
	}
	
	/**
	 * getCommentCnt() : 댓글의 수를 반환
	 * @param num 게시글 번호
	 * @return cnt 해당 게시글의 댓글 개수
	 */
	public int getCommentCnt(String num) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int cnt = 0;
		
		try {
			con = getConnection();
			StringBuffer sql = new StringBuffer();
			sql.append("SELECT COUNT(bc_num) ");
			sql.append("FROM board_comment WHERE num = ? ");
			
			pstmt = con.prepareStatement(sql.toString());
			pstmt.setInt(1, Integer.parseInt(num));
			
			rs = pstmt.executeQuery();
			if(rs.next()) {
				cnt = rs.getInt(1);
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
		
		return cnt;
	}
}
