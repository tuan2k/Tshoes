package edu.vinaenter.models;

import javax.validation.constraints.NotBlank;
import javax.validation.constraints.Size;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Setter
@Getter
@NoArgsConstructor
public class Category {
	
	private int id;
	
	private int parent_id;

	@NotBlank
	@Size(max = 30, message = "category name has max = e0")
	private String name;

	public Category(int id, int parent_id,
			@NotBlank @Size(max = 30, message = "category name has max = e0") String name) {
		super();
		this.id = id;
		this.parent_id = parent_id;
		this.name = name;
	}
	
	

}
