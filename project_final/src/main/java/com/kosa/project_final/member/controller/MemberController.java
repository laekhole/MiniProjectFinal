package com.kosa.project_final.member.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.RequestDispatcher;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.kosa.project_final.member.dao.MemberDAOImpl;
import com.kosa.project_final.member.domain.MemberDTO;
import com.kosa.project_final.member.service.MemberService;

import lombok.extern.slf4j.Slf4j;


@Slf4j

@Controller
public class MemberController {

	@Autowired
	private MemberService memberService;
	

//	// 1. 회원 목록 [더보기]로 돼있는데, [페이지]로 바꿀 것  [관리자용]
//	// 모든 view로 이동하는 메소드는 MainController에 있음
//	@RequestMapping("/admin/memberList.do")
//	public String list(MemberDTO member, Model model) throws Exception {
//		System.out.println("member.controller.list() invoked.");
//
//		try {
//			model.addAttribute("memberList", memberService.getMemberList());
//		} catch (Exception e) {
//			e.printStackTrace();
//		}
//
//		return "admin/memberList";
//
//	} // list

	// 2. 회원 상세보기
	@ResponseBody
	@RequestMapping(value = "/member/detail.do")
	public Map<String, Object> detail(HttpServletRequest req, HttpServletResponse res) throws Exception {

		System.out.println("member.controller.detail() invoked.");
		HttpSession session = req.getSession();
		boolean status = false;
		Map<String,Object> jsonResult=new HashMap<>();
		
		System.out.println("멤버컨트롤러 디테일 메소드에서 세션 로그인 속성 확인 : "+session.getAttribute("loginMember"));
		MemberDTO member = (MemberDTO) session.getAttribute("loginMember");

		status = true;
		jsonResult.put("member", member);
		jsonResult.put("status", status);
		
		return jsonResult;
	} // detail

	// 3. 회원 가입(추가)
	@ResponseBody
	@RequestMapping(value = "/member/insert.do", method = RequestMethod.POST)
	public Map<String, Object> MemberInsert(@RequestBody MemberDTO member, HttpServletRequest req, HttpServletResponse res) throws Exception {
		System.out.println("멤버 컨트롤러 멤버인서트 메소드 진입1");
		boolean status = false;
		Map<String,Object> jsonResult=new HashMap<>();
		if(memberService.insertMember(member)) status=true;
		jsonResult.put("status", status);
		
		return jsonResult;
	}

	
	
	
	
	// 4. 회원 수정하기(업데이트)
	@ResponseBody
	@RequestMapping(value = "/member/update.do", method = RequestMethod.POST)
	public Map<String,Object> MemberUpdate(@RequestBody MemberDTO member, HttpServletRequest req, HttpServletResponse res) throws Exception {
		System.out.println("멤버 컨트롤러 멤버업데이트 메소드 진입1");
		HttpSession session = req.getSession();
		boolean status = false;
		Map<String,Object> jsonResult=new HashMap<>();
		if(memberService.updateMember(member)) {
			status=true;	
			session.setAttribute("loginMember", member);
		}
		jsonResult.put("status", status);
		
		return jsonResult;
	}

	// 5. 회원 삭제하기
	@ResponseBody
	@RequestMapping(value = "/member/delete.do")
	public Map<String,Object> MemberDelete(HttpServletRequest req, HttpServletResponse res) throws Exception {
		
		System.out.println("controller.MemberDelete() invoked. ");
		boolean status = false;
		HttpSession session = req.getSession();
		Map<String,Object> jsonResult=new HashMap<>();
		
		MemberDTO member = (MemberDTO) session.getAttribute("loginMember");
		System.out.println(member);
		
		if(memberService.deleteMember(member.getId())) {
			status=true;
			session.invalidate();
		}
		jsonResult.put("status", status);
		
		return jsonResult;
	}
//		boolean success = false;
//		int row = 0;
//		String id = req.getParameter("id");
//		String pwd = req.getParameter("pwd");
//
//		System.out.println(id);
//		System.out.println(pwd);
//
//		req.setAttribute("id", id);
//		req.setAttribute("pwd", pwd);
//
//		try {
//			MemberService service = new MemberService(new MemberDAOImpl());
//			row = service.MemberDelete(id);
//
//			if (row > 0) {
//
//				HttpSession session = req.getSession(true);
//				session.setAttribute("loginMember", service.memberGet(id));
//				session.invalidate();
//
//				success = true;
//				System.out.println("회원탈퇴 성공 : " + success);
//			} else {
//
//				System.out.println("회원탈퇴 실패 : " + success);
//				success = false;
//			}
//
//			req.setAttribute("success", success);
//
//			System.out.println("member.controller.MemberDelete 서블릿 결과로 넘어감");
//
//			RequestDispatcher dis = req.getRequestDispatcher("/WEB-INF/views/jsp/member/memberDeleteResult.jsp");
//
//			dis.forward(req, res);
//			System.out.println("member.controller.memberPwdFindResult 비밀번호찾기 결과 JSP로 전달됨");
//
//		} catch (Exception e) {
//			e.printStackTrace();
//		}
//
//	}

//	// 7. 회원 아이디 찾기
//	@RequestMapping(value = "/member/findId.do", method = RequestMethod.GET)
//	public String MemberIdFind(HttpServletRequest req, HttpServletResponse res) {
//		System.out.println("member.controller.memberIdFind 아이디 찾기 서블릿 진입");
//		String id;
//		boolean success = false;
//
//		String name = req.getParameter("uname");
//		String phone = req.getParameter("phone");
//
//		System.out.println(name);
//		System.out.println(phone);
//
//		try {
//			MemberService service = new MemberService(new MemberDAOImpl());
//			id = service.MemberFindId(name, phone);
//			req.setAttribute("id", id);
//			req.setAttribute("name", name);
//
//			System.out.println(id);
//			System.out.println(name);
//
//			System.out.println("member.controller.MemberIdFind 서블릿 호출됨");
//
//			RequestDispatcher dis = req.getRequestDispatcher("/WEB-INF/views/jsp/member/memberIdFindResult.jsp");
//
//			dis.forward(req, res);
//			System.out.println("member.controller.memberLogin 로그인 서블릿 JSP로 전달됨");
//
//		} catch (Exception e) {
//			e.printStackTrace();
//		}
//
//	}
	
