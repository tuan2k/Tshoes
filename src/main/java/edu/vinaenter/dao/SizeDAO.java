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

import edu.vinaenter.models.Size;

@Repository
public class SizeDAO {
	
	@Autowired
	private JdbcTemplate jdbcTemplate;


	public List<Size> getAll() {
		String sql = "select * from size";
		return jdbcTemplate.query(sql, new BeanPropertyRowMapper<>(Size.class));
	}

	public int edit(Size t) {
		String sql = "update size set size= ? where id = ?";
		return jdbcTemplate.update(sql, t.getSize(),t.getId());
	}

	public int save(Size t) {
		String sql = "insert into size(size) values (?)";
		return jdbcTemplate.update(sql, t.getSize());
	}

	public int deleteById(int id) {
		String sql = "delete from size where id = ?";
		return jdbcTemplate.update(sql, id);
	}

	public Size getById(int id) {
		String sql = "select * from size where id = ?";
		return jdbcTemplate.queryForObject(sql, new BeanPropertyRowMapper<>(Size.class), new Object[] { id });
	}

	public Size findOne(Size t) {
		String sql = "select * from size where size =?";
		return jdbcTemplate.query(sql, new ResultSetExtractor<Size>(){
			@Override
			public Size extractData(ResultSet rs) throws SQLException, DataAccessException {
				// TODO Auto-generated method stub
				Size c = new Size();
				if(rs.next()) {
					c.setId(rs.getInt("id"));
					c.setSize(rs.getInt("size"));
				}else {
					c =  null;
				}
				return c;
			}
		},t.getSize());
	}

	public Size validateUpdate(@Valid Size Size) {
		String sql = "select * from size where size =? and id != ?";
		return jdbcTemplate.query(sql, new ResultSetExtractor<Size>(){
			@Override
			public Size extractData(ResultSet rs) throws SQLException, DataAccessException {
				// TODO Auto-generated method stub
				Size c = new Size();
				if(rs.next()) {
					c.setId(rs.getInt("id"));
					c.setSize(rs.getInt("size"));
				}else {
					c =  null;
				}
				return c;
			}
		},Size.getSize(),Size.getId());
	}

}
