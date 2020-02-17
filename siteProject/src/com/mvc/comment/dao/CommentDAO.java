package com.mvc.comment.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

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
		sql.append("FROM board_comment WHERE num=? ORDER BY bc_num desc");
		
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
	 * replyInsert() : 댓글 등록
	 * 
	 * @param cvo
	 * @return int 성공 여부 리턴 (1:성공)
	 */
	public int insertComment(CommentVO cvo) {
		Connection con = null;
		PreparedStatement pstmt = null;
		
		int result = 0;

		StringBuffer sql = new StringBuffer();
		sql.append("INSERT INTO board_comment(num, bc_num, bc_name, bc_content) ");
		sql.append("VALUES (?, ?, ?, ?)");
		
		try {
			con = getConnection();
			
			pstmt = con.prepareStatement(sql.toString());
			pstmt.setInt(1, cvo.getNum());
			pstmt.setInt(2, cvo.getBc_num());
			pstmt.setString(3, cvo.getBc_name());
			pstmt.setString(4, cvo.getBc_content());
			
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
}
