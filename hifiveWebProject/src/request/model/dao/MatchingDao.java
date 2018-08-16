package request.model.dao;

import static common.JDBCTemplate.*;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import request.model.vo.Matching;

public class MatchingDao {
	public MatchingDao(){}

	public Matching hostMatching(Connection con, String userid) {
		Matching matching = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String query = "select * from matching where user1 = ? and type='H'";

		try{
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, userid);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()){
				matching = new Matching();
				matching.setMatching_no(rset.getInt("matching_no"));
				matching.setUser1(rset.getString("user1"));
				matching.setUser2(rset.getString("user2"));
				matching.setMatching_Date(rset.getDate("matching_date"));
			}			
		} catch(Exception e){
			
		} finally{
			close(rset);
			close(pstmt);
		}
		System.out.println(matching);
		return matching;
	}

	public Matching surferMatching(Connection con, String userid) {
		Matching matching = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String query = "select * from matching where user2 = ? and type='H'";

		try{
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, userid);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()){
				matching = new Matching();
				matching.setMatching_no(rset.getInt("matching_no"));
				matching.setUser1(rset.getString("user1"));
				matching.setUser2(rset.getString("user2"));
				matching.setMatching_Date(rset.getDate("matching_date"));
			}			
		} catch(Exception e){
			
		} finally{
			close(rset);
			close(pstmt);
		}
		return matching;
	}

	public Matching partnerMatching(Connection con, String userid) {
		Matching matching = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String query = "select * from matching where (user1 = ? or user2 = ?) and type='P'";

		try{
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, userid);
			pstmt.setString(2, userid);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()){
				matching = new Matching();
				matching.setMatching_no(rset.getInt("matching_no"));
				matching.setUser1(rset.getString("user1"));
				matching.setUser2(rset.getString("user2"));
				matching.setMatching_Date(rset.getDate("matching_date"));
			}
			
		} catch(Exception e){
			
		} finally{
			close(rset);
			close(pstmt);
		}
		return matching;
	}
}
