package edu.vinaenter.services;

import java.util.List;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import edu.vinaenter.dao.OrderDAO;
import edu.vinaenter.models.Order;

@Service
public class OrderService implements ICRUDService<Order> {
	
	@Autowired
	private OrderDAO orderDAO;

	@Override
	public List<Order> getAll() {
		return orderDAO.getAll();
	}

	@Override
	public int edit(Order t) {
		return orderDAO.edit(t);
	}

	@Override
	public int save(Order t) {
		return orderDAO.save(t);
	}

	@Override
	public int deleteById(int id) {
		return orderDAO.deleteById(id);
	}

	@Override
	public Order getById(int id) {
		return orderDAO.getById(id);
	}

	@Override
	public Order findOne(Order t) {
		return orderDAO.findOne(t);
	}

	public Order validateUpdate(@Valid Order order) {
		return orderDAO.validateUpdate(order);
	}

	public List<Order> getBySearch(String search) {
		return orderDAO.getBySearch(search);
	}

	public Order getByIdAndStatus(int user_id, int status) {
		// TODO Auto-generated method stub
		return orderDAO.getByIdAndStatus(user_id,status);
	}

	public Order getByUserIdAndTotal(int id, int totalPrice) {
		return orderDAO.getByUserIdAndTotal(id,totalPrice);
	}

}
