package edu.vinaenter.models;

import java.sql.Timestamp;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@NoArgsConstructor
public class Comment {
	
	private int id;
	
	private int user_id;
	
	private int product_id;
	
	private String content;
	
	private int rate;
	
	private Timestamp date;

	public Comment(int user_id, int product_id, String content, int rate) {
		super();
		this.user_id = user_id;
		this.product_id = product_id;
		this.content = content;
		this.rate = rate;
	}
	
	
	
	

}
