package com.kosa.project_final.board.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kosa.project_final.board.dao.CommentDAO;
import com.kosa.project_final.board.domain.CommentDTO;

@Service
public class CommentService {

	@Autowired
	private CommentDAO commentDAO;

	// 댓글 재정의
	public CommentService() {
	
	}
	
	//1. 댓글 목록
	public List<CommentDTO> getCommentList(CommentDTO comment) throws Exception {
		System.out.println("comment.service.getCommentList() 함수 호출됨");
		return commentDAO.getCommentList(comment);
	}

	//1-2. 댓글 목록(ajax)
	public Map<String, Object> getCommentList2(CommentDTO comment) {
		System.out.println("comment.service.getCommentList2() 함수 호출됨");
		return null;
	}
	

	//2. 댓글 글쓰기
	public boolean commentInsert(CommentDTO comment) throws Exception {
		System.out.println("comment.service.commentInsert() 함수 호출됨");
		return commentDAO.insertComment(comment);
	}

	
	//3. 댓글 수정하기
	public boolean commentUpdate(int commentid) throws Exception {
		System.out.println("comment.service.commentUpdate() 함수 호출됨");
		return commentDAO.updateComment(commentid);
	}	


	//4. 댓글 삭제하기
	public boolean commentDelete(int commentid) throws Exception {
		System.out.println("comment.service.commentDelete() 함수 호출됨");
		return commentDAO.deleteComment(commentid);
	}


	

} // end class