package hsp.model.dao;

import static common.JDBCTemplate.*;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import hsp.model.vo.Host;

public class HostDao {
	
	// 현재 진행중인 내 호스트 정보
	public Host selectHost(Connection con, String userid) {
		Host host = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String query = "select * from host where user_id=? and process='M'";
		
		try{
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, userid);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()){
				host = new Host();
				host.setUser_id(rset.getString("user_id"));
				host.setUser_num(rset.getInt("user_num"));
				host.setP_gender(rset.getString("p_gender"));
				host.setCheck1(rset.getString("check1"));
				host.setCheck2(rset.getString("check2"));
				host.setContent(rset.getString("content"));
				host.setProcess(rset.getString("process"));
				host.setStart_date(rset.getDate("start_date"));
				host.setEnd_date(rset.getDate("end_date"));
				host.setImage1(rset.getString("image1"));
				host.setImage2(rset.getString("image2"));
				host.setImage3(rset.getString("image3"));				
			}
		} catch(Exception e){
			
		} finally{
			close(rset);
			close(pstmt);
		}
		return host;
	}
}
