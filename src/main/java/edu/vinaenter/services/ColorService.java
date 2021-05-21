package edu.vinaenter.services;

import java.util.List;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import edu.vinaenter.dao.ColorDAO;
import edu.vinaenter.models.Color;

@Service
public class ColorService  implements ICRUDService<Color>{
	
	@Autowired
	private ColorDAO colorDAO;

	@Override
	public List<Color> getAll() {
		return colorDAO.getAll();
	}

	@Override
	public int edit(Color t) {
		return colorDAO.edit(t);
	}

	@Override
	public int save(Color t) {
		return colorDAO.save(t);
	}

	@Override
	public int deleteById(int id) {
		return colorDAO.deleteById(id);
	}

	@Override
	public Color getById(int id) {
		return colorDAO.getById(id);
	}

	@Override
	public Color findOne(Color t) {
		return colorDAO.findOne(t);
	}

	public Color validateUpdate(@Valid Color color) {
		return colorDAO.validateUpdate(color);
	}

	public List<Color> getBySearch(String search) {
		return null;
	}

}
