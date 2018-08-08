package notice.model.dao;

import static common.JDBCTemplate.*;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

import notice.exception.NoticeException;
import notice.model.vo.Notice;

public class NoticeDao {
	
	public NoticeDao(){}

	// 전체 글 조회
	public ArrayList<Notice> selectAllNotice(Connection con) throws NoticeException {
		ArrayList<Notice> list = new ArrayList<Notice>();
		Statement stmt = null;
		ResultSet rset = null;
		
		String query = "select * from notice";
		
		try{
			stmt = con.createStatement();
			rset = stmt.executeQuery(query);
			
			while(rset.next()){
				Notice n = new Notice();
				n.setNotice_no(rset.getInt("notice_no"));
				n.setNotice_date(rset.getDate("notice_date"));
				n.setViews(rset.getInt("views"));
				n.setTitle(rset.getString("title"));
				n.setContent(rset.getString("content"));
				
				list.add(n);
				
				if(list.size() == 0)
					throw new NoticeException("전체 조회 실패");			
			}
		} catch(Exception e){
			e.printStackTrace();
			throw new NoticeException(e.getMessage());		
		} finally{
			close(rset);
			close(stmt);
		}		
		return list;
	}

	// 제목으로 검색조회
	public ArrayList<Notice> selectTitle(Connection con, String keyword) throws NoticeException {
		ArrayList<Notice> list = new ArrayList<Notice>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String query = "select * from notice where title like ?";
		
		try{
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, "%" + keyword + "%");
			
			while(rset.next()){
				Notice notice = new Notice();
				notice.setNotice_no(rset.getInt("notice_no"));
				notice.setNotice_date(rset.getDate("notice_date"));
				notice.setViews(rset.getInt("views"));
				notice.setTitle(rset.getString("title"));
				notice.setContent(rset.getString("content"));
				
				list.add(notice);
				
				if(list.size() == 0)
					throw new NoticeException("제목 검색 조회 실패");			
			}
		} catch(Exception e){
			e.printStackTrace();
			throw new NoticeException(e.getMessage());		
		} finally{
			close(rset);
			close(pstmt);
		}		
		return list;
	}

	// 글 내용 상세조회
	public Notice selectNotice(Connection con, int noticeNo) throws NoticeException {
		Notice notice = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String query = "select * from notice where notice_no = ?";
		
		try{
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, noticeNo);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()){
				notice = new Notice();
				notice.setNotice_no(rset.getInt("notice_no"));
				notice.setNotice_date(rset.getDate("notice_date"));
				notice.setViews(rset.getInt("views"));
				notice.setTitle(rset.getString("title"));
				notice.setContent(rset.getString("content"));
				
				
				if(notice == null)
					throw new NoticeException("제목 검색 조회 실패");			
			}
		} catch(Exception e){
			e.printStackTrace();
			throw new NoticeException(e.getMessage());		
		} finally{
			close(rset);
			close(pstmt);
		}		
		return notice;
	}

	// 공지글 입력
	public int insertNotice(Connection con, Notice notice) throws NoticeException {
		int result = 0;
		PreparedStatement pstmt = null; 
		
		String query = "insert into notice values (?, default, default, ?, ?)";

		try {
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, notice.getNotice_no());
			pstmt.setString(2, notice.getTitle());
			pstmt.setString(3, notice.getContent());
			
			result = pstmt.executeUpdate();
			
			if(result <= 0)
				throw new NoticeException("공지글 입력 실패");
		} catch(Exception e){
			e.printStackTrace();
			throw new NoticeException(e.getMessage());
		} finally{
			close(pstmt);
		}		
		return result;	
	}

	// 공지글 수정
	public int updateNotice(Connection con, Notice notice) throws NoticeException {
		int result = 0;
		PreparedStatement pstmt = null;

		String query = "update notice set "
				+ "title = ?, content = ? "
				+ "where notice_no = ?";
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, notice.getTitle());
			pstmt.setString(2, notice.getContent());
			pstmt.setInt(3, notice.getNotice_no());
			
			result = pstmt.executeUpdate();
			
			if(result <= 0)
				throw new NoticeException("공지 수정 실패");			
		} catch(Exception e){
			e.printStackTrace();
			throw new NoticeException(e.getMessage());
		} finally{
			close(pstmt);
		}		
		return result;	
	}
	
	// 공지글 삭제
	public int deleteNotice(Connection con, int noticeNo) throws NoticeException {
		int result = 0;
		PreparedStatement pstmt = null;
		
		String query = "delete from notice where notice_no = ?";
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, noticeNo);
			
			result = pstmt.executeUpdate();
			
			if(result <= 0)
				throw new NoticeException(noticeNo + "번 공지 삭제 실패!");
		} catch(Exception e){
			e.printStackTrace();
			throw new NoticeException(e.getMessage());
		} finally{
			close(pstmt);
		}		
		return result;		
	}
}