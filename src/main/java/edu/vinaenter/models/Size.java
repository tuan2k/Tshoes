package edu.vinaenter.models;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Setter
@Getter
@NoArgsConstructor
public class Size {

	private int id;

	private int size;
	
//	@javax.validation.constraints.Size(min =0,max =200)
//	private String name;

	public Size(int id, int size) {
		super();
		this.id = id;
		this.size = size;
	}
	
	

}
