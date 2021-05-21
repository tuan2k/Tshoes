package edu.vinaenter.models;

import javax.validation.constraints.NotBlank;
import javax.validation.constraints.Size;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Setter
@Getter
@NoArgsConstructor
public class Role {
	
	private int id;
	
	@NotBlank
	@Size(max = 20, message="role name has max = 20")
	private String name;
	
	
}
