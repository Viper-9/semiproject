package message.model.dao;

import static common.JDBCTemplate.close;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import message.exception.MessageException;
import message.model.vo.MessageList;

public class MessageListDao {	
	// 내 대화목록 전체 검색 (내가 user_id일때) user1
	public ArrayList<MessageList> selectMyList1(Connection con, String user1) {
		ArrayList<MessageList> list = new ArrayList<MessageList>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String query = "select * from message_list where user1 = ? ";
		
		try{
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, user1);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()){
				MessageList mList = new MessageList();
				mList.setList_no(rset.getInt(1));
				mList.setUser1(rset.getString(2));
				mList.setUser2(rset.getString(3));
				
				list.add(mList);
			}
			
		} catch(Exception e){
			e.printStackTrace();
		} finally{
			close(rset);
			close(pstmt);
		}		
		return list;
	}
	
	// 내 대화목록 전체 검색 (내가 sender일때) user2
	public ArrayList<MessageList> selectMyList2(Connection con, String user2) {
		ArrayList<MessageList> list = new ArrayList<MessageList>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String query = "select * from message_list where user2 = ? ";
		
		try{
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, user2);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()){
				MessageList mList = new MessageList();
				mList.setList_no(rset.getInt(1));
				mList.setUser1(rset.getString(2));
				mList.setUser2(rset.getString(3));
				
				list.add(mList);
			}
			if(list.size() == 0)
				throw new MessageException("없어!!!");			
		} catch(Exception e){
			e.printStackTrace();
		} finally{
			close(rset);
			close(pstmt);
		}		
		return list;
	}
	
	// list_no로 user_id, sender 찾을때
	public MessageList selectOne(Connection con, int list_no) throws MessageException {
		MessageList mList = new MessageList();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String query = "select * from message_list where list_no= ?";
		
		try{
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, list_no);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()){
				mList.setList_no(list_no);
				mList.setUser1(rset.getString("user1"));
				mList.setUser2(rset.getString("user2"));
			} else{
				throw new MessageException("조회실패");
			}
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			close(rset);
			close(pstmt);
		}
		return mList;
	}
	
	public int selectList(Connection con, String user1, String user2) {
		int list_no = 0;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String query = "select list_no from message_list "
				+ "where user1=? and user2=?";
		
		try{
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, user1);
			pstmt.setString(2, user2);
			
			rset = pstmt.executeQuery();
			
			if(rset.next())
				list_no = rset.getInt("list_no");

		} catch(Exception e){
			e.printStackTrace();
		} finally{
			close(pstmt);
		}
		
		return list_no;
	}

}