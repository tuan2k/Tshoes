package edu.vinaenter.models;

import javax.validation.constraints.NotBlank;
import javax.validation.constraints.Size;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Setter
@Getter
@NoArgsConstructor
public class Color {

	private int id;

	@NotBlank
	@Size(max = 20, message = "color name has max = 20")
	private String name;

	public Color(int id, @NotBlank @Size(max = 20, message = "color name has max = 20") String name) {
		super();
		this.id = id;
		this.name = name;
	}
	
	

}
