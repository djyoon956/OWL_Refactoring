package com.owl.dashBoard.dao;

import java.sql.SQLException;
import java.util.List;

public interface DashBoardDao {
	public List<Integer> getMyIssueDatas() throws ClassNotFoundException, SQLException;
}
