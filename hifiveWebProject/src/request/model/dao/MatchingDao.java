package request.model.dao;

import static common.JDBCTemplate.*;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import request.model.vo.Matching;

public class MatchingDao {
	public MatchingDao(){}

	public ArrayList<Matching> hostMatching(Connection con, String userid) {
		ArrayList<Matching> list = new ArrayList<Matching>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String query = "select * from matching where user1 = ?";

		try{
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, userid);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()){
				Matching m = new Matching();
				m.setMatching_no(rset.getInt("matching_no"));
				m.setUser1(rset.getString("user1"));
				m.setUser2(rset.getString("user2"));
				m.setMatching_Date(rset.getDate("matching_date"));
				list.add(m);
			}
			
		} catch(Exception e){
			
		} finally{
			close(rset);
			close(pstmt);
		}
		return list;
	}

	public ArrayList<Matching> surferMatching(Connection con, String userid) {
		ArrayList<Matching> list = new ArrayList<Matching>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String query = "select * from matching where user2 = ?";

		try{
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, userid);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()){
				Matching m = new Matching();
				m.setMatching_no(rset.getInt("matching_no"));
				m.setUser1(rset.getString("user1"));
				m.setUser2(rset.getString("user2"));
				m.setMatching_Date(rset.getDate("matching_date"));
				list.add(m);
			}
			
		} catch(Exception e){
			
		} finally{
			close(rset);
			close(pstmt);
		}
		return list;
	}

	public ArrayList<Matching> partnerMatching(Connection con, String userid) {
		// TODO Auto-generated method stub
		return null;
	}
}
