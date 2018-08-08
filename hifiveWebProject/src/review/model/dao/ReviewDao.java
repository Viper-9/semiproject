package review.model.dao;

import static common.JDBCTemplate.*;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.util.ArrayList;

import review.exception.ReviewException;
import review.model.vo.Review;

public class ReviewDao {

	public ArrayList<Review> selectAllReview(Connection con) {
		ArrayList<Review> list = new ArrayList<Review>();
		
		return list;
	}

	public int insertReview(Connection con, Review review, String user_id, String r_user_id) {
		int result = 0;
		PreparedStatement pstmt = null;
		
		String query = "insert into review values(?, ?, ?, default, ?)";
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, review.getReview_no()); // 번호 입력하는 시퀀스 사용해야됨 (나중에수정)
			pstmt.setString(2, review.getUser_id());
			pstmt.setString(3, review.getR_user_id());
			pstmt.setString(4, review.getContent());
			
			result = pstmt.executeUpdate();
			
			if(result <= 0)
				throw new ReviewException("리뷰 등록 실패");
		} catch(Exception e){
			e.printStackTrace();
		} finally{
			close(pstmt);
		}		
		return result;		
	}

	public int updateReview(Connection con, Review review) {
		int result = 0;
		PreparedStatement pstmt = null;
		
		String query = "update review set "
				+ "content = ? where review_no = ?";
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, review.getContent());
			pstmt.setInt(2, review.getReview_no());
			
			result = pstmt.executeUpdate();
			
			if(result <= 0)
				throw new ReviewException("리뷰 수정 실패");
		} catch(Exception e){
			e.printStackTrace();
		} finally{
			close(pstmt);
		}		
		return result;	
	}

	public int deleteReview(Connection con, int review_no) {
		int result = 0;
		PreparedStatement pstmt = null;
		
		String query = "delete from review where review_no = ?";
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, review_no);
			
			result = pstmt.executeUpdate();
			
			if(result <= 0)
				throw new ReviewException("리뷰 삭제 실패");
		} catch(Exception e){
			e.printStackTrace();
		} finally{
			close(pstmt);
		}		
		return result;		
	}
}