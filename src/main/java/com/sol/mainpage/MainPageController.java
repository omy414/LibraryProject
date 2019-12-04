package com.sol.mainpage;

import java.util.Locale;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;


@Controller
@RequestMapping("/")
public class MainPageController {

	
	//테스트용 메인홈
		@RequestMapping(value = "/home", method = RequestMethod.GET)
		public String home(Locale locale, Model model) {
			return "home";
		}
		
		//기본 메인
		@RequestMapping(value = "/Main", method = RequestMethod.GET)
		public String Main(Locale locale, Model model) {
			return "Main";
		}
		
		//도서관 정보보기
		@RequestMapping(value = "/libraryInfo", method = RequestMethod.GET)
		public String libraryInfo(Locale locale, Model model) {
			return "libraryInfo";
		}
}
