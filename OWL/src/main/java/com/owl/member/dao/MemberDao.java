package com.owl.member.dao;

import java.sql.SQLException;
import java.util.List;

import com.owl.member.dto.Member;

public interface MemberDao {
	public int insertMember(Member member) throws ClassNotFoundException, SQLException;
	
	public int joinMemberOk(String email) throws ClassNotFoundException, SQLException;
	
	public int grantDefaultRole(String email) throws ClassNotFoundException, SQLException;

	public int updateMember(Member member) throws ClassNotFoundException, SQLException;

	public int deleteMember(String email) throws ClassNotFoundException, SQLException;

	public Member getMember(String email) throws ClassNotFoundException, SQLException;

	public List<Member> getMembers() throws ClassNotFoundException, SQLException;
	
	public int emailCheck(String email) throws ClassNotFoundException, SQLException;
}
