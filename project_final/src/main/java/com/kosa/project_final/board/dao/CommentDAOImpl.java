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
		
		return sqlSession.selectList("mapper.comment.getCommentList", comment);
	}	// getCommentList

	//1-2. 더보기 만들기
	@Override
	public List<CommentDTO> getCommentList2(CommentDTO comment) throws Exception {
		
		return sqlSession.selectList("mapper.comment.getCommentList2", comment);
	}	//getCommentList2

	//2. 댓글 쓰기
	@Override
	public boolean insertComment(CommentDTO comment) throws Exception {
		
		return 0 != sqlSession.insert("mapper.comment.insertComment", comment);
	}	//insertComment

	//3. 댓글 수정하기 Update
	@Override
	public boolean updateComment(CommentDTO comment) throws Exception {
		
		return 0 != sqlSession.update("mapper.comment.updateComment", comment);
	}	//updateComment

	//4. 댓글 삭제하기 Delete
	@Override
	public boolean deleteComment(int commentid) throws Exception {
		
		return 0 != sqlSession.update("mapper.comment.deleteComment", commentid); //delete지만, 실제로는 delete_yn 컬럼을 'Y'로 바꾸는 과정이므로 업데이트.
	}	//deleteComment

	//5. 체크박스된 게시글 삭제
	public int deleteComments(Map<String, Object> params) throws Exception {
		
		return sqlSession.delete("mapper.comment.deleteComments", params);
	}	//deleteComments

	//6. [더보기 종료 용도] DB에서 마지막 댓글 데이터 얻기
	public CommentDTO getLastCommentid(CommentDTO comment) {
		
		return sqlSession.selectOne("mapper.comment.getLastCommentId", comment);
	} //getLastCommentid

	//7. [더보기 종료 용도] DB에서 총 댓글 갯수 획득하기
	@Override
	public CommentDTO getTotalCount(CommentDTO comment) {
		
		return sqlSession.selectOne("mapper.comment.getTotalCount", comment);
	} //getTotalCount
}