package hsp.model.service;


import static common.JDBCTemplate.*;
import java.sql.Connection;
import hsp.exception.SurferPartnerException;
import hsp.model.dao.SurferPartnerDao;
import hsp.model.vo.SurferPartner;

import java.sql.Connection;

import hsp.model.dao.SurferPartnerDao;
import hsp.model.vo.SurferPartner;

public class SurferPartnerService {
	

	public SurferPartnerService(){}
	
	public SurferPartner selectSurfer(String userId) {
		Connection con = getConnection();
		SurferPartner sp = new SurferPartnerDao().selectSurfer(con, userId);
		close(con);
		return sp;
	}
	
	public SurferPartner selectPartner(String userId)  {
		Connection con = getConnection();
		SurferPartner sp = new SurferPartnerDao().selectPartner(con, userId);
		close(con);
		return sp;
	}


}
