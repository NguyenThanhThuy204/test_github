package edu.poly.config;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

import edu.poly.service.AuthInterceptor;
import edu.poly.service.CartTotalInterceptor;
import edu.poly.service.GlobalInterceptor;

@Configuration
public class InterceptorConfig implements WebMvcConfigurer{
	
	@Autowired
	AuthInterceptor auth;
	
	@Autowired
	GlobalInterceptor global;
	
	@Autowired
	CartTotalInterceptor cart;
	
	@Override
	public void addInterceptors(InterceptorRegistry registry) {
		// TODO Auto-generated method stub
		registry.addInterceptor(global)
			.addPathPatterns("/**")
			.excludePathPatterns("/assets/**");
		
		registry.addInterceptor(cart)
		.addPathPatterns("/", "/shop/**")
		.excludePathPatterns("/assets/**");
		
		registry.addInterceptor(auth)
			.addPathPatterns("/account/**", "/admin/**", "/shop/cart", "/shop/cart/**")
			.excludePathPatterns("/assets/**");
	}
	
	
}
