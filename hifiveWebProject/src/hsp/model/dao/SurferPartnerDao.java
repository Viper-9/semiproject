package hsp.model.dao;

import static common.JDBCTemplate.close;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import hsp.model.vo.Host;
import hsp.model.vo.SurferPartner;

public class SurferPartnerDao {

	// 현재 진행중인 내 서퍼 정보
	public SurferPartner selectSurfer(Connection con, String userid) {
		SurferPartner surfer = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String query = "select * from surfer_partner where user_id=? and role='S' and process='M'";
		
		try{
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, userid);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()){
				surfer = new SurferPartner();
				surfer.setUser_id(rset.getString("user_id"));				
				surfer.setStart_date(rset.getDate("start_date"));
				surfer.setEnd_date(rset.getDate("end_date"));
				surfer.setUser_num(rset.getInt("user_num"));
				surfer.setCity(rset.getString("city"));
				surfer.setRole(rset.getString("role"));
				surfer.setProcess(rset.getString("process"));		
			}
		} catch(Exception e){
			
		} finally{
			close(rset);
			close(pstmt);
		}
		return surfer;
	}

	// 현재 진행중인 내 파트너 정보
	public SurferPartner selectPartner(Connection con, String userid) {
		SurferPartner partner = null;
		return partner;
	}

}
