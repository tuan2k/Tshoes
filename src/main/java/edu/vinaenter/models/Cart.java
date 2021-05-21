package edu.vinaenter.models;

import javax.validation.constraints.NotNull;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Setter
@Getter
@NoArgsConstructor
public class Cart {
	
	private int id;
	
	@NotNull
	private int order_id;
	
	@NotNull
	private int color_id;
	
	@NotNull
	private int size_id;
	
	@NotNull
	private int product_id;
	
	@NotNull
	private int number;

	public Cart(@NotNull int order_id, @NotNull int color_id, @NotNull int size_id, @NotNull int product_id,
			@NotNull int number) {
		super();
		this.order_id = order_id;
		this.color_id = color_id;
		this.size_id = size_id;
		this.product_id = product_id;
		this.number = number;
	}
	
	
	
	

}
