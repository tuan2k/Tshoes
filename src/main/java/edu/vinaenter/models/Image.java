package edu.vinaenter.models;

import javax.validation.constraints.NotBlank;
import javax.validation.constraints.Size;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Setter
@Getter
@NoArgsConstructor
public class Image {
	
	private int id;

	@NotBlank
	@Size(max = 30, message = "image name has max = e0")
	private String name;

	public Image(int id, @NotBlank @Size(max = 30, message = "image name has max = e0") String name) {
		super();
		this.id = id;
		this.name = name;
	}

	public Image(String originalFilename) {
		this.name = originalFilename;
	}
	
	

}
