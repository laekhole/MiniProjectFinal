package com.kosa.project_final.board.dao;

import java.util.List;
import java.util.Map;

import com.kosa.project_final.board.domain.BoardDTO;
import com.kosa.project_final.board.domain.CommentDTO;

public interface CommentDAO {
	
	//1. 댓글 목록(보기) Read
	public List<CommentDTO> getCommentList(CommentDTO comment) throws Exception;
		
	//2. 댓글 쓰기 Create
	public boolean insertComment(CommentDTO comment) throws Exception; 
	
	//3. 댓글 수정하기 Update
	public boolean updateComment(CommentDTO comment) throws Exception;

	//4. 댓글 삭제하기 Delete
	public boolean deleteComment(int commentid) throws Exception;
	
	//8. 체크박스된 게시글 삭제
	public int deleteComments(Map<String, Object> params) throws Exception;
		
	//9. 더보기 만들기
	public List<CommentDTO> getCommentList2(CommentDTO comment) throws Exception;
	
	//10. 게시글 10개씩 들어오게 하는 메서드
	public List<CommentDTO> getcommentListBoforeN(CommentDTO comment) throws Exception;




	
} // end class
