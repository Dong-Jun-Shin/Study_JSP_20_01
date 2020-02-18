package com.mvc.comment.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import com.mvc.board.vo.BoardExamVO;
import com.mvc.comment.vo.CommentVO;

public class CommentDAO {
	private DataSource ds;
	
	private static CommentDAO cdao = new CommentDAO();
	
	public static CommentDAO getInstance() {
		return cdao;
	}
	
	private Connection getConnection() throws Exception{
		// DataSource 얻기, 커넥션 풀 사용
		Context ctx = new InitialContext();
		ds = (DataSource)ctx.lookup("java:comp/env/jdbc/Oracle11g");
		
		return ds.getConnection();
	}

	/**
	 * getCommentList() : 댓글 리스트 조회
	 * @param num
	 * @return ArrayList<CommentVO>
	 */
	public ArrayList<CommentVO> getCommentList(String num){
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		ArrayList<CommentVO> list = new ArrayList<CommentVO>();
		CommentVO listVo = null;
		
		StringBuffer sql = new StringBuffer();
		sql.append("SELECT num, bc_num, bc_name, bc_content, ");
		sql.append("TO_CHAR(bc_date, 'YYYY-MM-DD HH24:MI:SS') AS bc_date ");
		sql.append("FROM board_comment WHERE num=? ORDER BY bc_num asc");
		
		try {
			con = getConnection();
			pstmt = con.prepareStatement(sql.toString());
			pstmt.setInt(1, Integer.parseInt(num));
			
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				listVo = new CommentVO();
				listVo.setNum(rs.getInt("num"));
				listVo.setBc_num(rs.getInt("bc_num"));
				listVo.setBc_name(rs.getString("bc_name"));
				listVo.setBc_content(rs.getString("bc_content"));
				listVo.setBc_date(rs.getString("bc_date"));
				
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
	 * getComment() : 댓글의 정보를 조회
	 * @param bc_num
	 * @return
	 */
	public CommentVO getComment(String bc_num) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		CommentVO cvo = new CommentVO();
		
		StringBuffer sql = new StringBuffer();
		sql.append("SELECT num, bc_num, bc_name, bc_content, ");
		sql.append("TO_CHAR(bc_date, 'YYYY-MM-DD HH24:MI:SS') AS bc_date ");
		sql.append("FROM board_comment WHERE bc_num=? ORDER BY bc_num asc");
		
		try {
			con = getConnection();
			pstmt = con.prepareStatement(sql.toString());
			pstmt.setInt(1, Integer.parseInt(bc_num));
			
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				cvo.setNum(rs.getInt("num"));
				cvo.setBc_num(rs.getInt("bc_num"));
				cvo.setBc_name(rs.getString("bc_name"));
				cvo.setBc_content(rs.getString("bc_content"));
				cvo.setBc_date(rs.getString("bc_date"));
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
		
		return cvo;
	}
	
	/**
	 * insertComment() : 댓글 등록
	 * 
	 * @param cvo
	 * @return int 성공 여부 리턴 (1:성공)
	 */
	public int insertComment(CommentVO cvo) {
		Connection con = null;
		PreparedStatement pstmt = null;
		
		int result = 0;

		StringBuffer sql = new StringBuffer();
		sql.append("INSERT INTO board_comment(num, bc_num, bc_name, bc_content, bc_pwd) ");
		sql.append("VALUES (?, board_comment_seq.NEXTVAL, ?, ?, ?)");
		
		try {
			con = getConnection();
			
			pstmt = con.prepareStatement(sql.toString());
			pstmt.setInt(1, cvo.getNum());
			pstmt.setString(2, cvo.getBc_name());
			pstmt.setString(3, cvo.getBc_content());
			pstmt.setString(4, cvo.getBc_pwd());
			
			result = pstmt.executeUpdate();
		} catch (SQLException sqle) {
			System.out.println("insertComment 쿼리 error [ " + sqle + " ]");
			sqle.printStackTrace();
		} catch (Exception e) {
			System.out.println("insertComment 쿼리 error [ " + e + " ]");
			e.printStackTrace();
		} finally {
			try {
				if(pstmt != null) pstmt.close();
				if(con != null) con.close();
			} catch (Exception e) {
				System.out.println("insertComment 쿼리 error [ " + e + " ]");
				e.printStackTrace();
			}
		}
		
		return result;
	}
	
	/**
	 * updateComment() : 댓글 수정
	 * 
	 * @param cvo
	 * @return result : 1(성공), 0(실패)
	 */
	public int updateComment(CommentVO cvo) {
		Connection con = null;
		PreparedStatement pstmt = null;
		int result = 0;
		
		StringBuffer sql = new StringBuffer();
		sql.append("UPDATE board_comment SET bc_content = ? ");
		if(cvo.getBc_pwd() != "") sql.append(", bc_pwd = ? ");
		sql.append("WHERE bc_num = ?");
		
		
		try {
			con = getConnection();
			pstmt = con.prepareStatement(sql.toString());
			pstmt.setString(1, cvo.getBc_content());
			
			if(cvo.getBc_pwd() != "") {
				pstmt.setString(2, cvo.getBc_pwd());
				pstmt.setInt(3, cvo.getBc_num());
			}else {
				pstmt.setInt(2, cvo.getBc_num());
			}
			
			result = pstmt.executeUpdate(); 
		} catch (SQLException sqle) {
			System.out.println("updateComment 쿼리 error [ " + sqle + " ]");
			sqle.printStackTrace();
		} catch (Exception e) {
			System.out.println("updateComment 쿼리 error [ " + e + " ]");
			e.printStackTrace();
		} finally {
			try {
				if(pstmt != null) pstmt.close();
				if(con != null) con.close();
			} catch (Exception e) {
				System.out.println("updateComment 쿼리 error [ " + e + " ]");
				e.printStackTrace();
			}
		}
		
		return result;
	}
	
	/**
	 * deleteComment() : 게시물 삭제
	 * 
	 * @param bc_num
	 * @return result : 1(성공), 0(실패)
	 */
	public int deleteComment(String bc_num) {
		Connection con = null;
		PreparedStatement pstmt = null;
		int result = 0;
		
		StringBuffer sql = new StringBuffer();
		sql.append("DELETE FROM board_comment WHERE bc_num = ?");
		
		try {
			con = getConnection();
			pstmt = con.prepareStatement(sql.toString());
			pstmt.setString(1, bc_num);
			
			result = pstmt.executeUpdate();
		} catch (SQLException sqle) {
			System.out.println("deleteComment 쿼리 error [ " + sqle + " ]");
			sqle.printStackTrace();
		} catch (Exception e) {
			System.out.println("deleteComment 쿼리 error [ " + e + " ]");
			e.printStackTrace();
		} finally {
			try {
				if(pstmt != null) pstmt.close();
				if(con != null) con.close();
			} catch (Exception e) {
				System.out.println("deleteComment 쿼리 error [ " + e + " ]");
				e.printStackTrace();
			}
		}
		
		return result;
	}
	
	/**
	 * commentPasswdChk() : 비밀번호 체크하는 메서드
	 * 
	 * @param num
	 * @param passwd
	 * @return
	 */
	public int commentPasswdChk(String bc_num, String bc_passwd) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int result = 0;
		
		try {
			con = getConnection();
			StringBuffer sql = new StringBuffer();
			sql.append("SELECT NVL((SELECT 1 FROM board_comment ");
			sql.append("WHERE bc_num=? AND bc_pwd=?), 0) ");
			sql.append("as result FROM dual");
			
			pstmt = con.prepareStatement(sql.toString());
			pstmt.setInt(1, Integer.parseInt(bc_num));
			pstmt.setString(2, bc_passwd);
			
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
