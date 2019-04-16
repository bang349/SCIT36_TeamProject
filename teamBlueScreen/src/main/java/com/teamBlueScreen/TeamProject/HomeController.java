package com.teamBlueScreen.TeamProject;


import java.util.Locale;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController 
{
	
	/**
	 * Simply selects the home view to render by returning its name
	 */
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Locale locale, Model model) 
	{
		return "Prokan/defaultPage";
		//return "proKan_login";
	}
	
	@RequestMapping(value = "/proKan_register", method = RequestMethod.GET)
	public String proKan_register()
	{
		return "proKan_register";
	}
	
	@RequestMapping(value = "/defaultPage", method = RequestMethod.GET)
	public String defultPage()
	{
		return "defaultPage";
	}
	
	@RequestMapping(value = "/successLogin", method = RequestMethod.POST)
	@ResponseBody
	public String successLogin(String userId, HttpSession httpSession)
	{
		httpSession.setAttribute("userId", userId);
		System.out.println("sessionValue in Controller : " + userId + " / " + httpSession.getAttribute("userId"));
		return "Success";
	}
	
	@RequestMapping(value = "/projectDetailed", method = RequestMethod.GET)
	
	public String projectDetailed()
	{
		return "Prokan/projectDetailed";
	}
}
