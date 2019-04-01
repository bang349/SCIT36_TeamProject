package com.teamBlueScreen.TeamProject;


import java.util.Locale;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController 
{
	
	/**
	 * Simply selects the home view to render by returning its name.
	 */
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Locale locale, Model model) 
	{
		return "proKan_login";
	}
	
	@RequestMapping(value = "/proKan_register", method = RequestMethod.GET)
	public String proKan_register()
	{
		System.out.println("into proKan_register method");
		return "proKan_register";
	}
	
}
