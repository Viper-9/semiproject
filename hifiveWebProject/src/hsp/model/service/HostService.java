package hsp.model.service;

import static common.JDBCTemplate.close;
import static common.JDBCTemplate.getConnection;

import java.sql.Connection;

import hsp.exception.HostException;
import hsp.model.dao.HostDao;
import hsp.model.vo.Host;

public class HostService {
	public HostService(){}	

	public Host selectHost(String userId){
		Connection con = getConnection();
		Host host = new HostDao().selectHost(con, userId);
		close(con);		
		return host;
	}

}
