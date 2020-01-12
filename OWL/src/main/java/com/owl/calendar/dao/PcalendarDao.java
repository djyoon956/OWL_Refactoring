package com.owl.calendar.dao;

import java.sql.SQLException;

import com.owl.calendar.dto.Pcalendar;

public interface PcalendarDao {
	public int insertCalendar(Pcalendar calendar) throws ClassNotFoundException, SQLException;

	public int updateCalendar(Pcalendar calendar) throws ClassNotFoundException, SQLException;

	public int deleteCalendar(Pcalendar calendar) throws ClassNotFoundException, SQLException;
}
