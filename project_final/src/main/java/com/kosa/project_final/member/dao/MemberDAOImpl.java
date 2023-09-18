package com.kosa.project_final.member.dao;


import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kosa.project_final.board.domain.BoardDTO;
import com.kosa.project_final.member.domain.MemberDTO;

@Repository("memberDAO")
public class MemberDAOImpl implements MemberDAO {
	@Autowired
	private  SqlSession sqlSession;
	
	//1. 회원 목록
	@Override
	public List<MemberDTO> getMemberList() throws Exception {
		return sqlSession.selectList("mapper.member.selectAllMemberList");
	} // getMemberList
	
	
	//2. 회원 상세보기
	@Override
	public MemberDTO getMember(String id) throws Exception {
		return sqlSession.selectOne("mapper.member.selectMemberById", id);
	} // getMember

	
	//3. 회원 가입(추가)
	@Override
	public boolean insertMember(MemberDTO member) throws Exception {
		return 0 != sqlSession.insert("mapper.member.insertMember", member);
	} //insertMember


	
	//4. 회원 수정하기(업데이트)
	@Override
	public boolean updateMember(MemberDTO member) throws Exception {
		return 0 != sqlSession.update("mapper.member.updateMember", member);
	} // updateMember

	
	//5. 회원 삭제하기
	@Override
	public boolean deleteMember(String id) throws Exception {
		return 0 != sqlSession.delete("mapper.member.deleteMember", id);
	} // deleteMember
		
	
	//6. 체크박스된 회원 삭제
	//	  삭제시 할  게시물아이디는 배열로 구성하여 list라는 이름으로 전달 한다 
	@Override
	public int deleteMembers(Map<String, Object> params) throws Exception {
		return sqlSession.delete("mapper.member.deleteMembers", params);
	 } // deleteMembers


	//7. 로그인
	@Override
	public MemberDTO loginMember(MemberDTO member) {
		return sqlSession.selectOne("mapper.member.selectMemberById",member);
	}



} // end class