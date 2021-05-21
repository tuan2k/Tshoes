package edu.vinaenter.dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.ResultSetExtractor;
import org.springframework.stereotype.Repository;

import edu.vinaenter.models.Image;

@Repository
public class ImageDAO {
	
	@Autowired
	private JdbcTemplate jdbcTemplate;

	public List<Image> getAll() {
		String sql = "select * from images";
		return jdbcTemplate.query(sql, new BeanPropertyRowMapper<>(Image.class));
	}

	public int edit(Image t) {
		String sql = "update images set name= ? where id = ?";
		return jdbcTemplate.update(sql, t.getName(),t.getId());
	}

	public int save(Image t) {
		String sql = "insert into images(name) values (?)";
		return jdbcTemplate.update(sql, t.getName());
	}

	public int deleteById(int id) {
		String sql = "delete from images where id = ?";
		return jdbcTemplate.update(sql, id);
	}

	public Image getById(int id) {
		String sql = "select * from images where id = ?";
		return jdbcTemplate.queryForObject(sql, new BeanPropertyRowMapper<>(Image.class), new Object[] { id });
	}

	public Image findOne(Image t) {
		String sql = "select * from images where name =?";
		return jdbcTemplate.query(sql, new ResultSetExtractor<Image>(){
			@Override
			public Image extractData(ResultSet rs) throws SQLException, DataAccessException {
				// TODO Auto-generated method stub
				Image c = new Image();
				if(rs.next()) {
					c.setId(rs.getInt("id"));
					c.setName(rs.getString("name"));
				}else {
					c =  null;
				}
				return c;
			}
		},t.getName());
	}

	public Image validateUpdate(@Valid Image Image) {
		String sql = "select * from images where name =? and id != ?";
		return jdbcTemplate.query(sql, new ResultSetExtractor<Image>(){
			@Override
			public Image extractData(ResultSet rs) throws SQLException, DataAccessException {
				// TODO Auto-generated method stub
				Image c = new Image();
				if(rs.next()) {
					c.setId(rs.getInt("id"));
					c.setName(rs.getString("name"));
				}else {
					c =  null;
				}
				return c;
			}
		},Image.getName(),Image.getId());
	}

}
