package favorite.model.service;

import static common.JDBCTemplate.*;

import java.sql.Connection;
import java.util.ArrayList;

import favorite.exception.FavoriteException;
import favorite.model.dao.FavoriteDao;
import favorite.model.vo.Favorite;

public class FavoriteService {

	public ArrayList<Favorite> selectAll(String userId) {
		Connection con = getConnection();
		ArrayList<Favorite> list = new FavoriteDao().selectAll(con, userId);
		close(con);		
		return list;
	}

	public int deleteFavorite(String userId, String f_User_Id) throws FavoriteException {
		Connection con = getConnection();
		int result = new FavoriteDao().deleteFavorite(con, userId, f_User_Id);
		if(result > 0)
			commit(con);
		else
			rollback(con);
		return result;
	}

	public int insertFavorite(String userId, String f_User_Id) throws FavoriteException {
		Connection con = getConnection();
		int result = new FavoriteDao().insertFavorite(con, userId, f_User_Id);
		if(result > 0)
			commit(con);
		else
			rollback(con);
		return result;
	}
}