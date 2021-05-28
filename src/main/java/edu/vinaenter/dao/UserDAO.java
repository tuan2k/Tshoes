package edu.vinaenter.dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.ResultSetExtractor;
import org.springframework.stereotype.Repository;

import edu.vinaenter.models.User;

@Repository
public class UserDAO {
	
	@Autowired
	private JdbcTemplate jdbcTemplate;
	
	public List<User> getAll() {
		String sql = "select * from users";
		return jdbcTemplate.query(sql, new BeanPropertyRowMapper<>(User.class));
	}

	public User getById(int id) {
		String sql = "select * from users where id = ?";
		return jdbcTemplate.queryForObject(sql, new BeanPropertyRowMapper<>(User.class), new Object[] { id });// id thoi
	}

	public int save(User user) {
		String sql = "insert into users(username,password,fullname,address,phone,gender,role_id) values (?,?,?,?,?,?,?)";
		return jdbcTemplate.update(sql, user.getUsername(),user.getPassword(),user.getFullname(),
				user.getAddress(),user.getPhone(),user.getGender(),user.getRole_id());
	}

	public int edit(User user) {
		String sql = "update users set username= ?, password =?, fullname=?,address=?,"
				+ "phone=?,gender=?,role_id=? where id = ?";
		return jdbcTemplate.update(sql, user.getUsername(),user.getPassword(),user.getFullname(),
				user.getAddress(),user.getPhone(),user.getGender(),user.getRole_id(),user.getId());
	}

	public int deleteById(int id) {
		String sql = "delete from users where id = ?";
		return jdbcTemplate.update(sql, id);
	}

	public User findOne(User t) {
		String sql = "select * from users where username =?";
		return jdbcTemplate.query(sql, new ResultSetExtractor<User>(){
			@Override
			public User extractData(ResultSet rs) throws SQLException, DataAccessException {
				// TODO Auto-generated method stub
				User u = new User();
				if(rs.next()) {
					u.setId(rs.getInt("id"));
					u.setUsername(rs.getString("username"));
					u.setPassword(rs.getString("password"));
					u.setFullname(rs.getString("fullname"));
					u.setAddress(rs.getString("address"));
					u.setPhone(rs.getString("phone"));
					u.setGender(rs.getString("gender"));
					u.setRole_id(rs.getInt("role_id"));
				}else {
					u =  null;
				}
				return u;
			}
		},t.getUsername());
	}

	public User getByName(String username) {
		String sql = "select * from users where username = ?";
		return jdbcTemplate.queryForObject(sql, new BeanPropertyRowMapper<>(User.class), new Object[] { username });
	}

	public User validateUpdate(@Valid User user) {
		String sql = "select * from users where id !=? and username = ?";
		return jdbcTemplate.query(sql, new ResultSetExtractor<User>(){
			@Override
			public User extractData(ResultSet rs) throws SQLException, DataAccessException {
				// TODO Auto-generated method stub
				User u = new User();
				if(rs.next()) {
					u.setId(rs.getInt("id"));
					u.setUsername(rs.getString("username"));
					u.setPassword(rs.getString("password"));
					u.setFullname(rs.getString("fullname"));
					u.setAddress(rs.getString("address"));
					u.setPhone(rs.getString("phone"));
					u.setGender(rs.getString("gender"));
					u.setRole_id(rs.getInt("role_id"));
				}else {
					u =  null;
				}
				return u;
			}
		},user.getId(), user.getUsername());
	}

	public List<User> getBySearch(String search,int offset,int current) {
		String sql = "SELECT * FROM users where username like '%"+search+"%'"
				+ " or fullname like '%"+search+"%' limit ?,?";
		return jdbcTemplate.query(sql, new ResultSetExtractor<List<User>>(){
			@Override
			public List<User> extractData(ResultSet rs) throws SQLException, DataAccessException {
				// TODO Auto-generated method stub
				ArrayList<User> arrUsers = new ArrayList<User>();
				while(rs.next()) {
					User u = new User();
					u.setId(rs.getInt("id"));
					u.setUsername(rs.getString("username"));
					u.setPassword(rs.getString("password"));
					u.setFullname(rs.getString("fullname"));
					u.setAddress(rs.getString("address"));
					u.setPhone(rs.getString("phone"));
					u.setGender(rs.getString("gender"));
					u.setRole_id(rs.getInt("role_id"));
					arrUsers.add(u);
				}
				return arrUsers;
			}
		},offset,current);
	}

	public User getByUsernameAndPassword(String username, String password) {
		String sql = "select * from users where username =? and password = ?";
		return jdbcTemplate.query(sql, new ResultSetExtractor<User>(){
			@Override
			public User extractData(ResultSet rs) throws SQLException, DataAccessException {
				// TODO Auto-generated method stub
				User u = new User();
				if(rs.next()) {
					u.setId(rs.getInt("id"));
					u.setUsername(rs.getString("username"));
					u.setPassword(rs.getString("password"));
					u.setFullname(rs.getString("fullname"));
					u.setAddress(rs.getString("address"));
					u.setPhone(rs.getString("phone"));
					u.setGender(rs.getString("gender"));
					u.setRole_id(rs.getInt("role_id"));
				}else {
					u =  null;
				}
				return u;
			}
		},username,password);
	}
	
	public List<User> getByPagination(int offset, int current){
		String sql = "SELECT * FROM  users limit ?,?";
		return jdbcTemplate.query(sql, new ResultSetExtractor<List<User>>(){
			@Override
			public List<User> extractData(ResultSet rs) throws SQLException, DataAccessException {
				// TODO Auto-generated method stub
				ArrayList<User> arrUsers = new ArrayList<User>();
				while(rs.next()) {
					User u = new User();
					u.setId(rs.getInt("id"));
					u.setUsername(rs.getString("username"));
					u.setPassword(rs.getString("password"));
					u.setFullname(rs.getString("fullname"));
					u.setAddress(rs.getString("address"));
					u.setPhone(rs.getString("phone"));
					u.setGender(rs.getString("gender"));
					u.setRole_id(rs.getInt("role_id"));
					arrUsers.add(u);
				}
				return arrUsers;
			}
		},offset,current);
	}

	public int saveSignup(User u) {
		String sql = "insert into users(username,password,fullname,address,phone,role_id) values (?,?,?,?,?,?)";
		return jdbcTemplate.update(sql, u.getUsername(),u.getPassword(),u.getFullname(),
				u.getAddress(),u.getPhone(),u.getRole_id());
	}

	public int getTotalUser() {
		String sql = "select count(*) as count from users";
		return jdbcTemplate.queryForObject(sql, Integer.class);
	}

	public int totalRowSearch(String search) {
		String sql = "select count(*) as count from users where username like '%"+search+"%' or fullname like '%"
				+search+ "%'";
		return jdbcTemplate.queryForObject(sql, Integer.class);
	}
}
