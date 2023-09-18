package com.kosa.project_final.notice.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kosa.project_final.notice.domain.NoticeDTO;

@Repository("noticeDAO")
public class NoticeDAOImpl implements NoticeDAO {
	@Autowired
	private  SqlSession sqlSession;


	//1. 공지사항 목록
	@Override
	public List<NoticeDTO> getNoticeList() throws Exception {
		return sqlSession.selectList("mapper.notice.getNoticeList");
	}


	//2. 공지사항 상세
	@Override
	public NoticeDTO getNotice(int noticedid) throws Exception {
		return sqlSession.selectOne("mapper.notice.getNotice", noticedid);
	} // getNotice
	

	//3. 공지사항 글쓰기
	@Override
	public boolean insertNotice(NoticeDTO notice) throws Exception {
		return 0 != sqlSession.insert("mapper.notice.insertNotice", notice);
	} //insertNotice

	//4. 공지사항 수정
	@Override
	public boolean updateNotice(NoticeDTO notice) throws Exception {
		return 0 != sqlSession.update("mapper.notice.updateNotice", notice);
	} //updateNotice

	

	//5. 공지사항 삭제
	@Override
	public boolean deleteNotice(int noticeid) throws Exception {
		System.out.println("notice.noticeDAOImpl.noticeDelete() 함수 호출됨");
		return 0 != sqlSession.delete("mapper.notice.deleteNotice", noticeid);
	} // deleteNotice
	
	
	
	//6. 메인페이지 TOP5 뽑기
	@Override
	public List<NoticeDTO> noticeTop5() throws Exception {
		System.out.println("notice.noticeDAOImpl.noticeTop5() Top5 목록 함수 호출됨");
		return sqlSession.selectList("mapper.notice.noticeTop5");
	} // noticeTop5


	
	//7. 조회수 증가
	@Override
	public int viewCount(int noticeid) throws Exception {
		System.out.println("notice.noticeDAOImpl.viewCount() 함수 호출됨");
		return sqlSession.update("mapper.notice.noticeid", noticeid);
	} // viewCount


	
	//8. 체크박스된 게시글 삭제
	/*
	 * 삭제시 할  게시물아이디는 배열로 구성하여 list라는 이름으로 전달 한다 
	 */
	@Override
	public int deleteNotices(Map<String, Object> params) throws Exception {
		System.out.println("notice.noticeDAOImpl.deleteNotices() 함수 호출됨");
		return sqlSession.delete("mapper.notice.deleteNotices", params);
	 } // deleteNotices



	
	//9. [페이징] 공지사항 목록
	@Override
	public List<NoticeDTO> getNoticeList(NoticeDTO notice) throws Exception {
		return sqlSession.selectList("mapper.notice.getNoticeList", notice);
	}


	//10. [페이징]검색된 전체 건수 얻는다
	//	 공지사항 총 개수
	@Override
	public int getTotalCount(NoticeDTO notice) throws Exception {
		System.out.println("notice.noticeDAOImpl.getTotalCount() 함수 호출됨");
		return sqlSession.selectOne("mapper.notice.getTotalCount");
	}


	@Override
	public List<NoticeDTO> getNoticeListBeforeN(NoticeDTO notice, int length) throws Exception {
		System.out.println("notice.noticeDAOImpl.getNoticeListBoforeN() 함수 호출됨");
		return sqlSession.selectList("mapper.notice.getNoticeListBeforeN");

	}


	
	
	
	
} // end class