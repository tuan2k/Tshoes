package edu.vinaenter.models;

import java.util.ArrayList;

import javax.validation.constraints.NotBlank;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Setter
@Getter
@NoArgsConstructor
public class Product {
	
	private int id;
	
	@NotBlank
	@Size(max=50, message="product name has max length is 50")
	private String name;
	
	private int price;
	
	private int number;
	
	@NotBlank
	private String description;
	
	private String color;
	
	private String size;
	
	private ArrayList<Integer> arImage;
	
	private String string;
	
	@NotNull
	private int cat_id;
	


}
