package com.kosa.project_final.board.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.kosa.project_final.board.domain.CommentDTO;
import com.kosa.project_final.board.service.CommentService;
import com.kosa.project_final.member.domain.MemberDTO;

@Controller
public class CommentController {
	
	@Autowired
	private CommentService commentService;

	
	
	
	
	


	
	
	
	
	
	
//	댓글 목록 R =====================================================================================

	
	// 1. 댓글 전체 목록 페이지 [초기 10개]
	@ResponseBody
	@RequestMapping("/comment/list.do")
	public Map<String, Object> list(CommentDTO comment, HttpServletRequest req) throws Exception {
    	System.out.println("comment.controller.list() invoked." + comment);

    	// 비동기 fetch로 넘겨주기 위한 셋팅
    	Map<String, Object> result = new HashMap<String, Object>();
    	List<CommentDTO> iWantCommentList = new ArrayList<>();
    	
    	// 로그인 세션 받아오기 위한 셋팅
    	HttpSession session = req.getSession();
		MemberDTO loginMember = (MemberDTO) session.getAttribute("loginMember");
    	
    	
		try {
			for (CommentDTO commentBoard : commentService.getCommentList(comment)) {
	           if(comment.getComment_boardid() == commentBoard.getComment_boardid()) {
	        	   	System.out.println("comment.getComment_boardid() 좌변 : "+ comment.getComment_boardid());
	        	   	System.out.println("commentBoard.getComment_boardid() 우변 : "+ commentBoard.getComment_boardid());
	        	   	System.out.println("commentBoard.getComment_boardid() 우변 : "+ commentBoard.getContents());
	        	   	
	        	   	iWantCommentList.add(commentBoard);
	           		} //if문 끝
	        	} //for문 끝
			
	        result.put("commentList", iWantCommentList);
	        result.put("loginMember", loginMember);
	        result.put("status", true);
	        
			} catch (Exception e) { 
        	result.put("status", false);
        	result.put("message", "서버에 오류 발생");
        	e.printStackTrace();
        }
		System.out.println(result);
		
		return result;
		
		
	} // list
	
	
	
	
	// 1-2. 댓글 전체 목록 페이지 [ajax로 페이징 출력] [더보기]
	@ResponseBody
	@RequestMapping(value="/comment/ajaxList.do")
	public Map<String, Object> ajaxList(CommentDTO comment, HttpServletRequest req, HttpServletResponse res) throws Exception {
    	System.out.println("comment.controller.ajaxlist()-> ajax invoked.");
    	Map<String, Object> result = new HashMap<String, Object>();
    	result = commentService.getCommentList2(comment);
    	
		try { 
        	result.put("status", true);
        } catch (Exception e) { 
        	result.put("status", false);
        	result.put("message", "서버에 오류 발생");
        	e.printStackTrace();
        }
		System.out.println(result);
		return result;
		
	} // list
	
	
	
//	댓글 글쓰기 C =====================================================================================

	// 2-1. 댓글 글쓰기
	@ResponseBody
	@RequestMapping(value = "/comment/insert.do", method = RequestMethod.POST)
	public Map<String,Object> insert(@RequestBody CommentDTO comment, HttpServletRequest req, HttpServletResponse res) throws Exception {
		System.out.println("comment.controller.insert() invoked.");
		
		System.out.println("글쓰기의 comment는 :  "+comment);
		System.out.println();
		
		HttpSession session = req.getSession();
		Map<String,Object> jsonResult = new HashMap<>();
		boolean status = false; 
		
		if((MemberDTO) session.getAttribute("loginMember")!= null) {
		MemberDTO member = (MemberDTO) session.getAttribute("loginMember");
		
		comment.setWriter_uid(member.getId());
		
		status = commentService.commentInsert(comment);
		}		
		
		System.out.println("0 :  "+comment);

		jsonResult.put("status", status);
		jsonResult.put("message", status ? "댓글이 등록되었습니다" : "로그인해주세요.");
		
		return jsonResult;
	
	} // insert


	
//	댓글 글 삭제 D =====================================================================================

	// 3-1. 댓글 글 삭제
	@ResponseBody
	@RequestMapping(value = "/comment/delete.do", method = RequestMethod.POST)
	public Map<String,Object> delete(@RequestBody CommentDTO comment, HttpServletRequest req, HttpServletResponse res) throws Exception {
		System.out.println("comment.controller.delete() invoked.");
		Map<String,Object> jsonResult=new HashMap<>();
		boolean status = commentService.commentDelete(comment.getCommentid());
		
		jsonResult.put("status", status);
		jsonResult.put("message", status ? "글이 삭제되었습니다" : "오류가 발생하였습니다. 다시 시도해주세요.");
		
		return jsonResult;
	} // delete


//	// 3-2. 체크박스 글 삭제
//	public String deleteBoards(String[] boardids, HttpServletRequest req, HttpServletResponse res) throws Exception {
//		System.out.println("board.controller.deleteBoards() invoked.");
//		JSONObject jsonResult = new JSONObject();
//		boolean status = commentService.deleteBoards(boardids);
//		
//		jsonResult.put("status", status);
//		jsonResult.put("message", status ? "글이 삭제되었습니다" : "오류가 발생하였습니다. 다시 시도해주세요.");
//		
//		return jsonResult.toString();
//	
//	}

	
//	댓글 글 수정 U =====================================================================================
	
	// 4.  댓글 글 수정
	@ResponseBody
	@RequestMapping(value = "/comment/update.do", method = RequestMethod.POST)
	public Map<String,Object> update(@RequestBody CommentDTO comment, HttpServletRequest req, HttpServletResponse res) throws Exception {
		System.out.println("board.controller.update() invoked.");
		
		HttpSession session = req.getSession();
		Map<String,Object> jsonResult = new HashMap<>();

		MemberDTO member = (MemberDTO) session.getAttribute("loginMember");
		comment.setWriter_uid(member.getId());
		
		boolean status = commentService.commentUpdate(comment);
		
		System.out.println("수정의 comment는 : "+comment);
		
		jsonResult.put("status", status);
		jsonResult.put("message", status ? "글이 수정되었습니다." : "오류가 발생하였습니다. 다시 시도해주세요.");
		
		return jsonResult;
		
	} // update
	

}
