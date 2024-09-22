package edu.poly.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.HandlerInterceptor;

import edu.poly.entity.Account;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@Service
public class AuthInterceptor implements HandlerInterceptor{
	
	@Autowired
	SessionService session;
	
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		// TODO Auto-generated method stub
		String uri = request.getRequestURI();
		Account user = session.get("user");
		String error = "";
		if(user == null) { 
			error = "Please login!";
		}
		else if(!user.getAdmin() && uri.startsWith("/admin/")) {
			error = "Access denied!";
		}
		if(error.length() > 0) {
			session.set("security-uri", uri);
			response.sendRedirect("/sign-in?error="+error);
			return false;
		}
		return true;
	}
}
