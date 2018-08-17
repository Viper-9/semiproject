package hsp.model.dao;

import static common.JDBCTemplate.*;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import hsp.exception.HostException;
import hsp.model.vo.Host;

public class HostDao {


	public HostDao(){}

	public Host selectHost(Connection con, String userId) {

		Host host = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;

		String query = "select * from host where user_id = ?";		

		
		try{
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, userId);
			
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

		} catch (Exception e) {
			 
		} finally {

			close(rset);
			close(pstmt);
		}
		return host;
	}


	public int updateHost(Connection con, Host host) throws HostException{
		int result = 0;
		PreparedStatement pstmt = null;
		
		String query = "update host set user_num=?, p_gender=?, check1=?, check2=?, content=? where user_id=?";
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, host.getUser_num());
			pstmt.setString(2, host.getP_gender());
			pstmt.setString(3, host.getCheck1());
			pstmt.setString(4, host.getCheck2());
			pstmt.setString(5, host.getContent());
			pstmt.setString(6, host.getUser_id());
			
			result = pstmt.executeUpdate();
			
			if(result < 0){
				throw new HostException("호스트 수정 실패");
			}
		} catch (Exception e) {
			e.printStackTrace();
			throw new HostException(e.getMessage());
		} finally {
			close(pstmt);
		}
		return result;
	}
	


}
