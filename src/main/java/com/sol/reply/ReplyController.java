package com.sol.reply;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

@RestController
@RequestMapping("/reply/*")
public class ReplyController {
		@Inject
		ReplyService replyService;
		
		//댓글 에 관한 부분 ----------------------------------------------------------
				//댓글 입력
			@RequestMapping("insertReply")
			public void insertReply(@ModelAttribute ReplyVO vo, HttpSession session) {
				System.out.println("찍히냐");
				String userId = (String) session.getAttribute("userId");
				vo.setUserId(userId);
				replyService.create(vo);
			}
				//댓글 목록(화면을 리턴)
			@RequestMapping("listReply")
			public ModelAndView listReply(@RequestParam int bno, ModelAndView mav) {
				List<ReplyVO> list = replyService.list(bno);
				mav.setViewName("listReply");
				mav.addObject("list", list);
				return mav;
			}
				//댓글 목록(Json방식으로 처리 데이터를 리턴)
			@RequestMapping("listreplyJson")
			@ResponseBody //리턴 데이터를 json으로 변환(생략 가능)
			public List<ReplyVO> listreplyJson(@RequestParam int bno){
				List<ReplyVO> list = replyService.list(bno);
				return list;
			}
			
}
