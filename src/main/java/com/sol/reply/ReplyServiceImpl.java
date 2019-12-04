package com.sol.reply;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

@Service
public class ReplyServiceImpl implements ReplyService {
	@Inject
	ReplyDAO replyDao;

	@Override
	public List<ReplyVO> list(Integer bno) {
		// TODO Auto-generated method stub
		return replyDao.list(bno);
	}

	@Override
	public void create(ReplyVO vo) {
		// TODO Auto-generated method stub
		replyDao.create(vo);
		
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
