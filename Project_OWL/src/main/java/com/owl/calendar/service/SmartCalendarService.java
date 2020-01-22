package com.owl.calendar.service;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

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
		SmartCalendarDao dao = getSmartCalendarDao();

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
		SmartCalendarDao dao = getSmartCalendarDao();

		try {
			result = dao.updateCalendar(calendar) > 0 ? true : false;
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return result;
	};

	public boolean deleteCalendar(int calIdx) {
		boolean result = false;
		SmartCalendarDao dao = getSmartCalendarDao();

		try {
			result = dao.deleteCalendar(calIdx) > 0 ? true : false;
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return result;
	};
	
	public List<SmartCalendar> getMyAllCalendars(String email) {
		SmartCalendarDao dao = getSmartCalendarDao();
		
		List<SmartCalendar> calendars = new ArrayList<SmartCalendar>();
		try {
			calendars = dao.getMyAllCalendars(email);
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return calendars;
	}
	
	public List<SmartCalendar> getProjectCalendar(int projectIdx) {
		SmartCalendarDao dao = getSmartCalendarDao();

		List<SmartCalendar> calendars = new ArrayList<SmartCalendar>();
		try {
			calendars = dao.getProjectCalendar(projectIdx);
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		}

		return calendars;
	}

	private SmartCalendarDao getSmartCalendarDao() {
		return sqlSession.getMapper(SmartCalendarDao.class);
	}
}
