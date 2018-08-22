package hsp.model.service;


import static common.JDBCTemplate.close;
import static common.JDBCTemplate.commit;
import static common.JDBCTemplate.getConnection;
import static common.JDBCTemplate.rollback;
import java.sql.Connection;
import java.util.ArrayList;

import hsp.exception.SurferPartnerException;
import hsp.model.dao.SurferPartnerDao;
import hsp.model.vo.SurferPartner;
import user.model.dao.UserDao;
import user.model.vo.User;

public class SurferPartnerService {
	

	public SurferPartnerService(){}
	

	public SurferPartner selectSurfer(String userId){

		Connection con = getConnection();
		SurferPartner sp = new SurferPartnerDao().selectSurfer(con, userId);
		close(con);
		return sp;
	}
	

	public SurferPartner selectPartner(String userId) {

		Connection con = getConnection();
		SurferPartner sp = new SurferPartnerDao().selectPartner(con, userId);
		close(con);
		return sp;
	}


	public int updateSurfer(SurferPartner sp) throws SurferPartnerException{
		Connection con = getConnection();
		int result = new SurferPartnerDao().updateSurfer(con, sp);
		if(result > 0)
			commit(con);
		else
			rollback(con);
		close(con);
		return result;
	}

	public int updatePartner(SurferPartner sp) throws SurferPartnerException{
		Connection con = getConnection();
		int result = new SurferPartnerDao().updatePartner(con, sp);
		if(result > 0)
			commit(con);
		else
			rollback(con);
		close(con);
		return result;
	}


	public int insertSurfer(SurferPartner sp) throws SurferPartnerException{
		Connection con = getConnection();
		int result = new SurferPartnerDao().insertSurfer(con, sp);
		if(result > 0)
			commit(con);
		else
			rollback(con);
		close(con);
		return result;
	}

	public int insertPartner(SurferPartner sp) throws SurferPartnerException{
		Connection con = getConnection();
		int result = new SurferPartnerDao().insertPartner(con, sp);
		if(result > 0)
			commit(con);
		else
			rollback(con);
		close(con);
		return result;
	}

	public ArrayList<User> searchPartner(SurferPartner sp){
		Connection con = getConnection();
		ArrayList<User> list = new SurferPartnerDao().searchPartner(con, sp);
		close(con);
		return list;
	}


}
