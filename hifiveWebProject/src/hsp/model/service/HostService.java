package hsp.model.service;

import static common.JDBCTemplate.*;
import java.sql.Connection;

import hsp.exception.HostException;
import hsp.model.dao.HostDao;
import hsp.model.dao.SurferPartnerDao;
import hsp.model.vo.Host;

public class HostService {

	public HostService(){}	

	public Host selectHost(String userId){

		Connection con = getConnection();
		Host host = new HostDao().selectHost(con, userId);
		close(con);
		return host;
	}


	public int updateHost(Host host) throws HostException{
		Connection con = getConnection();
		int result = new HostDao().updateHost(con, host);
		if(result > 0)
			commit(con);
		else
			rollback(con);
		close(con);
		return result;
	}


	public int insertHost(Host host) throws HostException{
		Connection con = getConnection();
		int result = new HostDao().insertHost(con, host);
		if(result > 0)
			commit(con);
		else
			rollback(con);
		close(con);
		return result;
	}

	// 매칭 된 호스트
	public Host selectMHost(String userId){

		Connection con = getConnection();
		Host host = new HostDao().selectHost(con, userId);
		close(con);
		return host;
	}

}
