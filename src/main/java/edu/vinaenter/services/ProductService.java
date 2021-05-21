package edu.vinaenter.services;

import java.util.List;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import edu.vinaenter.dao.ProductDAO;
import edu.vinaenter.models.Product;

@Service
public class ProductService implements ICRUDService<Product> {
	
	@Autowired
	private ProductDAO productDAO;

	@Override
	public List<Product> getAll() {
		return productDAO.getAll();
	}

	@Override
	public int edit(Product t) {
		return productDAO.edit(t);
	}

	@Override
	public int save(Product t) {
		return productDAO.save(t);
	}

	@Override
	public int deleteById(int id) {
		return productDAO.deleteById(id);
	}

	@Override
	public Product getById(int id) {
		return productDAO.getById(id);
	}

	@Override
	public Product findOne(Product t) {
		return productDAO.findOne(t);
	}

	public Product validateUpdate(@Valid Product Product) {
		return productDAO.validateUpdate(Product);
	}

	public List<Product> getBySearch(String search,int offset,int totalPage) {
		return productDAO.getBySearch(search,offset,totalPage);
	}

	public List<Product> getProductByCatId(int cat_id) {
		return productDAO.getProductByCatId(cat_id);
	}
	
	public List<Product> getByPagination(int offset,int current){
		return productDAO.getByPagination(offset, current);
	}
	
	public int getTotalProduct() {
		return productDAO.totalRow();
	}

	public int totalRowSearch(String search) {
		return productDAO.totalRowSearch(search);
	}

}
