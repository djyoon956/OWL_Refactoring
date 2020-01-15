package com.owl.member.service;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.owl.member.dao.MemberDao;
import com.owl.member.dto.Member;

@Service
public class MemberService {
	@Autowired
	private SqlSession sqlSession;

	// ******************************************************
	// DB TEST 용입니다.
	// 삭제 예정
	// ******************************************************
	public boolean test() {
		MemberDao userDao = getMemberDao();
		boolean result = false;

		try {
			userDao.getMembers();
			result = true;
		} catch (ClassNotFoundException e) {
			result = false;
		} catch (SQLException e) {
			result = false;
		}

		return result;
	}

	public boolean insertMember(Member member) {
		System.out.println("insertMember service in");
		System.out.println(member.toString());
		MemberDao userDao = getMemberDao();

		boolean result = false;

		try {
			result = userDao.insertMember(member) > 0 ? true : false;
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		}

		System.out.println("result는? " + result);
		return result;
	}

	// 미완성
	public boolean joinMemberOk(String email) {
		MemberDao userDao = getMemberDao();
		boolean result = false;

		try {
			userDao.joinMemberOk(email);
			userDao.grantDefaultRole(email);
			result = true;
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		}

		return result;
	}

	public boolean updateMember(Member member) {
		MemberDao userDao = getMemberDao();
		boolean result = false;

		try {
			result = userDao.updateMember(member) > 0 ? true : false;
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		}

		return result;
	}

	public boolean deleteMember(String email) {
		MemberDao userDao = getMemberDao();
		boolean result = false;

		try {
			result = userDao.deleteMember(email) > 0 ? true : false;
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		}

		return result;
	}

	public Member getMember(String email) {
		MemberDao userDao = getMemberDao();
		Member member = null;

		try {
			member = userDao.getMember(email);
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		}

		return member;
	}

	public List<Member> getMembers() {
		MemberDao userDao = getMemberDao();
		List<Member> members = new ArrayList<Member>();

		try {
			members = userDao.getMembers();
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		}

		return members;
	}

	public boolean emailCheck(String email) {
		System.out.println("emailcheck service in");
		System.out.println("email" + email);
		MemberDao dao = getMemberDao();

		boolean result = false;
		try {
			result = dao.emailCheck(email) != null ? true : false;
			System.out.println("email result : " + result);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}

	public boolean changePassword(String email, String password) {
		MemberDao dao = getMemberDao();
		boolean result = false;
		
		try {
			result = dao.changePassword(email, password) > 0 ? true : false;
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return result;
	}

	private MemberDao getMemberDao() {
		return sqlSession.getMapper(MemberDao.class);
	}
}
