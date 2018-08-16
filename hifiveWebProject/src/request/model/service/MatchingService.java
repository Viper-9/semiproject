package request.model.service;

import static common.JDBCTemplate.*;

import java.sql.Connection;
import java.util.ArrayList;

import request.model.dao.MatchingDao;
import request.model.vo.Matching;

public class MatchingService {
	public MatchingService(){}

	public ArrayList<Matching> hostMatching(String userid) {
		Connection con = getConnection();
		ArrayList<Matching> list = new MatchingDao().hostMatching(con, userid);
		close(con);
		return list;
	}

	public ArrayList<Matching> surferMatching(String userid) {
		Connection con = getConnection();
		ArrayList<Matching> list = new MatchingDao().surferMatching(con, userid);
		close(con);
		return list;

	}

	public ArrayList<Matching> partnerMatching(String userid) {
		Connection con = getConnection();
		ArrayList<Matching> list = new MatchingDao().partnerMatching(con, userid);
		close(con);
		return list;

	}
}
