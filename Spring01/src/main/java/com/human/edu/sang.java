package com.human.edu;

import java.util.Locale;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class sang {
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String insert(Locale locale, Model model) {
		return null;		
		
	}
	public String update(Locale locale, Model model) {
		return null;
		
	}
	public String delete(Model m) {
		return null;
		
	}

}
