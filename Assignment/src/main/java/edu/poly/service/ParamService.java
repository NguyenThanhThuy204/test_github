package edu.poly.service;

import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.nio.file.StandardCopyOption;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.util.StringUtils;
import org.springframework.web.multipart.MultipartFile;

import jakarta.servlet.http.HttpServletRequest;

@Service
public class ParamService {
	
	@Autowired
	HttpServletRequest request;
	
	public String getString(String name, String defaultValue) {
		if(request.getParameter(name) != null)
			return request.getParameter(name);
		else 
			return defaultValue;
	}
	
	public int getInt(String name, int defaultValue) {
		try {
			if(request.getParameter(name) != null)
				return Integer.parseInt(request.getParameter(name));
			else 
				return defaultValue;
		} catch (Exception e) {
			// TODO: handle exception
			return defaultValue;
		}
	}
	
	public double getDouble(String name, double defaultValue) {
		try {
			if(request.getParameter(name) != null)
				return Double.parseDouble(request.getParameter(name));
			else 
				return defaultValue;
		} catch (Exception e) {
			// TODO: handle exception
			return defaultValue;
		}
	}
	
	public boolean getBoolean(String name, boolean defaultValue) {
		try {
			if(request.getParameter(name) != null)
				return true;
			else 
				return defaultValue;
		} catch (Exception e) {
			// TODO: handle exception
			return defaultValue;
		}
	}
	
	public Date getDate(String name, String pattern) throws ParseException {
		SimpleDateFormat simpleDateFormat = new SimpleDateFormat(pattern);
		if(request.getParameter(name) != null) {
			Date date = new Date();
			date = simpleDateFormat.parse(request.getParameter(name));
			return date;
		}
		else 
			return null;
	}
	
	public File save(MultipartFile file, String path) throws IOException {
		if(!file.isEmpty()) {
			String fileName = StringUtils.cleanPath(file.getOriginalFilename());
			System.out.println(path + fileName);
            Path paths = Paths.get(path + fileName);
            Files.copy(file.getInputStream(), paths, StandardCopyOption.REPLACE_EXISTING);
			return new File(path + fileName);
		}
		else 
			return null;
	}
}
