package com.human.edu;

import java.text.DateFormat;
import java.util.Date;
import java.util.Locale;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	/**
	 * Simply selects the home view to render by returning its name.
	 */
	@RequestMapping(value = "/home", method = RequestMethod.GET)
	public String home(Locale locale, Model model) {				
		return "home";
	}
	@RequestMapping("/login")
	public String login() {	
			
			return "login";
	}

	@RequestMapping("/doLogin")
		public String doLogin(@RequestParam("userid") String id,
								@RequestParam("passcode") String pw,
				Model model) {
			
			if(id.equals("")) {
				return "redirect:login";
			}else {
				model.addAttribute("userid",id);
				model.addAttribute("passcode",pw);
				return "home";
			}
			
		}

	
	@RequestMapping("/signon")
	public String signon() {					
			return "signon";
	}
	@RequestMapping("/signon_check")
	public String sign(@ModelAttribute("m") Member member) {	
		return "personal";
//			String name=member.getRealname();
//			if(name.equals("")) {
//				return "signon";
//			}else {
//				return "login";
//			}			
	}
	@RequestMapping("/signon_can")
	public String signon_check() {					
			return "login";
	}
	@RequestMapping("/logout")
	public String logout() {					
			return "redirect:home";
	}
}
