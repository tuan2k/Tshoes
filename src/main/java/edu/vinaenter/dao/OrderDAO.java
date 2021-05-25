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

import edu.vinaenter.models.Order;

@Repository
public class OrderDAO {
	
	@Autowired
	private JdbcTemplate jdbcTemplate;
	
	public List<Order> getAll() {
		String sql = "select * from orders";
		return jdbcTemplate.query(sql, new BeanPropertyRowMapper<>(Order.class));
	}

	public int edit(Order t) {
		String sql = "update orders set user_id =?, total=?,status=?,note=? where id = ?";
		return jdbcTemplate.update(sql, t.getUser_id(),t.getTotal(),t.getStatus(),t.getNote(),t.getId());
	}

	public int save(Order t) {
		String sql = "insert into orders(user_id,total,status,note) values (?,?,?,?)";
		return jdbcTemplate.update(sql, t.getUser_id(),t.getTotal(),t.getStatus(),t.getNote());
	}

	public int deleteById(int id) {
		String sql = "delete from orders where id = ?";
		return jdbcTemplate.update(sql, id);
	}

	public Order getById(int id) {
		String sql = "select * from orders where id = ?";
		return jdbcTemplate.queryForObject(sql, new BeanPropertyRowMapper<>(Order.class), new Object[] { id });
	}

	public Order findOne(Order t) {
		String sql = "select * from orders where user_id =?";
		return jdbcTemplate.query(sql, new ResultSetExtractor<Order>(){
			@Override
			public Order extractData(ResultSet rs) throws SQLException, DataAccessException {
				// TODO Auto-generated method stub
				Order c = new Order();
				if(rs.next()) {
					c.setId(rs.getInt("id"));
					c.setUser_id(rs.getInt("user_id"));
					c.setTotal(rs.getInt("total"));
					c.setDate(rs.getTimestamp("date"));
					c.setStatus(rs.getInt("status"));
					c.setNote(rs.getString("note"));
				}else {
					c =  null;
				}
				return c;
			}
		},t.getUser_id());
	}

	public Order validateUpdate(@Valid Order order) {
		String sql = "select * from orders where user_id =? and id != ?";
		return jdbcTemplate.query(sql, new ResultSetExtractor<Order>(){
			@Override
			public Order extractData(ResultSet rs) throws SQLException, DataAccessException {
				// TODO Auto-generated method stub
				Order c = new Order();
				if(rs.next()) {
					c.setId(rs.getInt("id"));
					c.setUser_id(rs.getInt("user_id"));
					c.setTotal(rs.getInt("total"));
					c.setDate(rs.getTimestamp("date"));
					c.setStatus(rs.getInt("status"));
					c.setNote(rs.getString("note"));
				}else {
					c =  null;
				}
				return c;
			}
		},order.getUser_id(),order.getId());
	}

	public List<Order> getBySearch(String search) {
		// TODO Auto-generated method stub
		return null;
	}

	public Order getByIdAndStatus(int user_id, int status) {
		String sql = "select * from orders where user_id =? and status = ?";
		return jdbcTemplate.query(sql, new ResultSetExtractor<Order>(){
			@Override
			public Order extractData(ResultSet rs) throws SQLException, DataAccessException {
				// TODO Auto-generated method stub
				Order c = new Order();
				if(rs.next()) {
					c.setId(rs.getInt("id"));
					c.setUser_id(rs.getInt("user_id"));
					c.setTotal(rs.getInt("total"));
					c.setDate(rs.getTimestamp("date"));
					c.setStatus(rs.getInt("status"));
					c.setNote(rs.getString("note"));
				}else {
					c =  null;
				}
				return c;
			}
		},user_id,status);
	}

	public Order getByUserIdAndTotal(int id, int totalPrice) {
		String sql = "select * from orders where user_id =? and total = ?";
		return jdbcTemplate.query(sql, new ResultSetExtractor<Order>(){
			@Override
			public Order extractData(ResultSet rs) throws SQLException, DataAccessException {
				// TODO Auto-generated method stub
				Order c = new Order();
				if(rs.next()) {
					c.setId(rs.getInt("id"));
					c.setUser_id(rs.getInt("user_id"));
					c.setTotal(rs.getInt("total"));
					c.setDate(rs.getTimestamp("date"));
					c.setStatus(rs.getInt("status"));
					c.setNote(rs.getString("note"));
				}else {
					c =  null;
				}
				return c;
			}
		},id,totalPrice);
	}
	
	public List<Order> GetByMonthAndYear(int month,int year){
		String sql = "SELECT * FROM orders WHERE MONTH(date) = ? and YEAR(date) = ?";
		return jdbcTemplate.query(sql, new ResultSetExtractor<List<Order>>(){
			@Override
			public List<Order> extractData(ResultSet rs) throws SQLException, DataAccessException {
				// TODO Auto-generated method stub
				List<Order> listOrders = new ArrayList<Order>();
				while(rs.next()) {
					Order c = new Order();
					c.setId(rs.getInt("id"));
					c.setUser_id(rs.getInt("user_id"));
					c.setTotal(rs.getInt("total"));
					c.setDate(rs.getTimestamp("date"));
					c.setStatus(rs.getInt("status"));
					c.setNote(rs.getString("note"));
					listOrders.add(c);
				}
				return listOrders;
			}
		},month,year);
	}

}
