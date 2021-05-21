package edu.vinaenter.services;

import java.util.List;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import edu.vinaenter.dao.CartDAO;
import edu.vinaenter.models.Cart;

@Service
public class CartService implements ICRUDService<Cart> {
	
	@Autowired
	private CartDAO cartDAO;

	@Override
	public List<Cart> getAll() {
		return cartDAO.getAll();
	}

	@Override
	public int edit(Cart t) {
		return cartDAO.edit(t);
	}

	@Override
	public int save(Cart t) {
		return cartDAO.save(t);
	}

	@Override
	public int deleteById(int id) {
		return cartDAO.deleteById(id);
	}

	@Override
	public Cart getById(int id) {
		return cartDAO.getById(id);
	}

	@Override
	public Cart findOne(Cart t) {
		return cartDAO.findOne(t);
	}

	public Cart validateUpdate(@Valid Cart Cart) {
		return cartDAO.validateUpdate(Cart);
	}

	public List<Cart> getBySearch(String search) {
		return cartDAO.getBySearch(search);
	}

	public List<Cart> getCartByOrderId(int id) {
		// TODO Auto-generated method stub
		return cartDAO.getCartByOrderId(id);
	}

}
