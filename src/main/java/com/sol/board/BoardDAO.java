package com.sol.board;

import java.util.List;



import org.springframework.stereotype.Repository;

@Repository
public interface BoardDAO {
	//게시글 작성
	public void create(BoardVO vo) throws Exception;
	//게시글 상세보기
	public BoardVO read(int bno) throws Exception;
	//게시글 수정페이지보기
	public BoardVO changeread(int bno) throws Exception;
	//게시글 수정
	public void update(BoardVO vo) throws Exception;
	//게시글 삭제
	public void delete(int bno) throws Exception;
	//게시글 전체 목록
	public List<BoardVO> listAll(int start, int end, String searchOption, String keyword) throws Exception;
	//게시글 조회 증가
	public void increaseViewcnt(int bno) throws Exception;
	//게시글 검색
	public int countArticle(String searchOption, String keyword) throws Exception;
}
