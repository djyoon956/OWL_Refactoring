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

	public boolean deleteMyCalendar(String email) {
		boolean result = false;
		SmartCalendarDao dao = getSmartCalendarDao();

		try {
			result = dao.deleteMyCalendar(email) > 0 ? true : false;
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return result;
	};
	
	public boolean deleteProjectCalendar(String email, int projectIdx) {
		boolean result = false;
		SmartCalendarDao dao = getSmartCalendarDao();

		try {
			result = dao.deleteProjectCalendar(email, projectIdx) > 0 ? true : false;
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return result;
	};
	
	public List<SmartCalendar> getMemberCalendars(String email) {
		SmartCalendarDao dao = getSmartCalendarDao();
		
		List<SmartCalendar> calendars = new ArrayList<SmartCalendar>();
		try {
			calendars = dao.getMemberCalendars(email);
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return calendars;
	}
	
	public List<SmartCalendar> getProjectCalendars(int projectIdx) {
		SmartCalendarDao dao = getSmartCalendarDao();

		List<SmartCalendar> calendars = new ArrayList<SmartCalendar>();
		try {
			calendars = dao.getProjectCalendars(projectIdx);
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
