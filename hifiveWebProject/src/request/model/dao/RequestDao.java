package request.model.dao;
import static common.JDBCTemplate.*;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import request.model.vo.Request;

public class RequestDao {

	// 내가 파트너 요청한 리스트
	public ArrayList<Request> myPartnerList1(Connection con, String userId) {
		ArrayList<Request> list = new ArrayList<Request>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String query = "select * from request where user_id=? and role='P'";
		
		try{
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, userId);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()){
				Request r = new Request();
				r.setRequest_no(rset.getInt("request_no"));
				r.setUser_id(rset.getString("user_id"));
				r.setR_user_id(rset.getString("r_user_id"));
				r.setRequest_date(rset.getDate("request_date"));
				r.setRole(rset.getString("role"));
				r.setProcess(rset.getString("process"));
				r.setP_date(rset.getDate("p_date"));

				list.add(r);				
			}			
		} catch(Exception e){
			
		} finally{
			close(rset);
			close(pstmt);
		}		
		return list;
	}
	
	// 나에게 파트너 요청한 유저 리스트
	public ArrayList<Request> myPartnerList2(Connection con, String userId) {
		ArrayList<Request> list = new ArrayList<Request>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String query = "select * from request where r_user_id=? and role='P'";
		
		try{
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, userId);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()){
				Request r = new Request();
				r.setRequest_no(rset.getInt("request_no"));
				r.setUser_id(rset.getString("user_id"));
				r.setR_user_id(rset.getString("r_user_id"));
				r.setRequest_date(rset.getDate("request_date"));
				r.setRole(rset.getString("role"));
				r.setProcess(rset.getString("process"));
				r.setP_date(rset.getDate("p_date"));

				list.add(r);				
			}			
		} catch(Exception e){
			
		} finally{
			close(rset);
			close(pstmt);
		}		
		return list;
	}

}
