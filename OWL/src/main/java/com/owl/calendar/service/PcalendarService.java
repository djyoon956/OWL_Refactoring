package com.owl.calendar.service;

import java.sql.SQLException;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.owl.calendar.dao.PcalendarDao;
import com.owl.calendar.dto.Pcalendar;

@Service
public class PcalendarService {
	@Autowired
	private SqlSession sqlSession;

	public boolean insertCalendar(Pcalendar calendar) {
		boolean result = false;
		PcalendarDao dao = getPcalendarDao();

		try {
			result = dao.insertCalendar(calendar) > 0 ? true : false;
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		}

		return result;
	};

	public boolean updateCalendar(Pcalendar calendar) {
		boolean result = false;
		PcalendarDao dao = getPcalendarDao();

		try {
			result = dao.updateCalendar(calendar) > 0 ? true : false;
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		}

		return result;
	};

	public boolean deleteCalendar(Pcalendar calendar) {
		boolean result = false;
		PcalendarDao dao = getPcalendarDao();

		try {
			result = dao.deleteCalendar(calendar) > 0 ? true : false;
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return result;
	};

	private PcalendarDao getPcalendarDao() {
		return sqlSession.getMapper(PcalendarDao.class);
	}
}
