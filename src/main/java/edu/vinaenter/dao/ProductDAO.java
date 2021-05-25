package edu.vinaenter.dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.ResultSetExtractor;
import org.springframework.stereotype.Repository;

import edu.vinaenter.models.Product;

@Repository
public class ProductDAO {
	
	@Autowired
	private JdbcTemplate jdbcTemplate;
	
	public List<Product> getAll() {
		String sql = "select * from products";
		return jdbcTemplate.query(sql, new ResultSetExtractor<List<Product>>(){
			@Override
			public List<Product> extractData(ResultSet rs) throws SQLException, DataAccessException {
				ArrayList<Product> arrProduct = new ArrayList<Product>();
				while(rs.next()) {
					Product c = new Product();
					ArrayList<Integer> arrImage = new ArrayList<Integer>();
					c.setId(rs.getInt("id"));
					c.setName(rs.getString("name"));
					c.setPrice(rs.getInt("price"));
					c.setNumber(rs.getInt("number"));
					c.setDescription(rs.getString("description"));
					c.setCat_id(rs.getInt("cat_id"));
					String image = rs.getString("image");
					String arr[] = image.split(",");
					for (int i=0;i<=arr.length-1;i++) {
						arrImage.add(Integer.parseInt(arr[i]));
					}
					c.setArImage(arrImage);
					c.setSize(rs.getString("size"));
					c.setColor(rs.getString("color"));
					arrProduct.add(c);
				}
				return arrProduct;
			}
		});
	}

	public int edit(Product t) {
		String image = "";
		for (int obj : t.getArImage()) {
			image += obj + ",";
		}
		String sql = "update products set name =?, price=?,number=?,description=?,cat_id=?,image=?,color=?,size=? where id = ?";
		return jdbcTemplate.update(sql,t.getName(),t.getPrice(),t.getNumber(),t.getDescription(),
				t.getCat_id(),image,t.getColor(),t.getSize(),t.getId());
	}

	public int save(Product t) {
		String sql = "insert into products(name,price,number,description,cat_id,image,color,size) values (?,?,?,?,?,?,?,?)";
		String image = "";
		for (int obj : t.getArImage()) {
			image += obj + ",";
		}
		image= image.substring(0, image.length()-1);
		return jdbcTemplate.update(sql,t.getName(),t.getPrice(),t.getNumber(),t.getDescription()
				,t.getCat_id(),image,t.getColor(),t.getSize());
	}

	public int deleteById(int id) {
		String sql = "delete from products where id = ?";
		return jdbcTemplate.update(sql, id);
	}

	public Product getById(int id) {
		String sql = "select * from products where id = ?";
		return jdbcTemplate.query(sql, new ResultSetExtractor<Product>(){
			@Override
			public Product extractData(ResultSet rs) throws SQLException, DataAccessException {
				Product c = new Product();
				if(rs.next()) {
					ArrayList<Integer> arrImage = new ArrayList<Integer>();
					c.setId(rs.getInt("id"));
					c.setName(rs.getString("name"));
					c.setPrice(rs.getInt("price"));
					c.setNumber(rs.getInt("number"));
					c.setDescription(rs.getString("description"));
					c.setCat_id(rs.getInt("cat_id"));
					String image = rs.getString("image");
					String arr[] = image.split(",");
					for (int i=0;i<=arr.length-1;i++) {
						arrImage.add(Integer.parseInt(arr[i]));
					}
					c.setArImage(arrImage);
					c.setSize(rs.getString("size"));
					c.setColor(rs.getString("color"));
				}else {
					c = null;
				}
				return c;
			}
		},id);
	}

	public Product findOne(Product t) {
		String sql = "select * from products where name =?";
		return jdbcTemplate.query(sql, new ResultSetExtractor<Product>(){
			@Override
			public Product extractData(ResultSet rs) throws SQLException, DataAccessException {
				// TODO Auto-generated method stub
				Product c = new Product();
				if(rs.next()) {
					ArrayList<Integer> arrImage = new ArrayList<Integer>();
					c.setId(rs.getInt("id"));
					c.setName(rs.getString("name"));
					c.setPrice(rs.getInt("price"));
					c.setDescription(rs.getString("description"));
					c.setCat_id(rs.getInt("cat_id"));
					String image = rs.getString("image");
					for (int i=0;i<=image.length()-1;i++) {
						if (image.charAt(i) != ',' ) {
							arrImage.add((int) image.charAt(i));
						}
					}
					c.setArImage(arrImage);
					c.setSize(rs.getString("size"));
					c.setColor(rs.getString("color"));
				}else {
					c =  null;
				}
				return c;
			}
		},t.getName());
	}

