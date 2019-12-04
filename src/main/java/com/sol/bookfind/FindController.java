package com.sol.bookfind;

import java.util.Locale;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class FindController{

	
	//신작안내
	@RequestMapping(value = "/newevent", method = RequestMethod.GET)
	public String Bookfind(Locale locale, Model model) {
		return "newevent";
	}
	
	@RequestMapping(value = "/bookfind2", method = RequestMethod.GET)
	public String Bookfind2(Locale locale, Model model) {
		return "bookfind2";
	}
	
	@RequestMapping(value = "/test", method = RequestMethod.GET)
	public String test(Locale locale, Model model) {
		return "test";
	}
	
	@RequestMapping(value = "/test4", method = RequestMethod.GET)
	public String test2(Locale locale, Model model) {
		return "test4";
	}
	
	
	/*
	 * @RequestMapping(value = "/reservation", method = RequestMethod.GET) public
	 * String Reservation(Locale locale, Model model) { return "reservation"; }
	 */
	
	
	// 자료검색
	@Autowired
    private BookService service; 
    
    //키워드가 있을때도 있고 없을때도있음 
    //있을때는 가져가고 없을때는 안가져가고 
    @RequestMapping("bookfind")
    public ModelAndView bookList(@RequestParam(required=false)String keyword){
        ModelAndView mav = new ModelAndView();
        
		
		 if(keyword !=null) {
		 mav.addObject("bookList",service.searchBook(keyword,10,1)); 
		 }
		 
        mav.setViewName("bookfind");
        return mav;
    }
	
    
    //찾아오는길
	@RequestMapping(value = "/direction", method = RequestMethod.GET)
	public String Direction(Locale locale, Model model) {
		return "direction";
	}
	
}
