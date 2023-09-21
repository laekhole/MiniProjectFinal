package com.kosa.project_final.board.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kosa.project_final.board.domain.CommentDTO;


@Repository("commentDAO")
public class CommentDAOImpl implements CommentDAO {

	@Autowired
	private  SqlSession sqlSession;
	
	//1. 댓글 목록
	@Override
	public List<CommentDTO> getCommentList(CommentDTO comment) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectList("mapper.comment.getCommentList");
	}	// getCommentList

	//1-2. 더보기 만들기
	@Override
	public List<CommentDTO> getCommentList2(CommentDTO comment) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectList("mapper.comment.getCommentList2", comment);
	}	//getCommentList2

	//2. 댓글 쓰기
	@Override
	public boolean insertComment(CommentDTO comment) throws Exception {
		// TODO Auto-generated method stub
		return 0 != sqlSession.insert("mapper.comment.insertComment", comment);
	}	//insertComment

	//3. 댓글 수정하기 Update
	@Override
	public boolean updateComment(CommentDTO comment) throws Exception {
		// TODO Auto-generated method stub
		return 0 != sqlSession.update("mapper.comment.updateComment", comment);
	}	//updateComment

	//4. 댓글 삭제하기 Delete
	@Override
	public boolean deleteComment(int commentid) throws Exception {
		// TODO Auto-generated method stub
		return 0 != sqlSession.delete("mapper.comment.deleteComment", commentid);
	}	//deleteComment

	//5. 체크박스된 게시글 삭제
	public int deleteComments(Map<String, Object> params) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.delete("mapper.comment.deleteComments", params);
	}	//deleteComments

	//6. 게시글 10개씩 들어오게 하는 메서드
	@Override
	public List<CommentDTO> getcommentListBoforeN(CommentDTO comment) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectList("mapper.comment.getcommentListBoforeN", comment);
	}	//getcommentListBoforeN




}