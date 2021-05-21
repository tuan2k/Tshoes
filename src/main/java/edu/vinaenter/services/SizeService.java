package edu.vinaenter.services;

import java.util.List;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import edu.vinaenter.dao.SizeDAO;
import edu.vinaenter.models.Size;

@Service
public class SizeService  implements ICRUDService<Size>{
	
	@Autowired
	private SizeDAO sizeDAO;

	@Override
	public List<Size> getAll() {
		return sizeDAO.getAll();
	}

	@Override
	public int edit(Size t) {
		return sizeDAO.edit(t);
	}

	@Override
	public int save(Size t) {
		return sizeDAO.save(t);
	}

	@Override
	public int deleteById(int id) {
		return sizeDAO.deleteById(id);
	}

	@Override
	public Size getById(int id) {
		return sizeDAO.getById(id);
	}

	@Override
	public Size findOne(Size t) {
		return sizeDAO.findOne(t);
	}

	public Size validateUpdate(@Valid Size Size) {
		return sizeDAO.validateUpdate(Size);
	}

	public List<Size> getBySearch(String search) {
		return null;
	}

}
