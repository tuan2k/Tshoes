package edu.vinaenter.models;

import javax.validation.constraints.NotBlank;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;


@Getter
@Setter
@NoArgsConstructor
public class User {
	
	private int id;
	
	@NotBlank
	@Size(max=30, message="username has max size is 30")
	private String username;
	
	@Size(min=1,max=50, message="password has max length is 50 and min is 1")
	private String password;
	
	@Size(max=100,message="address has max length is 100")
	private String address;
	
	@Size(max=20,message="phone has max length is 20")
	private String phone;
	
	@NotBlank
	@Size(max =50, message="fullname has max length is 50")
	private String fullname;
	
	@Size(max=10,message="gender has max length is 10")
	private String gender;
	
	@NotNull
	private int role_id;

	public User(@NotBlank @Size(max = 30, message = "username has max size is 30") String username,
			@NotBlank @Size(max = 50, message = "password has max length is 50") String password,
			@NotBlank @Size(max = 100, message = "address has max length is 100") String address,
			@NotBlank @Size(max = 20, message = "phone has max length is 20") String phone,
			@NotBlank @Size(max = 50, message = "fullname has max length is 50") String fullname,
			@NotNull int role_id) {
		super();
		this.username = username;
		this.password = password;
		this.address = address;
		this.phone = phone;
		this.fullname = fullname;
		this.role_id = role_id;
	}
	
	
}
