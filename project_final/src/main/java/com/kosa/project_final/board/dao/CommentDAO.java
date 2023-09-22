package com.kosa.project_final.board.dao;

import java.util.List;

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

	//5. 더보기 만들기
	public List<CommentDTO> getCommentList2(CommentDTO comment) throws Exception;

	//6. [더보기 종료 용도] DB에서 마지막 댓글 데이터 얻기
	public CommentDTO getLastCommentid(CommentDTO comment);

	//7. [더보기 종료 용도] DB에서 총 댓글 갯수 획득하기
	public CommentDTO getTotalCount(CommentDTO comment);

} // end class
