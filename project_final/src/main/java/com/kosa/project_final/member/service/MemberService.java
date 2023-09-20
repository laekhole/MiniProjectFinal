package com.kosa.project_final.member.service;

import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kosa.project_final.member.dao.MemberDAO;
import com.kosa.project_final.member.domain.MemberDTO;

@Service
public class MemberService {

	@Autowired
	private MemberDAO memberDAO;

	// 멤버서비스 재정의
	public MemberService() {

	}

	// 1. 회원 목록
	public List<MemberDTO> getMemberList() throws Exception {
		System.out.println("member.service.getMemberList() 함수 호출됨");

		return memberDAO.getMemberList();
	} // getMemberList

//	// 2. 회원 상세보기
//	public MemberDTO getMember(String id) throws Exception {
//		System.out.println("member.service.getMember() 함수 호출됨");
//		MemberDTO memberDTO = memberDAO.getMember(id);
//
//		return memberDTO;
//	} // getMember

	// 3. 회원 가입(추가)
	public boolean insertMember(MemberDTO member) throws Exception {
		System.out.println("member.service.memberInsert() 함수 호출됨");

		return memberDAO.insertMember(member);
	} // memberInsert

	// 4. 회원 수정하기(업데이트)
	public boolean updateMember(MemberDTO member) throws Exception {
		System.out.println("member.service.memberUpdate() 함수 호출됨");

		return memberDAO.updateMember(member);
	} // updateMember

	// 5. 회원 삭제하기
	public boolean deleteMember(String id) throws Exception {
		System.out.println("member.service.memberDelete() 함수 호출됨");

		return memberDAO.deleteMember(id);
	} // deleteMember

	// 6. 체크박스 회원 삭제하기
	public boolean deleteMembers(String[] ids) throws Exception {
		System.out.println("memberIds.toString() : " + Arrays.toString(ids));
		System.out.println("member.service.deleteMembers() 함수 호출됨");
		Map<String, Object> params = new HashMap<String, Object>();
		params.put("list", ids);
		return 0 != memberDAO.deleteMembers(params);
	} // deleteMembers

	// 7. 로그인
	public MemberDTO login(MemberDTO member) {
		System.out.println("member.service.login()함수 호출됨");
		return memberDAO.loginMember(member);
		
	// 8. 회원 아이디 찾기

	}

} // end class
