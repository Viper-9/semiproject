package report.model.service;

import static common.JDBCTemplate.close;
import static common.JDBCTemplate.commit;
import static common.JDBCTemplate.getConnection;
import static common.JDBCTemplate.rollback;

import java.sql.Connection;
import java.util.ArrayList;

import report.exception.ReportException;
import report.model.dao.ReportDao;
import report.model.vo.Report;

public class ReportService {
	public ReportService(){}

	public int getListCount() throws ReportException {
		Connection con = getConnection();
		int listCount = new ReportDao().getListCount(con);
		close(con);
		return listCount;
	}

	// 신고게시판 전체 조회
	public ArrayList<Report> selectAllReport() throws ReportException {
		Connection con = getConnection();
		ArrayList<Report> list = new ReportDao().selectAllReport(con);
		close(con);		
		return list;
	}
	
	// 신고게시판 제목으로 검색조회
	public ArrayList<Report> selectTitle(String keyword) throws ReportException{
		Connection con = getConnection();
		ArrayList<Report> list = new ReportDao().selectTitle(con, keyword);
		close(con);
		return list;
	}
	
	// 글 상세 페이지
	public Report selectReport(int ReportNo) throws ReportException {
		Connection con = getConnection();
		Report Report = new ReportDao().selectReport(con, ReportNo);
		close(con);
		return Report;
	}
	
	// 글 작성
	public int insertReport(Report Report) throws ReportException {
		Connection con = getConnection();
		int result = new ReportDao().insertReport(con, Report);
		if(result > 0)
			commit(con);
		else
			rollback(con);
		close(con);
		return result;
	}
	
	// 수정
	public int updateReport(Report Report) throws ReportException {
		Connection con = getConnection();
		int result = new ReportDao().updateReport(con, Report);
		if(result > 0)
			commit(con);
		else
			rollback(con);
		close(con);
		return result;
	}
	
	// 삭제
	public int deleteReport(int ReportNo) throws ReportException {
		Connection con = getConnection();
		int result = new ReportDao().deleteReport(con, ReportNo);
		if(result > 0)
			commit(con);
		else
			rollback(con);
		close(con);
		return result;
	}
}