	public Product validateUpdate(Product Product) {
		String sql = "select * from products where name =? and id != ?";
		return jdbcTemplate.query(sql, new ResultSetExtractor<Product>(){
			@Override
			public Product extractData(ResultSet rs) throws SQLException, DataAccessException {
				// TODO Auto-generated method stub
				Product c = new Product();
				if(rs.next()) {
					ArrayList<Integer> arrImage = new ArrayList<Integer>();
					c.setId(rs.getInt("id"));
					c.setName(rs.getString("name"));
					c.setPrice(rs.getInt("price"));
					c.setDescription(rs.getString("description"));
					c.setCat_id(rs.getInt("cat_id"));
					String image = rs.getString("image");
					for (int i=0;i<=image.length()-1;i++) {
						if (image.charAt(i) != ',' ) {
							arrImage.add((int) image.charAt(i));
						}
					}
					c.setArImage(arrImage);
					c.setSize(rs.getString("size"));
					c.setColor(rs.getString("color"));
				}else {
					c =  null;
				}
				return c;
			}
		},Product.getName(),Product.getId());
	}
	
	public List<Product> getByPagination(int offset, int current){
		String sql = "SELECT * FROM  products limit ?,?";
		return jdbcTemplate.query(sql, new ResultSetExtractor<List<Product>>(){
			@Override
			public List<Product> extractData(ResultSet rs) throws SQLException, DataAccessException {
				// TODO Auto-generated method stub
				ArrayList<Product> arrProduct = new ArrayList<Product>();
				while(rs.next()) {
					Product c = new Product();
					ArrayList<Integer> arrImage = new ArrayList<Integer>();
					c.setId(rs.getInt("id"));
					c.setName(rs.getString("name"));
					c.setPrice(rs.getInt("price"));
					c.setNumber(rs.getInt("number"));
					c.setDescription(rs.getString("description"));
					c.setCat_id(rs.getInt("cat_id"));
					String image = rs.getString("image");
					String arr[] = image.split(",");
					for (int i=0;i<=arr.length-1;i++) {
						arrImage.add(Integer.parseInt(arr[i]));
					}
					c.setArImage(arrImage);
					c.setSize(rs.getString("size"));
					c.setColor(rs.getString("color"));
					arrProduct.add(c);
				}
				return arrProduct;
			}
		},offset,current);
	}
	
	public int totalRow() {
		String sql = "select count(*) as count from products";
		return jdbcTemplate.queryForObject(sql, Integer.class);
	}
	
	public int totalRowCategory(int cid) {
		String sql = "select count(*) as count from products where cat_id = "+cid;
		return jdbcTemplate.queryForObject(sql,Integer.class);
	}
	
	public int totalRowSearch(String search,int cat_id) {
		String sql = "select count(*) as count from products where cat_id="+cat_id+" and name like '%"
				+search+"%'";
		return jdbcTemplate.queryForObject(sql, Integer.class);
	}
	
	public int totalRowSearch(String search) {
		String sql = "select count(*) as count from products where name like '%"
				+search+"%'";
		return jdbcTemplate.queryForObject(sql, Integer.class);
	}

	public List<Product> getBySearch(String search,int cat_id,int offset,int totalPage) {
		String sql = "SELECT p.id as pid," + 
				"	  p.name," + 
				"     p.price," + 
				"     p.number," + 
				"     p.description," + 
				"     p.color," + 
				"     p.size," + 
				"     p.image," +
				"	  p.cat_id "	
				+ "FROM products p INNER JOIN categories c ON p.cat_id = c.id where c.id = ? and p.name like '%"
					+search+"%'" +" limit ?,?";
		return jdbcTemplate.query(sql,new ResultSetExtractor<List<Product>>() {
			@Override
			public List<Product> extractData(ResultSet rs) throws SQLException, DataAccessException {
				// TODO Auto-generated method stub
				ArrayList<Product> arrProduct = new ArrayList<Product>();
				while(rs.next()) {
					Product c = new Product();
					ArrayList<Integer> arrImage = new ArrayList<Integer>();
					c.setId(rs.getInt("pid"));
					c.setName(rs.getString("name"));
					c.setPrice(rs.getInt("price"));
					c.setNumber(rs.getInt("number"));
					c.setDescription(rs.getString("description"));
					c.setCat_id(rs.getInt("cat_id"));
					String image = rs.getString("image");
					String arr[] = image.split(",");
					for (int i=0;i<=arr.length-1;i++) {
						arrImage.add(Integer.parseInt(arr[i]));
					}
					c.setArImage(arrImage);
					c.setSize(rs.getString("size"));
					c.setColor(rs.getString("color"));
					arrProduct.add(c);
				}
				return arrProduct;
			}
		},cat_id,offset,totalPage);
	}
	
