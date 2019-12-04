package com.sol.board;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

@Repository
public class BoardDAOImpl implements BoardDAO {

	@Inject
	SqlSession SqlSession;
	
	//게시글 작성
	@Override
	public void create(BoardVO vo) throws Exception{
		SqlSession.insert("board.insert",vo);
	}
	
	//게시글 상세보기
	@Override
	public BoardVO read(int bno) throws Exception{
		return SqlSession.selectOne("board.view",bno);
	}
	//게시글 수정
	@Override
	public void update(BoardVO vo) throws Exception{
		SqlSession.update("board.updateArticle", vo);
	}
	@Override
	public BoardVO changeread(int bno) throws Exception {
		return SqlSession.selectOne("board.change",bno);
	}

	//게시글 삭제
	@Override
	public void delete(int bno) throws Exception {
		SqlSession.delete("board.deleteArticle",bno);
	}
	//게시글 전체 목록
	@Override
	public List<BoardVO> listAll(int start, int end,String searchOption, String keyword) throws Exception{
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("searchOption", searchOption);
		map.put("keyword", keyword);
		map.put("start", start);
		map.put("end", end);
		System.out.println(start);
		System.out.println(end);
		
		return SqlSession.selectList("board.listAll", map);
	}
	
	
	//게시글 조회수 증가
	@Override
	public void increaseViewcnt(int bno) throws Exception {
		SqlSession.update("board.increaseViewcnt",bno);
	}
	
	//게시글 레코드 갯수
		@Override
		public int countArticle(String searchOption, String keyword) throws Exception{
			Map<String, String> map = new HashMap<String, String>();
			map.put("searchOption", searchOption);
			map.put("keyword", keyword);
			return SqlSession.selectOne("board.countArticle", map);
			
			
		}
}
