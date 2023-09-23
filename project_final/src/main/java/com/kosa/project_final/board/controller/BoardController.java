package com.kosa.project_final.board.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.kosa.project_final.board.domain.BoardDTO;
import com.kosa.project_final.board.service.BoardService;
import com.kosa.project_final.member.domain.MemberDTO;

/*
 <더보기 만들기>
 ajax -> 서버에서 HTML 생성해서 클라이언트에서 출력
 	  -> 순수 DATA만 서버에 전달하고 클라이언트에서 HTML생성 (서버에 부담이 적기때문에 이 방법으로 하기)

 1. DB에서 자료를 얻는 방법
 1) 처음 10건 추출하는 방법
 2) 다음 10건을 얻는 방법
 
 2. 순수 DATA만 서버에 전달
 
 3. 클라이언트에서 전달받는 DATA를 이용해서 HTML 출력
 
*/

@Controller
public class BoardController {
	
	@Autowired
	private BoardService boardService;
	
//	첨부파일 local Repository
//	private static final String CURR_IMAGE_REPO_PATH = "C:\\file_repo";

	
//	게시판 목록 =====================================================================================

	
	// 1. 게시판 전체 목록 페이지[더보기]
	@RequestMapping("/board/list.do")
	public String list(BoardDTO board, Model model, HttpSession session) throws Exception {
    	System.out.println("board.controller.list() invoked." + board);

    	try { 

    		MemberDTO loginMember = (MemberDTO) session.getAttribute("loginMember");
    		board.setTotalCount(boardService.getTotalCount(board));

    		model.addAttribute("result", boardService.getBoardList2(board));
    		model.addAttribute("loginMember", loginMember);

    	} catch (Exception e) {
        	e.printStackTrace();
        }

		return "board/boardList";
	} // list


