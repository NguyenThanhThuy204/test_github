package edu.poly.controller;

import java.util.Comparator;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Map.Entry;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Sort;
import org.springframework.data.domain.Sort.Direction;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import edu.poly.dao.CategoryDAO;
import edu.poly.dao.ProductDAO;
import edu.poly.entity.Category;
import edu.poly.entity.Product;
import edu.poly.service.SessionService;

import java.util.Optional;
import java.util.Set;
import java.util.stream.Collectors;

@Controller
public class HomeController {
	
	@Autowired
	ProductDAO proDao;
	
	@Autowired
	CategoryDAO caDao;
	
	@Autowired
	SessionService session;
	
	@RequestMapping("/")
	public String index() {
		return "index";
	}
	
	@GetMapping("/shop")
	public String shop(Model model, @RequestParam("p") Optional<Integer> p, @RequestParam("name") Optional<String> name, 
					   @RequestParam("sort") Optional<Boolean> sort, @RequestParam("category") Optional<String> category, 
					   @RequestParam("price") Optional<Integer> price) {
		session.set("searchShop", name.orElse(""));
		session.set("sortShop", sort.orElse(true));
		Page<Product> products = proDao.findAllByNameLikeAndCategoryIdLike("%"+name.orElse("")+"%", "%"+category.orElse("")+"%",
								PageRequest.of(p.orElse(0), 12, Sort.by(sort.orElse(true)?Direction.ASC:Direction.DESC, "price")));
		if(price.orElse(-1) == 2) {
			products = proDao.findAllByNameLikeAndCategoryIdLikeAndPriceGreaterThanEqual("%"+name.orElse("")+"%", "%"+category.orElse("")+"%",
					price.orElse(0)*100000, 
					PageRequest.of(p.orElse(0), 12, Sort.by(sort.orElse(true)?Direction.ASC:Direction.DESC, "price")));
		}
		else if(price.orElse(-1) == 0 || price.orElse(-1) == 1) {
			products = proDao.findAllByNameLikeAndCategoryIdLikeAndPriceBetween("%"+name.orElse("")+"%", "%"+category.orElse("")+"%",
					price.orElse(0)*100000, (price.orElse(0) +1)*100000,
					PageRequest.of(p.orElse(0), 12, Sort.by(sort.orElse(true)?Direction.ASC:Direction.DESC, "price")));
		}
		Map<Integer, Object[]> map = new HashMap<>();
		for(Product pro:products) {
			map.put(pro.getId(), new Object[] {
				pro.getName(),
				pro.getPrice(),
				pro.getCategory(),
				pro.getImage().split(",", 0)
			});
		}
		
		Set<Entry<Integer, Object[]>> entries = map.entrySet();
		
		List<Entry<Integer, Object[]>> list  = sort.orElse(true)?entries.stream().sorted(Comparator.comparingDouble((e) -> Double.parseDouble(String.valueOf(e.getValue()[1])))).collect(Collectors.toList())
											   :entries.stream().sorted(Comparator.comparingDouble((e) -> -Double.parseDouble(String.valueOf(e.getValue()[1])))).collect(Collectors.toList());
		model.addAttribute("page", products);
		model.addAttribute("products", list);
		return "shop";
	}
	
	@GetMapping("/shop/detail/{id}")
	public String shop_detail(Model model, @PathVariable("id") Integer id) {
		Product p = proDao.findById(id).get();
		Object[] obj = new Object[] {
			p.getId(),
			p.getName(),
			p.getPrice(),
			p.getImage().split(",", 0),
			p.getCategory(),
			p.getQuantity()
		};
		List<Product> list = proDao.findByCategory(p.getCategory());
		Map<Integer, Object[]> map = new HashMap<>();
		for(Product pro:list) {
			map.put(pro.getId(), new Object[] {
				pro.getName(),
				pro.getPrice(),
				pro.getCategory(),
				pro.getImage().split(",", 0)
			});
		}
		model.addAttribute("detailProduct", obj);
		model.addAttribute("relatedProducts", map);
		return "shop-details";
	}
	
	@ModelAttribute("categories")
	public List<Category> categories_data(){
		return caDao.findByIsDelete(false);
	}
	
	@ModelAttribute("bestSellers")
	public Map<Integer, Object[]> bestSellers_data(Model model){
		List<Product> products = proDao.findAllRandom();
		Map<Integer, Object[]> map = new HashMap<>();
		for(Product p:products) {
			map.put(p.getId(), new Object[] {
				p.getName(),
				p.getPrice(),
				p.getCategory(),
				p.getImage().split(",", 0),
				p.getPrice()<130000
			});
		}
		model.addAttribute("year", new Date().getYear() + 1900);
		return map;
	}
}
