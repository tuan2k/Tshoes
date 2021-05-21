package edu.vinaenter.models;

import java.sql.Timestamp;
import javax.validation.constraints.NotNull;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Setter
@Getter
@NoArgsConstructor
public class Order {
	
	private int id;
	
	@NotNull
	private int user_id;
	
	private int total;
	
	private Timestamp date;
	
	private int status;
	
	private String note;

	public Order(int id, @NotNull int user_id, int total, Timestamp date, int status, String note) {
		super();
		this.id = id;
		this.user_id = user_id;
		this.total = total;
		this.date = date;
		this.status = status;
		this.note = note;
	}

	public Order(int user_id, int total, int status, String note) {
		super();
		this.user_id = user_id;
		this.total = total;
		this.status = status;
		this.note = note;
	}
	
	

}
