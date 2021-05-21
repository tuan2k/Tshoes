package edu.vinaenter.services;

import java.util.List;
import javax.validation.Valid;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import edu.vinaenter.dao.ImageDAO;
import edu.vinaenter.models.Image;

@Service
public class ImageService  implements ICRUDService<Image>{
	
	@Autowired
	private ImageDAO imageDAO;

	@Override
	public List<Image> getAll() {
		return imageDAO.getAll();
	}

	@Override
	public int edit(Image t) {
		return imageDAO.edit(t);
	}

	@Override
	public int save(Image t) {
		return imageDAO.save(t);
	}

	@Override
	public int deleteById(int id) {
		return imageDAO.deleteById(id);
	}

	@Override
	public Image getById(int id) {
		return imageDAO.getById(id);
	}

	@Override
	public Image findOne(Image t) {
		return imageDAO.findOne(t);
	}

	public Image validateUpdate(@Valid Image Image) {
		return imageDAO.validateUpdate(Image);
	}

	public List<Image> getBySearch(String search) {
		return null;
	}

}
