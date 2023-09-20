//package com.kosa.project_final.board.service;
//
//import java.util.Arrays;
//import java.util.HashMap;
//import java.util.List;
//import java.util.Map;
//
//import org.springframework.beans.factory.annotation.Autowired;
//import org.springframework.stereotype.Service;
//
//import com.kosa.project_final.board.dao.AttacheFileDAO;
//import com.kosa.project_final.board.dao.BoardDAO;
//import com.kosa.project_final.board.domain.AttacheFileDTO;
//import com.kosa.project_final.board.domain.BoardDTO;
//
//@Service
//public class BoardService3 {
//	
//	@Autowired
//	private BoardDAO boardDAO;
//	
//	@Autowired
//	private AttacheFileDAO attacheFileDAO;
//
//	// 게시판 재정의
//	public BoardService3() {
//	
//	}
//	
//	//1. 게시판 목록
//	public List<BoardDTO> getBoardList() throws Exception {
//		System.out.println("board.service.getBoardList() 함수 호출됨");
//	      
//		return boardDAO.getBoardList();
//		
//	} // getBoardList
//		
//	
//	//2. 게시판 상세보기
//	public BoardDTO getBoard(int boardid) throws Exception {
//		System.out.println("board.service.getBoard() 함수 호출됨");
//		
//		BoardDTO boardDTO = boardDAO.getBoard(boardid);
//		boardDTO.setAttacheFileList(attacheFileDAO.getList(boardDTO));
//		
//		return boardDAO.getBoard(boardid);
//	} // getBoard
//	
//	
//	//3. 게시판 글쓰기
//	public boolean boardInsert(BoardDTO board) throws Exception {
//		System.out.println("board.service.boardInsert() 함수 호출됨");
//		
//		return boardDAO.insertBoard(board);
//	} // boardInsert
//	
//	//3-2. 게시판 글쓰기
//	public boolean boardInsertReply(BoardDTO board) throws Exception {
//		System.out.println("board.service.boardInsert() 함수 호출됨");
//		
//		return 0 != boardDAO.reply(board);
//	} // boardInsert
//	
//	
//	//4. 게시판 수정하기
//	public boolean boardUpdate(BoardDTO board) throws Exception {
//		System.out.println("board.service.boardUpdate() 함수 호출됨");
//		
//		return boardDAO.updateBoard(board);
//	} // updateBoard
//
//	
//	//5. 게시판 삭제하기
//	public boolean boardDelete(int boardid) throws Exception {
//		System.out.println("board.service.boardDelete() 함수 호출됨");
//
//		return boardDAO.deleteBoard(boardid);
//	} // deleteBoard
//
//	
//	//6. 메인에 TOP5 출력하기
//	public List<BoardDTO> boardTop5() throws Exception {
//		System.out.println("board.service.boardTop5() 함수 호출됨");
//		
//		return boardDAO.boardTop5();
//	} // boardTop5
//	
//	
//	//7. 조회수 증가
//	public int viewCount(int boardid) throws Exception {
//		System.out.println("board.service.viewCount() 함수 호출됨");
//		
//		return boardDAO.viewCount(boardid);
//	} // viewCount
//	
//	
//	//8. 체크박스 게시글 삭제하기
//	public boolean deleteBoards(String[] boardids) throws Exception {
//		System.out.println("boardIds.toString() : " + Arrays.toString(boardids));
//		System.out.println("board.service.deleteBoards() 함수 호출됨");
//		Map<String, Object> params = new HashMap<String, Object>();
//		params.put("list", boardids);
//		return 0 != boardDAO.deleteBoards(params);
//	} // deleteBoards
//	
//	
//	//9. 페이징 처리된 리스트 출력하기
//	public Map<String, Object> getBoardList2(BoardDTO board) throws Exception {
//		System.out.println("board.service.getBoardList2() 함수 호출됨 1번 -> " + board);
////		//1. 전체 건수를 얻는다
//		board.setTotalCount(boardDAO.getTotalCount(board));
//
//
//		Map<String, Object> result = new HashMap<>();
//		
//		result.put("board", board);
//
//		result.put("list", boardDAO.getBoardList2(board));
//		
//		System.out.println("result 맵 내용: " + result);
//		return result;
//		
//	} // getBoardList2
//
////	//9. 더보기 출력하기
////	public List<BoardDTO> getBoardList2(BoardDTO board) throws Exception {
////		System.out.println("board.service.getBoardList2() 함수 호출됨 1번 -> " + board);
////
////		board.setTotalCount(boardDAO.getTotalCount(board));
////
////		Map<String, Object> result = new HashMap<>();
////		
////		
////		
////		System.out.println("board.service.getBoardList2() 함수 호출됨 2번 -> " + board);
////		
////		
////		
////		return boardDAO.getBoardList2(board);
////	} // getBoardList2
//	
//	
//	
//	
//	
//	public int reply(BoardDTO board) {
//	
//		int result = boardDAO.reply(board);
//		
//		if (board.getAttacheFileList() != null) {
//			for (AttacheFileDTO attacheFile : board.getAttacheFileList()) {
//				attacheFile.setBoardid(board.getBoardid());
//				attacheFileDAO.insert(attacheFile);
//			}
//		}
//		
//		return result; 
//	}
//	
//	public int getTotalCount(BoardDTO board) throws Exception {
//		System.out.println("BoardService.getTotalCount() 함수 호출됨");
//		System.out.println("BoardService의 boardDAO.getTotalCount(board) : "+boardDAO.getTotalCount(board));
//		return boardDAO.getTotalCount(board);
//	}
//
//
//} // end class
