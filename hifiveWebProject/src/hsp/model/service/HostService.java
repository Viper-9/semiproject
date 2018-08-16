package hsp.model.service;

import static common.JDBCTemplate.*;
import java.sql.Connection;

import hsp.exception.HostException;
import hsp.model.dao.HostDao;
import hsp.model.vo.Host;

public class HostService {
	public HostService(){}
	
	// 호스트 정보
	public Host selectHost(String userid) {
		Connection con = getConnection();
		Host host = new HostDao().selectHost(con, userid);
		close(con);
		return host;
	}
	
	
}
