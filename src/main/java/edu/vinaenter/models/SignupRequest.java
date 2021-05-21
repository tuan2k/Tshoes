package edu.vinaenter.models;

import javax.validation.constraints.NotBlank;
import javax.validation.constraints.Size;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@NoArgsConstructor
public class SignupRequest {
	
	@Size(min=3)
	@NotBlank
	private String username;
	
	@NotBlank
	@Size(max=50)
	private String fullname;
	
	@NotBlank
	@Size(max= 100)
	private String 	address;
	
	@NotBlank
	@Size(max=15)
	private String phone;
	
	@NotBlank
	@Size(max=30)
	private String password;
	
	@NotBlank
	@Size(max = 30)
	private String rpassword;

}
