package com.owl.helper;

import org.apache.ibatis.type.BaseTypeHandler;
import org.apache.ibatis.type.JdbcType;

import java.sql.CallableStatement;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.Date;

public class DateConverter extends BaseTypeHandler<Date> {

	@Override
	public void setNonNullParameter(PreparedStatement ps, int i, Date parameter, JdbcType jdbcType)
			throws SQLException {
		// TODO Auto-generated method stub

	}

	@Override
	public Date getNullableResult(ResultSet rs, String columnName) throws SQLException {
		System.out.println("in date converter");
		Timestamp sqlTimestamp = rs.getTimestamp(columnName);
		System.out.println(sqlTimestamp);
	
		if (sqlTimestamp != null) 
			return new Date(sqlTimestamp.getTime());

		return null;
	}

	@Override
	public Date getNullableResult(ResultSet rs, int columnIndex) throws SQLException {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Date getNullableResult(CallableStatement cs, int columnIndex) throws SQLException {
		// TODO Auto-generated method stub
		return null;
	}

}
