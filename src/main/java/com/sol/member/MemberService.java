package com.sol.member;


import javax.servlet.http.HttpSession;


public interface MemberService {

		//회원가입
	public void create(MemberVO vo) throws Exception;
		//게시글상세보기
	
		
		//로그인
	public boolean idcheck(MemberVO vo, HttpSession session) throws Exception;
	
		//로그인 정보
	public MemberVO viewMember(MemberVO vo);
	
		//로그아웃
	public void logout(HttpSession session);
}
