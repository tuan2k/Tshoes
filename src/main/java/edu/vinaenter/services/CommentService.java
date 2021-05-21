package edu.vinaenter.services;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import edu.vinaenter.dao.CommentDAO;
import edu.vinaenter.models.Comment;

@Service
public class CommentService implements ICRUDService<Comment>{
	
	@Autowired
	private CommentDAO commentDAO;

	@Override
	public List<Comment> getAll() {
		return commentDAO.getAll();
	}

	@Override
	public int edit(Comment t) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int save(Comment t) {
		return commentDAO.save(t);
	}

	@Override
	public int deleteById(int id) {
		// TODO Auto-generated method stub
		return 0;
	}
	
	public List<Comment> getByProductId(int id) {
		return commentDAO.getByProductId(id);
	}

	@Override
	public Comment getById(int id) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Comment findOne(Comment t) {
		// TODO Auto-generated method stub
		return null;
	}

}
