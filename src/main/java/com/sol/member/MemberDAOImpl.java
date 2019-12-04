package com.sol.member;



import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

@Repository
public class MemberDAOImpl implements MemberDAO {

	@Inject
	SqlSession SqlSession;
	
	//회원가입
	@Override
	public void create(MemberVO vo) throws Exception{
		SqlSession.insert("member.Memberinsert",vo);
	}

	
	//로그인
	public boolean idcheck(MemberVO userId) throws Exception{
		String name= SqlSession.selectOne("member.login", userId);
		System.out.print("이름 : ");
		System.out.println(name);
		return (name == null) ? false : true;
	}
	
	public MemberVO viewMember(MemberVO vo) {
		return SqlSession.selectOne("member.viewMember", vo);
	}
	
	public void logout(HttpSession session) {
		
	}

	@Override
	public MemberVO selectPw(MemberVO vo) {
		return SqlSession.selectOne("member.selectPW",vo);
	}
	
}
