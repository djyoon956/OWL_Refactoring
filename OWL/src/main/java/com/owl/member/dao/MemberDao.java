package com.owl.member.dao;

import java.util.List;

import com.owl.member.dto.Member;

public interface MemberDao {
	public int insertMember(Member member);

	public int updateMember(Member member);

	public int deleteMember(String email);

	public Member getMember(String email);

	public List<Member> getMembers();
}
