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

import edu.vinaenter.models.Cart;

@Repository
public class CartDAO {
	
	@Autowired
	private JdbcTemplate jdbcTemplate;
	
	public List<Cart> getAll() {
		String sql = "select * from cart";
		return jdbcTemplate.query(sql, new BeanPropertyRowMapper<>(Cart.class));
	}

	public int edit(Cart t) {
		String sql = "update cart set order_id =?, color_id=?,size_id=?,product_id=?,number=? where id = ?";
		return jdbcTemplate.update(sql,t.getOrder_id(),t.getColor_id(),
				t.getSize_id(),t.getProduct_id(),t.getNumber() ,t.getId());
	}

	public int save(Cart t) {
		String sql = "insert into cart(order_id,color_id,size_id,product_id,number) values (?,?,?,?,?)";
		return jdbcTemplate.update(sql, t.getOrder_id(),t.getColor_id(),t.getSize_id(),t.getProduct_id(),t.getNumber());
	}

	public int deleteById(int id) {
		String sql = "delete from cart where id = ?";
		return jdbcTemplate.update(sql, id);
	}

	public Cart getById(int id) {
		String sql = "select * from cart where id = ?";
		return jdbcTemplate.queryForObject(sql, new BeanPropertyRowMapper<>(Cart.class), new Object[] { id });
	}

	public Cart findOne(Cart t) {
		String sql = "select * from cart where order_id =?";
		return jdbcTemplate.query(sql, new ResultSetExtractor<Cart>(){
			@Override
			public Cart extractData(ResultSet rs) throws SQLException, DataAccessException {
				// TODO Auto-generated method stub
				Cart c = new Cart();
				if(rs.next()) {
					c.setId(rs.getInt("id"));
					c.setOrder_id(rs.getInt("order_id"));
					c.setColor_id(rs.getInt("color_id"));
					c.setSize_id(rs.getInt("size_id"));
					c.setProduct_id(rs.getInt("produtct_id"));
					c.setNumber(rs.getInt("number"));
				}else {
					c =  null;
				}
				return c;
			}
		},t.getOrder_id());
	}

	public Cart validateUpdate(@Valid Cart cart) {
		String sql = "select * from cart where order_id =? and id != ?";
		return jdbcTemplate.query(sql, new ResultSetExtractor<Cart>(){
			@Override
			public Cart extractData(ResultSet rs) throws SQLException, DataAccessException {
				// TODO Auto-generated method stub
				Cart c = new Cart();
				if(rs.next()) {
					c.setId(rs.getInt("id"));
					c.setOrder_id(rs.getInt("order_id"));
					c.setColor_id(rs.getInt("color_id"));
					c.setSize_id(rs.getInt("size_id"));
					c.setProduct_id(rs.getInt("produtct_id"));
					c.setNumber(rs.getInt("number"));
				}else {
					c =  null;
				}
				return c;
			}
		},cart.getOrder_id(),cart.getId());
	}

	public List<Cart> getBySearch(String search) {
		// TODO Auto-generated method stub
		return null;
	}

	public List<Cart> getCartByOrderId(int id) {
		String sql = "select * from cart where order_id =?";
		return jdbcTemplate.query(sql, new ResultSetExtractor<List<Cart>>(){
			@Override
			public List<Cart> extractData(ResultSet rs) throws SQLException, DataAccessException {
				ArrayList<Cart> arrCart = new ArrayList<Cart>();
				while(rs.next()) {
					Cart c = new Cart();
					c.setId(rs.getInt("id"));
					c.setOrder_id(rs.getInt("order_id"));
					c.setColor_id(rs.getInt("color_id"));
					c.setSize_id(rs.getInt("size_id"));
					c.setProduct_id(rs.getInt("product_id"));
					c.setNumber(rs.getInt("number"));
					arrCart.add(c);
				}
				return arrCart;
			}
		},id);
		
	}


}
