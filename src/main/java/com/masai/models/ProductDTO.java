package com.masai.models;

import java.util.ArrayList;
import java.util.List;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class ProductDTO {
	
	private String prodName;
	private String manufaturer;
	private Double price;
	private Integer quantity;
	//private List<String> images = new ArrayList<>();

	
	
}
