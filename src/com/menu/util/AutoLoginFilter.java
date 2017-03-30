package com.menu.util;

import java.io.IOException;
import java.net.URLDecoder;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import com.menu.bean.User;
import com.menu.service.IUserService;
import com.menu.service.impl.UserService;


public class AutoLoginFilter implements Filter{

	@Override
	public void destroy() {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void doFilter(ServletRequest req, ServletResponse resp,
			FilterChain chain) throws IOException, ServletException {
		HttpServletRequest  request = (HttpServletRequest) req;
		
		User user  = (User)request.getSession().getAttribute("user_session");
		//如果用户未登录
		if(user == null){
			
			 //从请求里拿客户端带上来的所有的Cookie
			  Cookie[] cookies = request.getCookies();
			  
			  if(cookies != null){
				//从Cookie当中去找用户名
			     for(Cookie cookie : cookies){
			    	 String name = cookie.getName();
			    	 String value = cookie.getValue();
			    	 //存在用户名，则自动登录
			    	 if("userName".equals(name)){
			    		 //自动登录
			    		 IUserService userService = new UserService();
			    		 User user_data = userService.getUserName(URLDecoder.decode(value, "UTF-8"));
			    		 //放用户放到session里面
			    		 
			    		 HttpSession session = request.getSession();
			    		 session.setAttribute("user_session", user_data);
			    		 
			    		 
			    		
			    		 break;
			    	 }
			  
			      
			     }
			  }
			
		}
		 
		  chain.doFilter(req, resp);
		  
	}

	@Override
	public void init(FilterConfig filterConfig) throws ServletException {
		// TODO Auto-generated method stub
		
	}

}