	public List<Product> getBySearch(String search,int offset,int totalPage) {
		String sql = "select * from products where name like '%"
					+search+"%'" +" or description like '%"+search+"%' limit ?,?";
		return jdbcTemplate.query(sql,new ResultSetExtractor<List<Product>>() {
			@Override
			public List<Product> extractData(ResultSet rs) throws SQLException, DataAccessException {
				// TODO Auto-generated method stub
				ArrayList<Product> arrProduct = new ArrayList<Product>();
				while(rs.next()) {
					Product c = new Product();
					ArrayList<Integer> arrImage = new ArrayList<Integer>();
					c.setId(rs.getInt("pid"));
					c.setName(rs.getString("name"));
					c.setPrice(rs.getInt("price"));
					c.setNumber(rs.getInt("number"));
					c.setDescription(rs.getString("description"));
					c.setCat_id(rs.getInt("cat_id"));
					String image = rs.getString("image");
					String arr[] = image.split(",");
					for (int i=0;i<=arr.length-1;i++) {
						arrImage.add(Integer.parseInt(arr[i]));
					}
					c.setArImage(arrImage);
					c.setSize(rs.getString("size"));
					c.setColor(rs.getString("color"));
					arrProduct.add(c);
				}
				return arrProduct;
			}
		},offset,totalPage);
	}

	public List<Product> getProductByCatId(int cat_id) {
		String sql = "select * from products where cat_id= ?";
		return jdbcTemplate.query(sql, new ResultSetExtractor<List<Product>>(){
			@Override
			public List<Product> extractData(ResultSet rs) throws SQLException, DataAccessException {
				// TODO Auto-generated method stub
				ArrayList<Product> arrProduct = new ArrayList<Product>();
				while(rs.next()) {
					Product c = new Product();
					ArrayList<Integer> arrImage = new ArrayList<Integer>();
					c.setId(rs.getInt("id"));
					c.setName(rs.getString("name"));
					c.setPrice(rs.getInt("price"));
					c.setNumber(rs.getInt("number"));
					c.setDescription(rs.getString("description"));
					c.setCat_id(rs.getInt("cat_id"));
					String image = rs.getString("image");
					String arr[] = image.split(",");
					for (int i=0;i<=arr.length-1;i++) {
						arrImage.add(Integer.parseInt(arr[i]));
					}
					c.setArImage(arrImage);
					c.setSize(rs.getString("size"));
					c.setColor(rs.getString("color"));
					arrProduct.add(c);
				}
				return arrProduct;
			}
		},cat_id);
	}

	public List<Product> getByCatPagination(int cid, int offset, int totalPage) {
		String sql = "SELECT * FROM products where cat_id= ? limit ?,?";
		return jdbcTemplate.query(sql, new ResultSetExtractor<List<Product>>(){
			@Override
			public List<Product> extractData(ResultSet rs) throws SQLException, DataAccessException {
				// TODO Auto-generated method stub
				ArrayList<Product> arrProduct = new ArrayList<Product>();
				while(rs.next()) {
					Product c = new Product();
					ArrayList<Integer> arrImage = new ArrayList<Integer>();
					c.setId(rs.getInt("id"));
					c.setName(rs.getString("name"));
					c.setPrice(rs.getInt("price"));
					c.setNumber(rs.getInt("number"));
					c.setDescription(rs.getString("description"));
					c.setCat_id(rs.getInt("cat_id"));
					String image = rs.getString("image");
					String arr[] = image.split(",");
					for (int i=0;i<=arr.length-1;i++) {
						arrImage.add(Integer.parseInt(arr[i]));
					}
					c.setArImage(arrImage);
					c.setSize(rs.getString("size"));
					c.setColor(rs.getString("color"));
					arrProduct.add(c);
				}
				return arrProduct;
			}
		},cid,offset,totalPage);
	}

}
