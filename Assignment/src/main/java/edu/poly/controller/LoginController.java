package edu.poly.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import edu.poly.dao.AccountDAO;
import edu.poly.entity.Account;
import edu.poly.service.SessionService;

@Controller
public class LoginController {

	@Autowired
	AccountDAO dao;
	@Autowired
	SessionService session;
	
	@GetMapping("/sign-in")
	public String signin() {
		return "signin";
	}
	
	@PostMapping("/sign-in")
	public String signin_signin(Model model, @RequestParam("username") String username, @RequestParam("password") String password) {
		String forward = "index";
		if(username.equals("")) {
			forward = "signin";
			model.addAttribute("error_signin_username", "Username empty!");
		}
		else if(password.equals("")) {
			forward = "signin";
			model.addAttribute("error_signin_password", "Password empty!");
			model.addAttribute("username", username);
		}
		else if(!dao.existsById(username)) {
			forward = "signin";
			model.addAttribute("error_signin_username", "Username not exits!");
			model.addAttribute("username", username);
		}
		else if(!dao.findById(username).get().getPassword().equals(password)) {
			forward = "signin";
			model.addAttribute("error_signin_password", "Password invalid!");
			model.addAttribute("username", username);
		}
		else {
			forward = "index";
			session.set("user", dao.findById(username).get());
		}
			
		return forward;
	}
	
	@GetMapping("/sign-up")
	public String signup(Model model, @ModelAttribute("account") Account account) {
		return "signup";
	}
	
	@PostMapping("/sign-up")
	public String signup_signup(Model model, @Validated @ModelAttribute("account") Account account, BindingResult result, @RequestParam("confirm") String confirm) {
		if(result.hasErrors())
			return "signup";
		else {
			if(account.getPassword().equals(confirm)) {
				if(!dao.existsById(account.getUsername()))
					dao.save(account);
				else {
					model.addAttribute("error_signup_username", "Username not exits!");
					return "signup";
				}
			}
			else {
				model.addAttribute("error_signup_confirm", "Confirm password invalid!");
				return "signup";
			}
		}
		return "signin";
	}
	
}
