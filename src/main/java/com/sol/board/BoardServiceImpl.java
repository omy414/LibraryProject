package com.sol.board;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Service;


@Service
public class BoardServiceImpl implements BoardService {
	@Inject
	BoardDAO boardDao;
	 
	//게시글 쓰기
	@Override
	public void create(BoardVO vo) throws Exception{
		String title = vo.getTitle();
		String content = vo.getContent();
		String userId = vo.getUserId();
		
		
		title = title.replace("<", "&lt;");
		title = title.replace("<", "&gt;");
		userId = userId.replace("<", "&lt;");
		userId = userId.replace("<", "&gt;");
		
		
		title = title.replace(" ", "&nbsp;&nbsp;");
		userId = userId.replace(" " , "&nbsp;&nbsp;");
		
		//줄바꿈 문자처리
		content = content.replace("\n", "<br>");
		vo.setTitle(title);
		vo.setContent(content);
		vo.setUserId(userId);
		
		System.out.println(title);
		System.out.println(content);
		boardDao.create(vo);
	}
	
	@Override
	public BoardVO change(int bno) throws Exception {
		return boardDao.changeread(bno);
	}

	//게시글 상세보기
	@Override
	public BoardVO read(int bno) throws Exception{
			return boardDao.read(bno);
	}
	//게시글 수정
	@Override
	public  void update(BoardVO vo) throws Exception{
		boardDao.update(vo);
	}
	//게시글 삭제
	@Override
	public  void delete(int bno) throws Exception {
		boardDao.delete(bno);
	}
	//게시글 전체 목록
	@Override
	public  List<BoardVO> listAll(int start, int end, String searchOption, String keyword) throws Exception{
		return boardDao.listAll(start,end,searchOption,keyword);
	}
	@Override
	public int countArticle(String searchOption, String keyword) throws Exception{
		return boardDao.countArticle(searchOption, keyword);
	}
	@Override
	public void increaseViewcnt(int bno, HttpSession session) throws Exception{
	
		  long update_time = 0; 
		  if(session.getAttribute("update_time_"+bno) != null) {
			  update_time = (long)session.getAttribute("update_time_"+bno); 
			  } 
		  long current_time = System.currentTimeMillis();
		  
		  System.out.println("업데이트시간 : "+update_time);
		  System.out.println("최신시간 : "+current_time);
		  if(current_time - update_time > 5*1000) { boardDao.increaseViewcnt(bno);
		  session.setAttribute("update_time_"+bno, current_time); }
		 
	
	}
}
