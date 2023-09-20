package com.kosa.project_final.board.dao;

import java.util.List;
import java.util.Map;

import com.kosa.project_final.board.domain.BoardDTO;

public interface BoardDAO {
	
	//1. 게시판 목록
	public List<BoardDTO> getBoardList() throws Exception;
	
	//2. 게시판 상세보기
	public BoardDTO getBoard(int boardId) throws Exception;
	
	//3. 게시판 글쓰기
	public boolean insertBoard(BoardDTO board) throws Exception; 
	
	//4. 게시판 수정하기
	public boolean updateBoard(BoardDTO board) throws Exception;

	//5. 게시판 삭제하기
	public boolean deleteBoard(int BoardId) throws Exception;
	
	//6. 메인에 TOP5 출력하기
	public List<BoardDTO> boardTop5() throws Exception;
	
	//7. 조회수 증가
	public int viewCount(int boardid) throws Exception;
	
	//8. 체크박스된 게시글 삭제
	public int deleteBoards(Map<String, Object> params) throws Exception;
		
	//9. 더보기 만들기
	public List<BoardDTO> getBoardList2(BoardDTO board) throws Exception;
	
	//10. 게시글 10개씩 돌아오게하는 메서드
	public List<BoardDTO> getboardListBoforeN(BoardDTO board) throws Exception;

	public int reply(BoardDTO board);

	public int getTotalCount(BoardDTO board);

	
} // end class
