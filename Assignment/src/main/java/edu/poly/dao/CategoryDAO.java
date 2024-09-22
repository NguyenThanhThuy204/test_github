package edu.poly.dao;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

import edu.poly.entity.Category;

public interface CategoryDAO extends JpaRepository<Category, String>{
	
	List<Category> findByIsDelete(Boolean isDelete);
}
