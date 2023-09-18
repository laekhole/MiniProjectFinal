package com.kosa.project_final.main.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kosa.project_final.board.domain.BoardDTO;
import com.kosa.project_final.board.service.BoardService;
import com.kosa.project_final.notice.domain.NoticeDTO;
import com.kosa.project_final.notice.service.NoticeService;

@Controller
public class MainController {
	
	@Autowired
	private BoardService boardService;
	
	@Autowired
	private NoticeService noticeService;

	@RequestMapping(value = {"/", "/main.do"})
	public String main(HttpServletRequest req, HttpServletResponse res) throws Exception {
    	System.out.println("main() invoked. ");
		
		try { 
			List<NoticeDTO> noticeTop5 = noticeService.noticeTop5();
        	req.setAttribute("noticeTop5", noticeTop5);
        	System.out.println("req : "+req.getAttribute("noticeTop5"));
        	List<BoardDTO> boardTop5 = boardService.boardTop5();
        	req.setAttribute("boardTop5", boardTop5);
        } catch (Exception e) { 
        	e.printStackTrace();
        }

		return "main";
		
	} // main
	

	@RequestMapping(value = {"/member/boardList.do"})
	public String boardList(HttpServletRequest req, HttpServletResponse res) throws Exception {
    	System.out.println("adminNoticeList() invoked. ");

		return "board/boardList";
		
	} // board/boardList    게시판목록
	
	@RequestMapping(value = {"/member/noticeList.do"})
	public String noticeList(HttpServletRequest req, HttpServletResponse res) throws Exception {
    	System.out.println("adminBoardList() invoked. ");

		return "notice/noticeList";
		
	} // notice/noticeList  공지사항목록
	
///////////////////////////일반회원끝///////////////////////////////////	
////////////////////////////관리자/////////////////////////////////////
	
	@RequestMapping(value = {"/admin/", "/admin/main.do"})
	public String adminMain(HttpServletRequest req, HttpServletResponse res) throws Exception {
    	System.out.println("main() invoked. ");
		
		try { 
			List<NoticeDTO> noticeTop5 = noticeService.noticeTop5();
        	req.setAttribute("noticeTop5", noticeTop5);
        	System.out.println("req : "+req.getAttribute("noticeTop5"));
        	List<BoardDTO> boardTop5 = boardService.boardTop5();
        	req.setAttribute("boardTop5", boardTop5);
        } catch (Exception e) { 
        	e.printStackTrace();
        }

		return "admin/main";
		
	} // admin/main

	@RequestMapping(value = {"/admin/memberList.do"})
	public String adminMemberList(HttpServletRequest req, HttpServletResponse res) throws Exception {
    	System.out.println("adminMemberList() invoked. ");

		return "admin/memberList";
		
	} // admin/memberList
//	
	@RequestMapping(value = {"/admin/noticeList.do"})
	public String adminBoardList(HttpServletRequest req, HttpServletResponse res) throws Exception {
    	System.out.println("adminNoticeList() invoked. ");

		return "admin/noticeList";
		
	} // admin/memberList
//	
	@RequestMapping(value = {"/admin/boardList.do"})
	public String adminNoticeList(HttpServletRequest req, HttpServletResponse res) throws Exception {
    	System.out.println("adminBoardList() invoked. ");

		return "admin/boardList";
		
	} // admin/memberList
//	
} // end class
