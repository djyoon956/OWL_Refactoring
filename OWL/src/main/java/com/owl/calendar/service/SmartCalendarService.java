package com.owl.calendar.service;

import java.sql.SQLException;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.owl.calendar.dao.SmartCalendarDao;
import com.owl.calendar.dto.SmartCalendar;

@Service
public class SmartCalendarService {
	@Autowired
	private SqlSession sqlSession;

	public boolean insertCalendar(SmartCalendar calendar) {
		boolean result = false;
		SmartCalendarDao dao = getPcalendarDao();

		try {
			result = dao.insertCalendar(calendar) > 0 ? true : false;
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		}

		return result;
	};

	public boolean updateCalendar(SmartCalendar calendar) {
		boolean result = false;
		SmartCalendarDao dao = getPcalendarDao();

		try {
			result = dao.updateCalendar(calendar) > 0 ? true : false;
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		}

		return result;
	};

	public boolean deleteCalendar(SmartCalendar calendar) {
		boolean result = false;
		SmartCalendarDao dao = getPcalendarDao();

		try {
			result = dao.deleteCalendar(calendar) > 0 ? true : false;
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return result;
	};

	private SmartCalendarDao getPcalendarDao() {
		return sqlSession.getMapper(SmartCalendarDao.class);
	}
}
