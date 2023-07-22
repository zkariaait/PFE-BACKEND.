package com.masai.models;

import java.util.ArrayList;
import java.util.List;

import javax.validation.constraints.DecimalMin;
import javax.validation.constraints.Min;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;

import com.fasterxml.jackson.annotation.JsonIgnore;

import lombok.AllArgsConstructor;
import lombok.EqualsAndHashCode;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

import javax.persistence.*;

@Entity
@Setter
@Getter
@AllArgsConstructor
@NoArgsConstructor
@ToString
@EqualsAndHashCode
public class Product {

	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	private Integer productId;

	@NotNull
	@Size(min = 3, max = 30, message = "Product name size should be between 3-30")
	private String productName;

	@NotNull
	@DecimalMin(value = "0.00")
	private Double price;

	private String description;

	@NotNull
	private String manufacturer;

	@NotNull
	@Min(value = 0)
	private Integer quantity;

	@Enumerated(EnumType.STRING)
	private CategoryEnum category;

	@Enumerated(EnumType.STRING)
	private ProductStatus status;

//	@ManyToMany(cascade = CascadeType.ALL)
//	private Order order;

	@ManyToOne(cascade = {CascadeType.PERSIST, CascadeType.MERGE, CascadeType.REFRESH})
	@JsonIgnore
	private Seller seller;
	
	@ElementCollection
	@CollectionTable(name = "images", joinColumns = @JoinColumn(name = "product_id"))	
	private List<String> images = new ArrayList<>();
	
	@ElementCollection
	@CollectionTable(name = "ratings", joinColumns = @JoinColumn(name = "product_id"))	
	private List<Rating> ratings = new ArrayList<>();
	private String QrCode;
	private Boolean isLiked = false;//	@ManyToMany
//	@JsonIgnore
//	private List<Cart> productCarts = new ArrayList<>();

}
