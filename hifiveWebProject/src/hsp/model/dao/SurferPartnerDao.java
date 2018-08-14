package hsp.model.dao;

import static common.JDBCTemplate.*;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import hsp.exception.SurferPartnerException;
import hsp.model.vo.SurferPartner;

public class SurferPartnerDao {

	public SurferPartner selectSurfer(Connection con, String userId) throws SurferPartnerException{
		SurferPartner sp = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String query = "select * from surfer_partner where role='S' and user_id=?";
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, userId);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()){
				sp = new SurferPartner();
				sp.setUser_id(userId);
				sp.setStart_date(rset.getDate("start_date"));
				sp.setEnd_Date(rset.getDate("end_date"));
				sp.setCity(rset.getString("city"));
				sp.setProcess(rset.getString("process"));
				sp.setNum(rset.getInt("user_num"));
			}else{
				throw new SurferPartnerException("서퍼 내역 조회 실패");
			}
		} catch (Exception e) {
			e.printStackTrace();
			throw new SurferPartnerException(e.getMessage());
		} finally {
			close(rset);
			close(pstmt);
		}
		return sp;
	}

	public SurferPartner selectPartner(Connection con, String userId) throws SurferPartnerException{
		SurferPartner sp = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String query = "select * from surfer_partner where role='P' and user_id=?";
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, userId);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()){
				sp = new SurferPartner();
				sp.setUser_id(userId);
				sp.setStart_date(rset.getDate("start_date"));
				sp.setEnd_Date(rset.getDate("end_date"));
				sp.setCity(rset.getString("city"));
				sp.setProcess(rset.getString("process"));
				sp.setNum(rset.getInt("user_num"));
			}else{
				throw new SurferPartnerException("파트너 내역 조회 실패");
			}
		} catch (Exception e) {
			e.printStackTrace();
			throw new SurferPartnerException(e.getMessage());
		} finally {
			close(rset);
			close(pstmt);
		}
		return sp;
		
	}

}
