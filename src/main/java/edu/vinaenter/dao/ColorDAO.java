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

import edu.vinaenter.models.Color;

@Repository
public class ColorDAO {
	
	@Autowired
	private JdbcTemplate jdbcTemplate;


	public List<Color> getAll() {
		String sql = "select * from colors";
		return jdbcTemplate.query(sql, new BeanPropertyRowMapper<>(Color.class));
	}

	public int edit(Color t) {
		String sql = "update colors set name= ? where id = ?";
		return jdbcTemplate.update(sql, t.getName(),t.getId());
	}

	public int save(Color t) {
		String sql = "insert into colors(name) values (?)";
		return jdbcTemplate.update(sql, t.getName());
	}

	public int deleteById(int id) {
		String sql = "delete from colors where id = ?";
		return jdbcTemplate.update(sql, id);
	}

	public Color getById(int id) {
		String sql = "select * from colors where id = ?";
		return jdbcTemplate.queryForObject(sql, new BeanPropertyRowMapper<>(Color.class), new Object[] { id });
	}

	public Color findOne(Color t) {
		String sql = "select * from colors where name =?";
		return jdbcTemplate.query(sql, new ResultSetExtractor<Color>(){
			@Override
			public Color extractData(ResultSet rs) throws SQLException, DataAccessException {
				// TODO Auto-generated method stub
				Color c = new Color();
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

	public Color validateUpdate(@Valid Color color) {
		String sql = "select * from colors where name =? and id != ?";
		return jdbcTemplate.query(sql, new ResultSetExtractor<Color>(){
			@Override
			public Color extractData(ResultSet rs) throws SQLException, DataAccessException {
				// TODO Auto-generated method stub
				Color c = new Color();
				if(rs.next()) {
					c.setId(rs.getInt("id"));
					c.setName(rs.getString("name"));
				}else {
					c =  null;
				}
				return c;
			}
		},color.getName(),color.getId());
	}

}
