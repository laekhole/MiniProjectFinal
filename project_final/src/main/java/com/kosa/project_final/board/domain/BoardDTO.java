package com.kosa.project_final.board.domain;

import java.sql.Date;
import java.util.List;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@Builder
@NoArgsConstructor
@AllArgsConstructor // 글쓰기
public class BoardDTO {

	// 필드
	private int pid; 			// 게시글 부모번호, 부모가 없을 때 : 0
	private int boardid; 		// 게시글번호
	private String title;		// 제목
	private String contents;	// 내용
	private String writer_uid;	// 글쓴이
	private String writer_email;// 글쓴이 메일주소(답글 받기용)
	private Date reg_date;		// 작성날짜
	private Date mod_date;		// 수정날짜
	private int view_count;		// 조회수
	private String delete_yn; 	// 삭제유무
	private String N;
	private int    level = 1; 

	private String [] ids;         // 삭제시 사용될 아이디들
	
	private List<AttacheFileDTO> attacheFileList;
	
	//검색필드
	private String searchTitle = "";
	
	//페이징
	private int pageNo = 1;     //현재 페이지 번호
	private int totalCount;     //전체 건수  
	private int totalPageSize;  //전체 페이지수  
	private int pageLength = 10;//한페이지의 길이 
	private int navSize = 10;   //페이지 하단에 출력되는 페이지의 항목수 
	private int navStart = 0;   //페이지 하단에 출력되는 페이지 시작 번호 : NavStart = (PageNo / NavSize) * NavSize + 1
	private int navEnd = 0;     //페이지 하단에 출력되는 페이지 끝 번호 : NavEnd = (PageNo / NavSize + 1) * NavSize
	
	// 글 작성 시 엔터키 역할 해주는 메서드
	public String getContentsHTML() {
		return contents != null ? contents.replace("\n", "<br/>") : "";
	}
	
	// 페이징 메소드
	public void setTotalCount(int totalCount) {
		//1. 
		this.totalCount = totalCount;
	
		//2. 전체 페이지 건수를 계산한다 
		totalPageSize = (int) Math.ceil((double) totalCount / pageLength);
		
		//3. 페이지 네비게이터 시작 페이지를 계산한다
		navStart = ((pageNo - 1) / navSize) * navSize + 1;
		
		//4. 페이지 네비게이터 끝 페이지를 계산한다
		navEnd = ((pageNo - 1) / navSize + 1) * navSize;
		
		//5. 전체 페이지 보다 크면 전체 페이지 값을 변경한다
		if (navEnd >= totalPageSize) {
			navEnd = totalPageSize;
		}
	}
	
	
	// 페이징 로직에 필요한 메소드. 페이지 시작 번호 계산
	public int getStartNo() {
		return (pageNo - 1) * pageLength + 1; 
	}
	
	
	// 페이징 로직에 필요한 메소드. 페이지 끝 번호 계산
	public int getEndNo() {
		return pageNo * pageLength; 
	}
	
} // board

