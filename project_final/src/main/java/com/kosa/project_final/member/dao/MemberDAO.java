package com.kosa.project_final.member.dao;

import java.util.List;
import java.util.Map;

import com.kosa.project_final.board.domain.BoardDTO;
import com.kosa.project_final.member.domain.MemberDTO;

public interface MemberDAO {
	
	//1. 회원 목록
	public List<MemberDTO> getMemberList() throws Exception;
	
	//2. 회원 정보 상세보기
	public MemberDTO getMember(String id) throws Exception;
	
	//3. 회원 가입(추가)
	public boolean insertMember(MemberDTO member) throws Exception; 
	
	//4. 회원 정보 수정하기(업데이트)
	public boolean updateMember(MemberDTO member) throws Exception;

	//5. 회원 탈퇴 (삭제)
	public boolean deleteMember(String id) throws Exception;
	
	//6. 체크된 회원 삭제
	public int deleteMembers(Map<String, Object> params) throws Exception;
	
	//7. 로그인
	public MemberDTO loginMember(MemberDTO member);

		
//	//7. (회원 목록에서)더보기 만들기
//	public List<MemberDTO> getMemberList2(MemberDTO member) throws Exception;
//	
//	//8. (회원 목록에서)회원 10개씩 돌아오게하는 메서드
//	public List<MemberDTO> getmemberListBoforeN(MemberDTO member) throws Exception;
//

	
} // end class
