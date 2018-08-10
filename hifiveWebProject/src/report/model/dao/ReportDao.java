package report.model.dao;

import static common.JDBCTemplate.close;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

import report.exception.ReportException;
import report.model.vo.Report;

public class ReportDao {
	public ReportDao(){}
	
	public int getListCount(Connection con) 
			throws ReportException {
			int listCount = 0;
			Statement stmt = null;
			ResultSet rset = null;
			
			String query = "select count(*) from report_board";
			
			try {
				stmt = con.createStatement();
				rset = stmt.executeQuery(query);
				
				if(rset.next()){
					listCount = rset.getInt(1);
				}else{
					throw new ReportException("게시글이 존재하지 않습니다.");
				}
				
			} catch (Exception e) {
				e.printStackTrace();
				throw new ReportException(e.getMessage());
			}finally{
				close(rset);
				close(stmt);
			}
			
			return listCount;
		}
	
	// 전체 글 조회
	public ArrayList<Report> selectAllReport(Connection con) throws ReportException {
		ArrayList<Report> list = new ArrayList<Report>();
		Statement stmt = null;
		ResultSet rset = null;

		String query = "select * from report_board";

		try{
			
			stmt = con.createStatement();
			rset = stmt.executeQuery(query);
			
			while(rset.next()){
				Report r = new Report();
				
				r.setReport_no(rset.getInt("report_no"));
				r.setReport_date(rset.getDate("report_date"));
				r.setViews(rset.getInt("views"));
				r.setTitle(rset.getString("title"));
				r.setContent(rset.getString("contents"));
				r.setComplete(rset.getString("complete"));
				r.setUser_id(rset.getString("user_id"));
				
				list.add(r);
				
				if(list.size() == 0)
					throw new ReportException("전체 조회 실패");			
			}
		} catch(Exception e){
			e.printStackTrace();
			throw new ReportException(e.getMessage());		
		} finally{
			close(rset);
			close(stmt);
		}		
		return list;
	}

	// 제목으로 검색조회
	public ArrayList<Report> selectTitle(Connection con, String keyword) throws ReportException {
		ArrayList<Report> list = new ArrayList<Report>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String query = "select * from report_board where title like ?";
		
		try{
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, "%" + keyword + "%");
			
			while(rset.next()){
				Report r = new Report();
				
				r.setReport_no(rset.getInt("report_no"));
				r.setReport_date(rset.getDate("report_date"));
				r.setViews(rset.getInt("views"));
				r.setTitle(rset.getString("title"));
				r.setContent(rset.getString("content"));
				r.setComplete(rset.getString("complete"));
				r.setUser_id(rset.getString("user_id"));
				
				list.add(r);
				
				if(list.size() == 0)
					throw new ReportException("제목 검색 조회 실패");			
			}
		} catch(Exception e){
			e.printStackTrace();
			throw new ReportException(e.getMessage());		
		} finally{
			close(rset);
			close(pstmt);
		}		
		return list;
	}

	// 글 내용 상세조회
	public Report selectReport(Connection con, int ReportNo) throws ReportException {
		Report Report = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String query = "select * from report_board where report_no = ?";
		
		try{
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, ReportNo);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()){
				Report r = new Report();
				
				r.setReport_no(rset.getInt("report_no"));
				r.setReport_date(rset.getDate("report_date"));
				r.setViews(rset.getInt("views"));
				r.setTitle(rset.getString("title"));
				r.setContent(rset.getString("content"));
				r.setComplete(rset.getString("complete"));
				r.setUser_id(rset.getString("user_id"));
				
				
				if(Report == null)
					throw new ReportException("글 내용 조회 실패");			
			}
		} catch(Exception e){
			e.printStackTrace();
			throw new ReportException(e.getMessage());		
		} finally{
			close(rset);
			close(pstmt);
		}		
		return Report;
	}

	// 신고게시판 입력
	public int insertReport(Connection con, Report Report) throws ReportException {
		int result = 0;
		PreparedStatement pstmt = null; 
		
		String query = "insert into report_board values (?, default, default, ?, ?)";

		try {
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, Report.getReport_no());
			pstmt.setString(2, Report.getTitle());
			pstmt.setString(3, Report.getContent());
			
			result = pstmt.executeUpdate();
			
			if(result <= 0)
				throw new ReportException("공지글 입력 실패");
		} catch(Exception e){
			e.printStackTrace();
			throw new ReportException(e.getMessage());
		} finally{
			close(pstmt);
		}		
		return result;	
	}

	// 공지글 수정
	public int updateReport(Connection con, Report Report) throws ReportException {
		int result = 0;
		PreparedStatement pstmt = null;

		String query = "update report_board set "
				+ "title = ?, content = ? "
				+ "where Report_no = ?";
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, Report.getTitle());
			pstmt.setString(2, Report.getContent());
			pstmt.setInt(3, Report.getReport_no());
			
			result = pstmt.executeUpdate();
			
			if(result <= 0)
				throw new ReportException("공지 수정 실패");			
		} catch(Exception e){
			e.printStackTrace();
			throw new ReportException(e.getMessage());
		} finally{
			close(pstmt);
		}		
		return result;	
	}
	
	// 공지글 삭제
	public int deleteReport(Connection con, int ReportNo) throws ReportException {
		int result = 0;
		PreparedStatement pstmt = null;
		
		String query = "delete from report_board where Report_no = ?";
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, ReportNo);
			
			result = pstmt.executeUpdate();
			
			if(result <= 0)
				throw new ReportException(ReportNo + "번 공지 삭제 실패!");
		} catch(Exception e){
			e.printStackTrace();
			throw new ReportException(e.getMessage());
		} finally{
			close(pstmt);
		}		
		return result;		
	}
}
