package hsp.model.dao;


import static common.JDBCTemplate.*;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import hsp.exception.SurferPartnerException;
import hsp.model.vo.SurferPartner;
import user.exception.UserException;

public class SurferPartnerDao {


	public SurferPartner selectSurfer(Connection con, String userId) {

		SurferPartner sp = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String query = "select * from surfer_partner where role='S' and user_id=? and process='P'";
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, userId);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()){
				sp = new SurferPartner();
				sp.setUser_id(userId);
				sp.setStart_date(rset.getDate("start_date"));
				sp.setEnd_date(rset.getDate("end_date"));
				sp.setCity(rset.getString("city"));
				sp.setProcess(rset.getString("process"));
				sp.setUser_num(rset.getInt("user_num"));
			}
		} catch (Exception e) {

			
		} finally {
			close(rset);
			close(pstmt);
		}
		return sp;
	}

	public SurferPartner selectPartner(Connection con, String userId) {
		SurferPartner sp = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String query = "select * from surfer_partner where role='P' and user_id=? and process='P'";
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, userId);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()){
				sp = new SurferPartner();
				sp.setUser_id(userId);
				sp.setStart_date(rset.getDate("start_date"));
				sp.setEnd_date(rset.getDate("end_date"));
				sp.setCity(rset.getString("city"));
				sp.setProcess(rset.getString("process"));
				sp.setUser_num(rset.getInt("user_num"));

			}
		} catch (Exception e) {

					

		} finally {
			close(rset);
			close(pstmt);
		}
		return sp;
		

	}

	public int updateSurfer(Connection con, SurferPartner sp) throws SurferPartnerException{
		int result = 0;
		PreparedStatement pstmt = null;
		
		String query = "update surfer_partner set city=?, start_date=?, end_date=?, user_num=? where role='S' and user_id = ?";
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, sp.getCity());
			pstmt.setDate(2, sp.getStart_date());
			pstmt.setDate(3, sp.getEnd_date());
			pstmt.setInt(4, sp.getUser_num());
			pstmt.setString(5, sp.getUser_id());
			
			result = pstmt.executeUpdate();
			
			if(result < 0){
				throw new UserException("서퍼 수정 실패");
			}
		} catch (Exception e) {
			e.printStackTrace();
			throw new SurferPartnerException(e.getMessage());
		} finally {
			close(pstmt);
		}
		
		return result;
	}

	public int updatePartner(Connection con, SurferPartner sp) throws SurferPartnerException{
		int result = 0;
		PreparedStatement pstmt = null;
		
		String query = "update surfer_partner set city=?, start_date=?, end_date=?, user_num=? where role='P' and user_id = ?";
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, sp.getCity());
			pstmt.setDate(2, sp.getStart_date());
			pstmt.setDate(3, sp.getEnd_date());
			pstmt.setInt(4, sp.getUser_num());
			pstmt.setString(5, sp.getUser_id());
			
			result = pstmt.executeUpdate();
			
			if(result < 0){
				throw new UserException("파트너 수정 실패");
			}
		} catch (Exception e) {
			e.printStackTrace();
			throw new SurferPartnerException(e.getMessage());
		} finally {
			close(pstmt);
		}
		
		return result;
	}

}
