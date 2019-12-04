package com.sol.reply;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

@Repository
public class ReplyDAOImpl implements ReplyDAO {
	@Inject
	SqlSession sqlSession;

	@Override
	public List<ReplyVO> list(Integer bno) {
		// TODO Auto-generated method stub
		return sqlSession.selectList("reply.listReply", bno);
	}

	@Override
	public void create(ReplyVO vo) {
		// TODO Auto-generated method stub
		sqlSession.insert("reply.insertReply",vo);
		
	}

	@Override
	public void update(ReplyVO vo) {
		// TODO Auto-generated method stub
		
		
	}

	@Override
	public void delete(Integer rno) {
		// TODO Auto-generated method stub
		
	}
	
}
