package hsp.model.service;

import static common.JDBCTemplate.*;

import java.sql.Connection;

import hsp.model.dao.SurferPartnerDao;
import hsp.model.vo.SurferPartner;

public class SurferPartnerService {
	public SurferPartnerService(){}
	
	// 현재 진행중인 내 서퍼 정보
	public SurferPartner selectSurfer(String userid) {
		Connection con = getConnection();
		SurferPartner surfer = new SurferPartnerDao().selectSurfer(con, userid);
		close(con);
		return surfer;
	}
	
	// 현재 진행중인 내 파트너 정보
	public SurferPartner selectPartner(String userid) {
		Connection con = getConnection();
		SurferPartner partner = new SurferPartnerDao().selectPartner(con, userid);
		close(con);
		return partner;
	}
}
