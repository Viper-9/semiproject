package request.model.service;
import static common.JDBCTemplate.*;
import java.sql.Connection;
import java.util.ArrayList;

import request.model.dao.RequestDao;
import request.model.vo.Request;

public class RequestService {

	// 내가 파트너 요청한 리스트
	public ArrayList<Request> myPartnerList1(String userId) {
		Connection con = getConnection();
		ArrayList<Request> list = new RequestDao().myPartnerList1(con, userId);
		return list;
	}
	
	// 나에게 파트너 요청한 유저 리스트
	public ArrayList<Request> myPartnerList2(String userId) {
		Connection con = getConnection();
		ArrayList<Request> list = new RequestDao().myPartnerList2(con, userId);
		return list;
	}

}
