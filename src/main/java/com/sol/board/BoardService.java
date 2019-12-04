package com.sol.board;

import java.util.List;

import javax.servlet.http.HttpSession;

public interface BoardService {

		//게시글작성
	public void create(BoardVO vo) throws Exception;
		//게시글상세보기
	public BoardVO read(int bno) throws Exception;
		//게시글 수정페이지
	public BoardVO change(int bno) throws Exception;
	
		//게시글 수정
	public void update(BoardVO vo) throws Exception;
		//게시글 삭제
	public void delete(int bno) throws Exception;
		//게시글 전체 목록
	public List<BoardVO> listAll(int start, int end, String searchOption, String keyword) throws Exception;
		//게시글 조회
	public void increaseViewcnt(int bno, HttpSession session) throws Exception;
	
	public int countArticle(String searchOption, String keyword) throws Exception;
}
