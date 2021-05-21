package edu.vinaenter.services;

import java.util.List;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.expression.ParseException;
import org.springframework.stereotype.Service;

import edu.vinaenter.dao.UserDAO;
import edu.vinaenter.models.User;

@Service
public class UserService implements ICRUDService<User> {
	
	@Autowired // DI
	private UserDAO userDAO;
		
	public User getById(int id) {
		return userDAO.getById(id);
	}
	
	public int save(User user) {
		return userDAO.save(user);
	}
	
	public int edit(User user) {
		return userDAO.edit(user);
	}
	
	public int deleteById(int id) {
		return userDAO.deleteById(id);
	}

	@Override
	public User findOne(User t) {
		return userDAO.findOne(t);
	}

	public User getByName(String username) {
		return userDAO.getByName(username);
	}

	public User validateUpdate(@Valid User user) {
		return userDAO.validateUpdate(user);
	}

	public List<User> getBySearch(String search) {
		return userDAO.getBySearch(search);
	}

	@Override
	public List<User> getAll() {
		List<User> list=null;
		try {
			list = userDAO.getAll();
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return list;
	}

	public User getByUsernameAndPassword(String username, String password) {
		return userDAO.getByUsernameAndPassword(username,password);
	}

	public int saveSignup(User u) {
		return userDAO.saveSignup(u);
	}
}