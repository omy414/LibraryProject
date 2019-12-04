package com.sol.member;


import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Repository;

@Repository
public interface MemberDAO {
	
	public void create(MemberVO vo) throws Exception;
	
	public MemberVO selectPw(MemberVO vo);
	//로그인
	public boolean idcheck(MemberVO vo) throws Exception;
	
	public MemberVO viewMember(MemberVO vo);
	
	public void logout(HttpSession session);
}
