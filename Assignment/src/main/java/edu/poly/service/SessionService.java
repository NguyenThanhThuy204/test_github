package edu.poly.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import jakarta.servlet.http.HttpSession;

@Service
public class SessionService {
	
	@Autowired
	HttpSession session;
	
	public <T> T get(String name){
		if(session.getAttribute(name)!=null)
			return (T) session.getAttribute(name);
		else 
			return null;
	}
	
	public void set(String name, Object value) {
		session.setAttribute(name, value);
	}
	
	public void remove(String name) {
		session.removeAttribute(name);
	}
}
