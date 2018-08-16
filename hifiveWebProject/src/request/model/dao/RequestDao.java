package request.model.dao;

import static common.JDBCTemplate.*;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import request.exception.RequestException;
import request.model.vo.Request;

public class RequestDao {
	public RequestDao() {
	}

	// 내가 호스트에게 요청한 리스트
	public ArrayList<Request> myHostList1(Connection con, String userId) {
		ArrayList<Request> list = new ArrayList<Request>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;

		String query = "select * from request where user_id=? and role='H' and process='P'";

		try {
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, userId);

			rset = pstmt.executeQuery();

			while (rset.next()) {
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
		} catch (Exception e) {

		} finally {
			close(rset);
			close(pstmt);
		}
		return list;
	}

	// 나에게 호스트 요청한 유저(서퍼)리스트
	public ArrayList<Request> myHostList2(Connection con, String userId) {
		ArrayList<Request> list = new ArrayList<Request>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;

		String query = "select * from request where r_user_id=? and role='S' and process='P'";

		try {
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, userId);

			rset = pstmt.executeQuery();

			while (rset.next()) {
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
		} catch (Exception e) {

		} finally {
			close(rset);
			close(pstmt);
		}
		return list;
	}

	// 내가 서퍼에게 요청한 리스트
	public ArrayList<Request> mySurferList1(Connection con, String userId) {
		ArrayList<Request> list = new ArrayList<Request>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;

		String query = "select * from request where user_id=? and role='S'and process='P'";

		try {
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, userId);

			rset = pstmt.executeQuery();

			while (rset.next()) {
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
		} catch (Exception e) {

		} finally {
			close(rset);
			close(pstmt);
		}
		return list;
	}

	// 나에게 서퍼 요청한 유저(호스트)리스트
	public ArrayList<Request> mySurferList2(Connection con, String userId) {
		ArrayList<Request> list = new ArrayList<Request>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;

		String query = "select * from request where r_user_id=? and role='H' and process='P'";

		try {
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, userId);

			rset = pstmt.executeQuery();

			while (rset.next()) {
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
		} catch (Exception e) {

		} finally {
			close(rset);
			close(pstmt);
		}
		return list;
	}

	// 내가 파트너 요청한 리스트
	public ArrayList<Request> myPartnerList1(Connection con, String userId) {
		ArrayList<Request> list = new ArrayList<Request>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;

		String query = "select * from request where user_id=? and role='P' and process='P'";

		try {
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, userId);

			rset = pstmt.executeQuery();

			while (rset.next()) {
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
		} catch (Exception e) {

		} finally {
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

		String query = "select * from request where r_user_id=? and role='P' and process='P'";

		try {
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, userId);

			rset = pstmt.executeQuery();

			while (rset.next()) {
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
		} catch (Exception e) {

		} finally {
			close(rset);
			close(pstmt);
		}
		return list;
	}

	// 내가 한 요청 취소했을 때
	public int deleteRequest(Connection con, int request_no) throws RequestException {
		int result = 0;
	    PreparedStatement pstmt = null;
	      
	    String query = "delete from request where request_no=?";
	    
	    try{
	       pstmt = con.prepareStatement(query);
	       pstmt.setInt(1, request_no);	       
	       
	       result = pstmt.executeUpdate();
	       
	       if(result <= 0)
	    	   throw new RequestException("요청 취소 실패");
	    } catch(Exception e){
	        
	    } finally{
	        close(pstmt);
	    }
	    return result;		   
	}
	// 내가 받은 요청 거절
	public int refuseRequest(Connection con, int request_no) throws RequestException {
		int result = 0;
	    PreparedStatement pstmt = null;
	      
	    String query = "update request set process='N', p_date=sysdate where request_no = ?";
	    
	    try{
	       pstmt = con.prepareStatement(query);
	       pstmt.setInt(1, request_no);	       
	       
	       result = pstmt.executeUpdate();
	       
	       if(result <= 0)
	    	   throw new RequestException("요청 취소 실패");
	    } catch(Exception e){
	        
	    } finally{
	        close(pstmt);
	    }
	    return result;		   
	}
	
	// 내가 받은 요청 거절
	public int acceptRequest(Connection con, int request_no) throws RequestException {
		int result = 0;
	    PreparedStatement pstmt = null;

	    String query = "update request set process='M', p_date=sysdate where request_no = ?";

	    try{
	    	pstmt = con.prepareStatement(query);	
	    	pstmt.setInt(1, request_no);      

	    	result = pstmt.executeUpdate();

	    	if(result <= 0)
	    		throw new RequestException("요청 취소 실패");
	    } catch(Exception e){
		       
	    } finally{
	    	close(pstmt);
	    }
	    return result;			   
	}
}