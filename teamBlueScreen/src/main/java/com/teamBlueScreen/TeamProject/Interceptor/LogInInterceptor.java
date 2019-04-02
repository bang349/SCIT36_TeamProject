package com.teamBlueScreen.TeamProject.Interceptor;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

public class LogInInterceptor extends HandlerInterceptorAdapter
{
	HttpSession httpSession;
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception 
	{
	
		boolean isLogined = false;
		// TODO Auto-generated method stub
	
		String rootPath = request.getContextPath();
		String requestURL = request.getRequestURI();
		ArrayList<String> excludeCheckURL = new ArrayList<String>();
		excludeCheckURL.add("/TeamProject/proKan_login");
		excludeCheckURL.add("/TeamProject/");
		excludeCheckURL.add("/");
		excludeCheckURL.add("/TeamProject");
		excludeCheckURL.add("/TeamProject/successLogin");
		httpSession = request.getSession();
		
		String userId = (String)httpSession.getAttribute("userId"); 

		for(int index = 0; index<excludeCheckURL.size(); index++)
		{
			if(requestURL.equals(excludeCheckURL.get(index)) && userId == null)
			{
				System.out.println("keep going -> " + requestURL);
				return true;
			}	
		}
		return isLogined;
		/*if(userId == null)
		{
			response.sendRedirect(rootPath + "/");
			System.out.println("going -> " + rootPath);
			return false;
		}
		else
		{
				return true;
		}*/
		
	}
	
}
