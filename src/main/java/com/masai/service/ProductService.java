package com.masai.service;

import java.util.List;

import com.masai.models.CategoryEnum;
import com.masai.models.Product;
import com.masai.models.ProductDTO;
import com.masai.models.ProductStatus;

public interface ProductService {

	public Product addProductToCatalog(String token, Product product);

	public Product getProductFromCatalogById(Integer id);

	public String deleteProductFromCatalog(Integer id);

	public Product updateProductIncatalog(Product product);
	
	public List<Product> getAllProductsIncatalog();
	
	public List<Product> getAllProductsOfSeller(Integer id);
	
	public List<Product> getProductsOfCategory(CategoryEnum catenum);
	
	public List<ProductDTO> getProductsOfStatus(ProductStatus status);
	
	public List<Product> searchProductsByName(String name);
	
	public Product updateProductQuantityWithId(Integer id,ProductDTO prodDTO);
	
	public Product addQrCodde(Integer id,String Qr);

	public Product LikeProduct(Integer id);
	
	public List<Product> getLikedProducts(String token);



}
