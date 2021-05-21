package edu.vinaenter.dao;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import edu.vinaenter.models.Role;

@Repository
public class RoleDAO {
	
	@Autowired
	private JdbcTemplate jdbcTemplate;

	public List<Role> getAll() {
		String sql = "select * from role";
		return jdbcTemplate.query(sql, new BeanPropertyRowMapper<>(Role.class));
	}

}
