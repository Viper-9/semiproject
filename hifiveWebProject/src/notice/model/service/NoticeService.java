package notice.model.service;

import static common.JDBCTemplate.*;

import java.sql.Connection;
import java.util.ArrayList;

import notice.exception.NoticeException;
import notice.model.dao.NoticeDao;
import notice.model.vo.Notice;

public class NoticeService {
	
	public NoticeService(){}
	
	// 공지글 전체 조회
	public ArrayList<Notice> selectAllNotice() throws NoticeException {
		Connection con = getConnection();
		ArrayList<Notice> list = new NoticeDao().selectAllNotice(con);
		close(con);		
		return list;
	}
	
	// 공지글 제목으로 검색조회
	public ArrayList<Notice> selectTitle(String keyword) throws NoticeException{
		Connection con = getConnection();
		ArrayList<Notice> list = new NoticeDao().selectTitle(con, keyword);
		close(con);
		return list;
	}
	
	// 글 상세 페이지
	public Notice selectNotice(int noticeNo) throws BoardException {
		Connection con = getConnection();
		Notice notice = new NoticeDao().selectNotice(con, noticeNo);
		close(con);
		return notice;
	}
	
	// 글 작성
	public int insertNotice(Notice notice) throws BoardException {
		Connection con = getConnection();
		int result = new NoticeDao().insertNotice(con, notice);
		if(result > 0)
			commit(con);
		else
			rollback(con);
		close(con);
		return result;
	}
	
	// 수정
	public int updateNotice(Notice notice) throws BoardException {
		Connection con = getConnection();
		int result = new NoticeDao().updateNotice(con, notice);
		if(result > 0)
			commit(con);
		else
			rollback(con);
		close(con);
		return result;
	}
	
	// 삭제
	public int deleteNotice(int noticeNo) throws BoardException {
		Connection con = getConnection();
		int result = new NoticeDao().deleteNotice(con, noticeNo);
		if(result > 0)
			commit(con);
		else
			rollback(con);
		close(con);
		return result;
	}


}
