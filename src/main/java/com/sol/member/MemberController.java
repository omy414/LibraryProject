package com.sol.member;

import java.util.Locale;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class MemberController {

	@Inject
	MemberService MemberService;

	// 회원가입으로 가기
	@RequestMapping(value = "/New", method = RequestMethod.GET)
	public String New(Locale locale, Model model) {
		return "New";
	}

	// 회원 가입 처리에 대한부분 -----------------------------------------------------

	@RequestMapping(value = "Memberinsert", method = RequestMethod.POST)
	public String insert(@ModelAttribute MemberVO vo) throws Exception {
		MemberService.create(vo);
		return "redirect:Mainboard";
	}

	// 로그인 처리에 대한 부분 ----------------------------------------------------------
	@RequestMapping(value = "login", method = RequestMethod.POST)
	public ModelAndView login(@ModelAttribute MemberVO userId, HttpSession session) throws Exception {
		ModelAndView mav = new ModelAndView();
		boolean result = MemberService.idcheck(userId, session);
		System.out.println(result);
		String notice;
		if (result == true) {
			notice = "로그인 성공!!";
			mav.addObject("login", "success");
			session.setAttribute("login", "success");
			mav.setViewName("Main");
		} else {
			notice = "아이디 또는 비밀번호 오류";
			mav.addObject("login", "error");
			session.setAttribute("login", "error");
			mav.setViewName("Main");
		}

		System.out.println(notice);

		return mav;

	}

	// 로그아웃
	@RequestMapping("logout")
	public ModelAndView logout(HttpSession session) throws Exception {
		MemberService.logout(session);
		ModelAndView mav = new ModelAndView();
		mav.setViewName("Main");
		return mav;
	}

	/*
	 * @RequestMapping(value = "myinfo", method = RequestMethod.POST) public
	 * ModelAndView myinfo(MemberVO userId) throws Exception { ModelAndView mav =
	 * new ModelAndView(); MemberVO myinfo = MemberService.viewMember(userId);
	 * mav.setViewName("Main"); mav.addObject("myinfo", myinfo);
	 * System.out.println(myinfo);
	 * 
	 * return mav; }
	 */

	// 내정보보기
	@RequestMapping(value = "/myinfo", method = RequestMethod.GET)
	public String Myinfo(Locale locale, Model model) {
		return "myinfo";
	}
}