	// 1-2. 게시판 전체 목록 페이지 [ajax로 페이징 출력]
	@ResponseBody
	@RequestMapping(value="/board/ajaxList.do")
	public Map<String, Object> ajaxList(BoardDTO board, HttpServletRequest req, HttpServletResponse res) throws Exception {
    	System.out.println("board.controller.ajaxlist()-> ajax invoked.");
    	Map<String, Object> result = new HashMap<String, Object>();
    	result = boardService.getBoardList2(board);
    	
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
	
	
	
	
//	게시판 상세 =====================================================================================

	// 2. 게시판 상세 페이지
	@ResponseBody
	@RequestMapping(value="/board/detail.do", method = RequestMethod.POST)
	public Map<String, Object> detail(@RequestBody BoardDTO board, HttpServletRequest req, HttpServletResponse res) throws Exception {
		System.out.println("board.controller.detail() invoked.");

		HttpSession session = req.getSession();
		boolean status = false;
		Map<String,Object> jsonResult=new HashMap<>();
		
		MemberDTO loginMember = (MemberDTO) session.getAttribute("loginMember");
		BoardDTO boardView = boardService.getBoard(board.getBoardid());  //게시글 상세 business logic
		
		System.out.println("			니가 이기나 내가 이기나 함 해보자");
		System.out.println("board부터 찍자 "+board);
//		System.out.println("board.getBoardid() : "+board.getBoardid());
//		System.out.println("boardView.getBoardid() : "+boardView.getBoardid());
//		System.out.println("			니가 이기나 내가 이기나 함 해보자");

		boardService.viewCount(boardView.getBoardid());  //조회수 증가 비즈니스 로직
		
		System.out.println("boardView가 뭐가 들어왔니 ? : "+boardView);
		
		status = true;
		jsonResult.put("loginMember", loginMember);
		jsonResult.put("boardView", boardView);
		jsonResult.put("status", status);
		
		return jsonResult;
	} // detail


	// 2. 게시판 상세 페이지
	@RequestMapping(value="/board/replyForm.do", method = RequestMethod.POST)
	public String replyForm(BoardDTO board, Model model) throws Exception {
		System.out.println("board.controller.detail() invoked.");
		System.out.println("board " + board);

		try {
			model.addAttribute("status", true);
			BoardDTO boardView = boardService.getBoard(board.getBoardid());
			System.out.println("bordView = " + boardView);
			model.addAttribute("board", boardView);
        } catch (Exception e) { 
        	model.addAttribute("status", false);
        	model.addAttribute("message", "서버에 오류 발생");
        	e.printStackTrace();
        }

		return "board/replyForm";
	} // detail


	
	
//	첨부파일 관련 답글
//	@RequestMapping(value="/board/reply.do", method = RequestMethod.POST)
//	public String reply(BoardDTO board, Model model,
//			MultipartHttpServletRequest multipartRequest
//			) throws Exception {
//		System.out.println("board.controller.detail() invoked.");
//		System.out.println("board " + board);
//		
//		multipartRequest.setCharacterEncoding("utf-8");
//		Map map = new HashMap();
//		Enumeration enu=multipartRequest.getParameterNames();
//		while(enu.hasMoreElements()){
//			String name=(String)enu.nextElement();
//			String value=multipartRequest.getParameter(name);
//			//System.out.println(name+", "+value);
//			map.put(name,value);
//		}
//		
//		board.setAttacheFileList(fileProcess(multipartRequest));
//		
//		try {
//			model.addAttribute("status", true);
//			board.setWriter_uid("bbb");
//			boardService.reply(board);
//        } catch (Exception e) { 
//        	model.addAttribute("status", false);
//        	model.addAttribute("message", "서버에 오류 발생");
//        	e.printStackTrace();
//        }
//
//		return "redirect:list.do";
//	} // detail
	
	
	
//	첨부파일
//	private List<AttacheFileDTO> fileProcess(MultipartHttpServletRequest multipartRequest) throws Exception{
//		List<AttacheFileDTO> fileList = new ArrayList<>();
//		Iterator<String> fileNames = multipartRequest.getFileNames();
//		Calendar now = Calendar.getInstance();
//		SimpleDateFormat sdf = new SimpleDateFormat("\\yyyy\\MM\\dd");
//		
//		while(fileNames.hasNext()){
//			String fileName = fileNames.next();
//			MultipartFile mFile = multipartRequest.getFile(fileName);
//			String fileNameOrg = mFile.getOriginalFilename();
//			String realFolder = sdf.format(now.getTime());
//			
//			File file = new File(CURR_IMAGE_REPO_PATH + realFolder);
//			if (file.exists() == false) {
//				file.mkdirs();
//			}
//
//			String fileNameReal = UUID.randomUUID().toString();
//			
//			//파일 저장 
//			mFile.transferTo(new File(file, fileNameReal)); //임시로 저장된 multipartFile을 실제 파일로 전송
//
//			fileList.add(
//					AttacheFileDTO.builder()
//					.fileNameOrg(fileNameOrg)
//					.fileNameReal(realFolder + "\\" + fileNameReal)
//					.length((int) mFile.getSize())
//					.contentType(mFile.getContentType())
//					.build()
//					);
//		}
//		return fileList;
//	}	
	
	
	
//	게시판 글쓰기 =====================================================================================

	// 3-1. 게시판 글쓰기
	@ResponseBody
	@RequestMapping(value = "/board/insert.do", method = RequestMethod.POST)
	public Map<String,Object> insert(@RequestBody BoardDTO board, HttpServletRequest req, HttpServletResponse res) throws Exception {
		System.out.println("board.controller.insert() invoked.");
		
		System.out.println("board는 :  "+board);
		System.out.println();
		HttpSession session = req.getSession();
		Map<String,Object> insertControllerResult = new HashMap<>();

		MemberDTO member = (MemberDTO) session.getAttribute("loginMember");
		board.setWriter_uid(member.getId());
		board.setWriter_email(member.getEmail());
		
		boolean status = boardService.boardInsert(board);
		
		System.out.println("board는 : "+board);

		insertControllerResult.put("status", status);
		insertControllerResult.put("message", status ? "글이 등록되었습니다" : "오류가 발생하였습니다. 다시 시도해주세요.");
		
		return insertControllerResult;
	
	} // insert

	
	// 3-2. 게시판 답글쓰기
	@ResponseBody
	@RequestMapping(value = "/board/insertReply.do", method = RequestMethod.POST)
	public Map<String,Object> insertReply(@RequestBody BoardDTO board, HttpServletRequest req, HttpServletResponse res) throws Exception {
		System.out.println("board.controller.insertReply() invoked.");
		
		HttpSession session = req.getSession();
		Map<String,Object> jsonResult = new HashMap<>();
		
		System.out.println("insertReply에서 board는 1번 : "+board);
		
		MemberDTO member = (MemberDTO) session.getAttribute("loginMember");
		board.setWriter_uid(member.getId());
		
		boolean status = boardService.boardInsertReply(board);
		
		System.out.println("insertReply에서 board는 2번 : "+board);

		jsonResult.put("status", status);
		jsonResult.put("message", status ? "글이 등록되었습니다" : "오류가 발생하였습니다. 다시 시도해주세요.");
		
		return jsonResult;
	
	} // insertReply
	
	
//	게시판 글 삭제 =====================================================================================

	// 4-1. 게시판 글 삭제
	@ResponseBody
	@RequestMapping(value = "/board/delete.do", method = RequestMethod.POST)
	public Map<String,Object> delete(@RequestBody BoardDTO board, HttpServletRequest req, HttpServletResponse res) throws Exception {
		System.out.println("board.controller.delete() invoked.");
		Map<String,Object> jsonResult=new HashMap<>();
		boolean status = boardService.boardDelete(board.getBoardid());
		
		jsonResult.put("status", status);
		jsonResult.put("message", status ? "글이 삭제되었습니다" : "오류가 발생하였습니다. 다시 시도해주세요.");
		
		return jsonResult;
	} // delete


//	// 4-2. 체크박스 글 삭제
//	public String deleteBoards(String[] boardids, HttpServletRequest req, HttpServletResponse res) throws Exception {
//		System.out.println("board.controller.deleteBoards() invoked.");
//		JSONObject jsonResult = new JSONObject();
//		boolean status = boardService.deleteBoards(boardids);
//		
//		jsonResult.put("status", status);
//		jsonResult.put("message", status ? "글이 삭제되었습니다" : "오류가 발생하였습니다. 다시 시도해주세요.");
//		
//		return jsonResult.toString();
//	
//	}

	
//	게시판 글 수정 =====================================================================================
	
	// 5.  게시판 글 수정
	@ResponseBody
	@RequestMapping(value = "/board/update.do", method = RequestMethod.POST)
	public Map<String,Object> update(@RequestBody BoardDTO board, HttpServletRequest req, HttpServletResponse res) throws Exception {
		System.out.println("board.controller.update() invoked.");
		
		HttpSession session = req.getSession();
		Map<String,Object> jsonResult = new HashMap<>();

		MemberDTO member = (MemberDTO) session.getAttribute("loginMember");
		board.setWriter_uid(member.getId());
		
		boolean status = boardService.boardUpdate(board);
		
		System.out.println("board는 : "+board);
		
		jsonResult.put("status", status);
		jsonResult.put("message", status ? "글이 수정되었습니다." : "오류가 발생하였습니다. 다시 시도해주세요.");
		
		return jsonResult;
		
	} // update
	
}
