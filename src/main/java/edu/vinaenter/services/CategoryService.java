package edu.vinaenter.services;

import java.text.ParseException;
import java.util.List;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import edu.vinaenter.dao.CatDAO;
import edu.vinaenter.models.Category;

@Service
public class CategoryService implements ICRUDService<Category> {
	
	@Autowired
	private CatDAO catDAO;

	public Category getById(int id) {
		return catDAO.getById(id);
	}

	public int save(Category category) {
		return catDAO.save(category);
	}

	public int deleteById(int id) {
		return catDAO.deleteById(id);
	}

	public int edit(Category cat) {
		return catDAO.edit(cat);
	}

	@Override
	public Category findOne(Category t) {
		return catDAO.findOne(t);
	}

	public List<Category> getBySearch(String search) {
		return catDAO.getBySearch(search);
	}

	public Category validateUpdate(@Valid Category cat) {
		return catDAO.validateUpdate(cat);
	}

	public Category getByName(String cname) {
		return catDAO.getByName(cname);
	}
	
	public int totalCategoryById(int cid) {
		return catDAO.totalCategoryById(cid);
	}

	@Override
	public List<Category> getAll() {
		List<Category> list=null;
		try {
			list = catDAO.getList();
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return list;
	}

	public List<Category> getByParent() {
		return catDAO.getByParent();
	}
	
	public List<Category> getByChild(){
		return catDAO.getByChild();
	}
	
	public List<Category> getByGrand(){
		return catDAO.getByGrand();
	}
	
}