	// 8. 로그인
	@ResponseBody
	@RequestMapping(value = "/member/login.do", method = RequestMethod.POST)
	public Map<String, Object> login(@RequestBody MemberDTO member, HttpServletRequest req, HttpServletResponse res) {
		System.out.println("member.controller.login 로그인 진입1");
		HttpSession session = req.getSession(true);
		boolean status = false;
		Map<String,Object> jsonResult=new HashMap<>();
		MemberDTO loginMember = memberService.login(member);
		try {
			if ( (member.getId().equals(loginMember.getId())) && (member.getPwd().equals(loginMember.getPwd())) ) {
				session.setAttribute("loginMember", loginMember);
				status = true;
				System.out.println("멤버 컨트롤러 로그인 성공");
			} else {
				System.out.println("멤버 컨트롤러  로그인 실패");
			}
			jsonResult.put("status", status);

		} catch (Exception e) {
			e.printStackTrace();
		}
		return jsonResult;
	}
	
	// 8-2. 관리자 로그인
	@ResponseBody
	@RequestMapping(value = "/admin", method = RequestMethod.POST)
	public Map<String, Object> adminLlogin(@RequestBody MemberDTO member, HttpServletRequest req, HttpServletResponse res) {
		System.out.println("member.controller.login 로그인 진입1");
		HttpSession session = req.getSession(true);
		boolean status = false;
		Map<String,Object> jsonResult=new HashMap<>();
		MemberDTO loginMember = memberService.login(member);
		try {
			if ( (member.getId().equals(loginMember.getId())) && (member.getPwd().equals(loginMember.getPwd())) ) {
				session.setAttribute("loginMember", loginMember);
				status = true;
				System.out.println("멤버 컨트롤러 로그인 성공");
			} else {
				System.out.println("멤버 컨트롤러  로그인 실패");
			}
			jsonResult.put("status", status);

		} catch (Exception e) {
			e.printStackTrace();
		}
		return jsonResult;
	}
	
	
	// 9. 로그아웃
	@ResponseBody
	@RequestMapping(value = "/member/logout.do")
	public Map<String, Object> logout(HttpServletRequest req, HttpServletResponse res) {
		System.out.println("member.controller.logout 로그아웃 진입");
		HttpSession session = req.getSession(true);
		boolean status = true;
		Map<String,Object> jsonResult=new HashMap<>();
		session.invalidate();
		jsonResult.put("status", status);
		return jsonResult;
	}
	
	
//	//. 회원 비밀번호 찾기
//	@RequestMapping(value = "/member/findPwd.do", method = RequestMethod.GET)
//	public String MemberPwdFind(HttpServletRequest req, HttpServletResponse res) {
//		req.setCharacterEncoding("UTF-8");
//		System.out.println("member.controller.memberPwdFind 비밀번호 찾기 서블릿 진입");
//
//		String pwd;
//
//		String id = req.getParameter("id");
//		String name = req.getParameter("uname");
//
//		System.out.println(id);
//		System.out.println(name);
//
//		try {
//			MemberService service = new MemberService(new MemberDAOImpl());
//			pwd = service.MemberFindPwd(id, name);
//			System.out.println("비밀번호 찾음 : " + pwd);
//			req.setAttribute("name", id);
//			req.setAttribute("pwd", pwd);
//
//			System.out.println("아이디넘어감~ : " + id);
//			System.out.println("비번넘어감~ : " + pwd);
//
//			System.out.println("member.controller.MemberPwdFind 서블릿 호출됨");
//
//			RequestDispatcher dis = req.getRequestDispatcher("/WEB-INF/views/jsp/member/memberPwdFindResult.jsp");
//
//			dis.forward(req, res);
//			System.out.println("member.controller.memberPwdFindResult 비밀번호찾기 결과 JSP로 전달됨");
//
//		} catch (Exception e) {
//			e.printStackTrace();
//		}
//
//	}

} // end class
