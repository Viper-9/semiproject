package hsp.model.dao;


import static common.JDBCTemplate.close;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

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

	public int insertSurfer(Connection con, SurferPartner sp) throws SurferPartnerException{
		int result = 0;
		PreparedStatement pstmt = null;
		
		String query = "insert into surfer_partner values(?,?,?,?,?,'S',default)";

		try {
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, sp.getUser_id());
			pstmt.setDate(2, sp.getStart_date());
			pstmt.setDate(3, sp.getEnd_date());
			pstmt.setInt(4, sp.getUser_num());
			pstmt.setString(5, sp.getCity());
			
			result = pstmt.executeUpdate();
			
			if(result < 0){
				throw new  UserException("서퍼 등록 실패");
			}
		} catch (Exception e) {
			e.printStackTrace();
			throw new SurferPartnerException(e.getMessage());
		} finally {
			close(pstmt);
		}
		return result;
	}

	public int insertPartner(Connection con, SurferPartner sp) throws SurferPartnerException{
		int result = 0;
		PreparedStatement pstmt = null;
		
		String query = "insert into surfer_partner values(?,?,?,?,?,'P',default)";

		try {
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, sp.getUser_id());
			pstmt.setDate(2, sp.getStart_date());
			pstmt.setDate(3, sp.getEnd_date());
			pstmt.setInt(4, sp.getUser_num());
			pstmt.setString(5, sp.getCity());
			
			result = pstmt.executeUpdate();
			
			if(result < 0){
				throw new  UserException("파트너 등록 실패");
			}
		} catch (Exception e) {
			e.printStackTrace();
			throw new SurferPartnerException(e.getMessage());
		} finally {
			close(pstmt);
		}
		return result;
	}


	public ArrayList<Object[]> searchPartner(Connection con, SurferPartner sp) throws SurferPartnerException{
		ArrayList<Object[]> list = new ArrayList<Object[]>();		
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String query = "select * from surfer_partner sp, users u where sp.user_id = u.user_id and city like ? and user_num=? and start_date=? or end_date=? and role='P'";
		
		try {
			pstmt = con.prepareStatement(query);			
			
			pstmt.setString(1, sp.getCity());
			pstmt.setInt(2, sp.getUser_num());
			pstmt.setDate(3, sp.getStart_date());
			pstmt.setDate(4, sp.getEnd_date());
			
			rset = pstmt.executeQuery();
			
			while(rset.next()){				
				Object[] obj = new Object[3];
				obj[0] = rset.getString("user_name");
				obj[1] = rset.getString("address");
				obj[2] = rset.getString("nationality");				
				list.add(obj);						
			}
			if(list.size() == 0)
				throw new SurferPartnerException("정보 없음");
		} catch (Exception e) {
			e.printStackTrace();
			throw new SurferPartnerException(e.getMessage());
		} finally {
			close(rset);
			close(pstmt);
		}
		return list;
	}
}
