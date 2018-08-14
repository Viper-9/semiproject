package hsp.model.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import static common.JDBCTemplate.*;
import hsp.exception.HostException;
import hsp.model.vo.Host;

public class HostDao {

	public HostDao(){}

	public Host selectHost(Connection con, String userId) throws HostException{
		Host host = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String query = "select * from host where user_id = ?";		
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, userId);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()){
				host = new Host();
				host.setUser_id(userId);
				host.setUser_num(rset.getInt("user_num"));
				host.setP_gender(rset.getString("p_gender"));
				host.setCheck1(rset.getString("check1"));
				host.setCheck2(rset.getString("check2"));
				host.setContent(rset.getString("contents"));
				host.setProcess(rset.getString("process"));
				host.setStart_date(rset.getDate("start_date"));
				host.setEnd_date(rset.getDate("end_date"));				
				host.setImage1(rset.getString("image1"));
				host.setImage2(rset.getString("image2"));
				host.setImage3(rset.getString("image3"));	
			} else {
				throw new HostException("호스트 내역 조회 실패");
			}
		} catch (Exception e) {
			 e.printStackTrace();
			 throw new HostException(e.getMessage());
		} finally {
			close(rset);
			close(pstmt);			
		}
		return host;
		
	}
	

}
