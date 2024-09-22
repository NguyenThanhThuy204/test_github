package edu.poly.dao;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import edu.poly.entity.Account;
import edu.poly.entity.Cart;
import edu.poly.key.CartKey;

public interface CartDAO extends JpaRepository<Cart, CartKey>{
	
	List<Cart> findByAccountCart(Account account);
}
