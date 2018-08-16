package request.model.service;

import static common.JDBCTemplate.*;

import java.sql.Connection;
import java.util.ArrayList;

import request.model.dao.MatchingDao;
import request.model.vo.Matching;

public class MatchingService {
	public MatchingService(){}
	
	public Matching hostMatching(String userid) {
		Connection con = getConnection();
		Matching matching = new MatchingDao().hostMatching(con, userid);
		close(con);
		return matching;
	}

	public Matching surferMatching(String userid) {
		Connection con = getConnection();
		Matching matching = new MatchingDao().surferMatching(con, userid);
		close(con);
		return matching;

	}

	public Matching partnerMatching(String userid) {
		Connection con = getConnection();
		Matching matching = new MatchingDao().partnerMatching(con, userid);
		close(con);
		return matching;

	}
}
