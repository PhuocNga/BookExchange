package com.bookexchange.service;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bookexchange.dao.ICategoryDAO;
import com.bookexchange.model.Bookcategory;

@Service
@Transactional
public class ICategoryServiceImpl implements ICategoryService{

	@Autowired
	ICategoryDAO  cateDAO;
	
	@Override
	public List<Bookcategory> getAllCate() {
		return cateDAO.getAllCate();
	}

}
