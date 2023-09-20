package com.kosa.project_final.board.domain;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@Builder
@NoArgsConstructor
@AllArgsConstructor

public class CommentDTO {
	// 필드
	private int comment_boardid;// 게시글번호
	private int commentid; 		// 댓글번호 PK
	private String contents;	// 내용
	private String writer_uid;	// 글쓴이
	private Date reg_date;		// 작성날짜
	private Date mod_date;		// 수정날짜
	private String delete_yn; 	// 삭제유무

	
} // comment

