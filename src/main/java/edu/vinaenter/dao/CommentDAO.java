package edu.vinaenter.dao;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import edu.vinaenter.models.Comment;


@Repository
public class CommentDAO {
	
	@Autowired
	private JdbcTemplate jdbcTemplate;


	public List<Comment> getAll() {
		String sql = "select * from comment";
		return jdbcTemplate.query(sql, new BeanPropertyRowMapper<>(Comment.class));
	}

	public int save(Comment t) {
		String sql = "insert into comment(user_id,product_id,content,rate) values (?,?,?,?)";
		return jdbcTemplate.update(sql, t.getUser_id(),t.getProduct_id(),t.getContent(),t.getRate());
	}

	public int deleteById(int id) {
		String sql = "delete from comment where id = ?";
		return jdbcTemplate.update(sql, id);
	}

	public List<Comment> getByProductId(int id) {
		String sql = "select * from comment where product_id = ?";
		return jdbcTemplate.query(sql, new BeanPropertyRowMapper<>(Comment.class), new Object[] { id });
	}

}
