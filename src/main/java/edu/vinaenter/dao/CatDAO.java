package edu.vinaenter.dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.ParseException;
import java.util.List;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.ResultSetExtractor;
import org.springframework.stereotype.Repository;

import edu.vinaenter.models.Category;

@Repository
public class CatDAO {

	@Autowired
	private JdbcTemplate jdbcTemplate;

	public List<Category> getList() throws ParseException {
		String sql = "select * from categories";
		return jdbcTemplate.query(sql, new BeanPropertyRowMapper<>(Category.class));
	}

	public Category getById(int id) {
		String sql = "select * from categories where id = ?";
		return jdbcTemplate.queryForObject(sql, new BeanPropertyRowMapper<>(Category.class), new Object[] { id });// id
																													
	}
	
	public int totalCategoryById(int cid) {
		String sql = "select count(*) as count from lands l  INNER JOIN categories c on l.cid= c.cid where l.cid=?";
		return jdbcTemplate.queryForObject(sql, Integer.class,cid);
	}

	public int save(Category category) {
		String sql = "insert into categories(parent_id,name) values (?,?)";
		return jdbcTemplate.update(sql,category.getParent_id(), category.getName());
	}

	public int deleteById(int id) {
		String sql = "delete from categories where id = ?";
		return jdbcTemplate.update(sql, id);
	}
	
	public int edit(Category cat) {
		String sql = "update categories set name= ?, parent_id = ? where id = ?";
		return jdbcTemplate.update(sql, cat.getName(),cat.getParent_id(),cat.getId());
	}
	
	public Category findOne(Category t) {
		String sql = "select * from categories where name =?";
		return jdbcTemplate.query(sql, new ResultSetExtractor<Category>(){
			@Override
			public Category extractData(ResultSet rs) throws SQLException, DataAccessException {
				// TODO Auto-generated method stub
				Category c = new Category();
				if(rs.next()) {
					c.setId(rs.getInt("id"));
					c.setParent_id(rs.getInt("parent_id"));
					c.setName(rs.getString("name"));
				}else {
					c =  null;
				}
				return c;
			}
		},t.getName());
	}

	public List<Category> getBySearch(String search) {
		String sql = "SELECT * FROM categories where name like '%"+search+"%'";
		return jdbcTemplate.query(sql, new BeanPropertyRowMapper<>(Category.class));
	}

	public Category validateUpdate(@Valid Category cat) {
		String sql = "select * from categories where name =? and id !=?";
		return jdbcTemplate.query(sql, new ResultSetExtractor<Category>(){
			@Override
			public Category extractData(ResultSet rs) throws SQLException, DataAccessException {
				// TODO Auto-generated method stub
				Category c = new Category();
				if(rs.next()) {
					c.setId(rs.getInt("id"));
					c.setParent_id(rs.getInt("parent_id"));
					c.setName(rs.getString("name"));
				}else {
					c =  null;
				}
				return c;
			}
		},cat.getName(),cat.getId());
	}

	public Category getByName(String name) {
		String sql = "select * from categories where name = ?";
		return jdbcTemplate.queryForObject(sql, new BeanPropertyRowMapper<>(Category.class), new Object[] { name });
	}
	
	public List<Category> getByGrand() {
		String sql = "select * from categories where parent_id = ?";
		return jdbcTemplate.query(sql, new BeanPropertyRowMapper<>(Category.class), new Object[] { 0 });
	}

	public List<Category> getByParent() {
		String sql = "select * from categories where parent_id = ?";
		return jdbcTemplate.query(sql, new BeanPropertyRowMapper<>(Category.class), new Object[] { 1 });
	}
	
	public List<Category> getByChild() {
		String sql = "select * from categories where parent_id = ?";
		return jdbcTemplate.query(sql, new BeanPropertyRowMapper<>(Category.class), new Object[] { 2 });
	}

}
