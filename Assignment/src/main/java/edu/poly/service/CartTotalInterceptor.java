package edu.poly.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.HandlerInterceptor;

import edu.poly.dao.CartDAO;
import edu.poly.entity.Account;
import edu.poly.entity.Cart;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@Service
public class CartTotalInterceptor implements HandlerInterceptor{
	
	@Autowired
	SessionService session;
	
	@Autowired
	CartDAO cartDao;
	
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		// TODO Auto-generated method stub
		Account user = session.get("user");
		if(user!=null) {
			List<Cart> cart = cartDao.findByAccountCart(user);
			double totalCart = 0.0;
			for(Cart ca:cart) {
				totalCart += ca.getQuantity()*ca.getProductCart().getPrice();
			}
			request.setAttribute("totalCart", totalCart);
			request.setAttribute("numberCart", cart.size());
		}
		return true;
	}
	
}
