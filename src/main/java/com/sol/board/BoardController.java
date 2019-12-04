package com.sol.board;

import java.util.HashMap;
import java.util.List;

import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;

import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import org.springframework.web.servlet.ModelAndView;





@Controller
public class BoardController {
	
	@Inject
	BoardService boardService;
	
	
	
	//게시판 보기
	@RequestMapping("Mainboard")
	public ModelAndView list(@RequestParam(defaultValue="title") String searchOption,
							 @RequestParam(defaultValue="") String keyword,
							 @RequestParam(defaultValue="1") int curPage) throws Exception{
		
		System.out.println(keyword);
		int count = boardService.countArticle(searchOption, keyword);
		//페이지 나누기
		BoardPager boardPager = new BoardPager(count, curPage);
		int start = boardPager.getPageBegin();
		int end = boardPager.getPageEnd();
		
		
		List<BoardVO> list = boardService.listAll(start, end, searchOption, keyword);
		//데이터를 맵에 저장
		Map<String,Object> map = new HashMap<String, Object>();
		map.put("list", list); 
		map.put("count", count); //레코드 갯수
		map.put("searchOption", searchOption);//검색옵션
		map.put("keyword", keyword); //검색 키워드
		map.put("boardPager", boardPager); //페이지 처리
		System.out.println(keyword);
	
		
		ModelAndView mav = new ModelAndView();
		mav.addObject("map", map); //맵에 저장된 데이터를 mav에 저장
		mav.setViewName("Mainboard");
		return mav;
	}
	
	//글쓰기 폼보기
	@RequestMapping(value="write", method=RequestMethod.GET)
	public String write() {
		return "write";
	}
	
	// 게시글 작성처리
	@RequestMapping(value="insert", method=RequestMethod.POST)
	public String insert(@ModelAttribute BoardVO vo) throws Exception{
		boardService.create(vo);
		return "redirect:Mainboard";
	}
	
	//게시글 상세내용 조회 조회수 증가처리
	@RequestMapping(value="view", method=RequestMethod.GET)
	public ModelAndView view(@RequestParam int bno, HttpSession session) throws Exception{
		boardService.increaseViewcnt(bno, session);
		ModelAndView mav = new ModelAndView();
		mav.setViewName("view");
		mav.addObject("dto", boardService.read(bno));
		return mav;
	}
	//게시글 수정으로 가기
	@RequestMapping(value="change", method=RequestMethod.GET)
	public ModelAndView change(@RequestParam int bno, HttpSession session) throws Exception{
		ModelAndView mav = new ModelAndView();
		mav.setViewName("change");
		mav.addObject("dto", boardService.read(bno));
		return mav; 
	}
	
	
	//게시글 수정
	@RequestMapping(value="update", method=RequestMethod.POST)
	public String update(@ModelAttribute BoardVO vo) throws Exception{
		boardService.update(vo);
		return "redirect:Mainboard";
	}
	
	//게시글 삭제
	@RequestMapping("delete")
	public String delete(@RequestParam int bno) throws Exception {
		boardService.delete(bno);
		return "redirect:Mainboard";
	}
}
