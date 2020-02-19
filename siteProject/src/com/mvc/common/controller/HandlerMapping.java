package com.mvc.common.controller;

import java.util.HashMap;
import java.util.Map;

import com.mvc.board.controller.DeleteBoardController;
import com.mvc.board.controller.DetailBoardController;
import com.mvc.board.controller.GetBoardExamListController;
import com.mvc.board.controller.InsertFormController;
import com.mvc.board.controller.InsertReplyController;
import com.mvc.board.controller.PasswdCheckController;
import com.mvc.board.controller.ReplyFormController;
import com.mvc.board.controller.UpdateBoardController;
import com.mvc.board.controller.UpdateFormController;
import com.mvc.board.controller.commentCntController;
import com.mvc.comment.controller.DeleteCommentController;
import com.mvc.comment.controller.GetCommentListController;
import com.mvc.comment.controller.InsertCommentController;
import com.mvc.comment.controller.PwdCheckController;
import com.mvc.comment.controller.UpdateCommentController;
import com.mvc.board.controller.InsertBoardController;

public class HandlerMapping {
	private Map<String, Controller> mappings;

	public HandlerMapping() {
		mappings = new HashMap<String, Controller>();
		/* 답변형 게시판 처리 */
		mappings.put("/board_exam/getBoardExamList.do", new GetBoardExamListController());
		mappings.put("/board_exam/insertForm.do", new InsertFormController());
		mappings.put("/board_exam/insertBoard.do", new InsertBoardController());
		mappings.put("/board_exam/updateForm.do", new UpdateFormController());
		mappings.put("/board_exam/updateBoard.do", new UpdateBoardController());
		mappings.put("/board_exam/deleteBoard.do", new DeleteBoardController());
		mappings.put("/board_exam/detailBoard.do", new DetailBoardController());
		mappings.put("/board_exam/passwdCheck.do", new PasswdCheckController());
		mappings.put("/board_exam/replyForm.do", new ReplyFormController());
		mappings.put("/board_exam/insertReply.do", new InsertReplyController());
		mappings.put("/board_exam/commentCntBoard.do", new commentCntController());
		
		/* 게시판의 댓글 처리 */
		mappings.put("/board_comment/getCommentList.do", new GetCommentListController());
		mappings.put("/board_comment/insertComment.do", new InsertCommentController());
		mappings.put("/board_comment/updateComment.do", new UpdateCommentController());
		mappings.put("/board_comment/deleteComment.do", new DeleteCommentController());
		mappings.put("/board_comment/passwdCheck.do", new PwdCheckController());
		
	}
	
	public Controller getController(String path) {
		return mappings.get(path);
	}
	
}
