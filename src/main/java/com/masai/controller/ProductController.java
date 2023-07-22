package com.masai.controller;

import java.util.List;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestHeader;
import org.springframework.web.bind.annotation.RestController;

import com.masai.models.CategoryEnum;
import com.masai.models.Product;
import com.masai.models.ProductDTO;
import com.masai.models.ProductStatus;
import com.masai.models.Seller;
import com.masai.repository.ProductDao;
import com.masai.repository.SellerDao;
import com.masai.service.ProductService;
import com.masai.service.SellerService;

//import io.swagger.v3.oas.models.security.SecurityScheme.In;

@RestController
public class ProductController {

	@Autowired
	private ProductService pService;
	private final ProductDao productRepository;
	private SellerService sService;
	//private final SellerDao sellerRepository;

    @Autowired
    public ProductController(ProductDao productRepository) {
        this.productRepository = productRepository;
    }

	// this method adds new product to catalog by seller(if seller is new it adds
	// seller as well
	// if seller is already existing products will be mapped to same seller) and
	// returns added product

	@PostMapping("/products")
	public ResponseEntity<Product> addProductToCatalogHandler(@RequestHeader("token") String token,
			@Valid @RequestBody Product product) {

		Product prod = pService.addProductToCatalog(token, product);

		return new ResponseEntity<Product>(prod, HttpStatus.ACCEPTED);

	}


	@GetMapping("/product/{id}")
	public ResponseEntity<Product> getProductFromCatalogByIdHandler(@PathVariable("id") Integer id) {

		Product prod = pService.getProductFromCatalogById(id);

		return new ResponseEntity<Product>(prod, HttpStatus.OK);

	}

	

	@DeleteMapping("/product/{id}")
	public ResponseEntity<String> deleteProductFromCatalogHandler(@PathVariable("id") Integer id) {
		
		String res = pService.deleteProductFromCatalog(id);
		return new ResponseEntity<String>(res, HttpStatus.OK);
	}

	@DeleteMapping("/d/{productId}")
    public ResponseEntity<String> deleteProduct(@PathVariable Integer productId) {
        Product product = productRepository.findById(productId).orElse(null);
        if (product == null) {
            return new ResponseEntity<>("Product not found", HttpStatus.NOT_FOUND);
        }

        productRepository.delete(product);
        return new ResponseEntity<>("Product deleted successfully", HttpStatus.OK);
    }

	@PutMapping("/products")
	public ResponseEntity<Product> updateProductInCatalogHandler(@Valid @RequestBody Product prod) {
		Product prod2 = pService.getProductFromCatalogById(prod.getProductId());
		Seller seller = prod2.getSeller();
		int id = prod2.getSeller().getSellerId();
		System.out.println("1111111111111111111111"+id);

		prod.setSeller(seller);
		System.out.println("000000000000000000"+prod.getSeller());

		Product prod1 = pService.updateProductIncatalog(prod);

		return new ResponseEntity<Product>(prod1, HttpStatus.OK);

	}

	@GetMapping("/products")
	public ResponseEntity<List<Product>> getAllProductsHandler() {

		List<Product> list = pService.getAllProductsIncatalog();

		return new ResponseEntity<List<Product>>(list, HttpStatus.OK);
	}
	
  //this method gets the products mapped to a particular seller
	@GetMapping("/products/seller/{id}")
	public ResponseEntity<List<Product>> getAllProductsOfSellerHandler(@PathVariable("id") Integer id) {
		System.out.println("hhh0");
		List<Product> list = pService.getAllProductsOfSeller(id);
		System.out.println("hhh");

		

		return new ResponseEntity<List<Product>>(list, HttpStatus.OK);
	}

	@GetMapping("/products/{catenum}")
	public ResponseEntity<List<Product>> getAllProductsInCategory(@PathVariable("catenum") String catenum) {
		CategoryEnum ce = CategoryEnum.valueOf(catenum.toUpperCase());
		List<Product> list = pService.getProductsOfCategory(ce);
		return new ResponseEntity<List<Product>>(list, HttpStatus.OK);

	}

	@GetMapping("/products/status/{status}")
	public ResponseEntity<List<ProductDTO>> getProductsWithStatusHandler(@PathVariable("status") String status) {

		ProductStatus ps = ProductStatus.valueOf(status.toUpperCase());
		List<ProductDTO> list = pService.getProductsOfStatus(ps);

		return new ResponseEntity<List<ProductDTO>>(list, HttpStatus.OK);

	}
	
	
	@PutMapping("/products/{id}")
	public ResponseEntity<Product> updateQuantityOfProduct(@PathVariable("id") Integer id,@RequestBody ProductDTO prodDto){
		
		 Product prod =   pService.updateProductQuantityWithId(id, prodDto);
		
		 return new ResponseEntity<Product>(prod,HttpStatus.ACCEPTED);
	}


	@GetMapping("/search/{name}")
    public List<Product> searchProductsByName(@PathVariable String name) {
        return pService.searchProductsByName(name);
    }

	@PutMapping("/qr/{id}")
	public ResponseEntity<Product> setQrCode(@PathVariable("id") Integer id, @RequestBody String qr) {
		Product prod = pService .addQrCodde(id, qr);
		return ResponseEntity.accepted().body(prod);
	}

		@PutMapping("/like/{id}")
	public ResponseEntity<Product> likeProductHandler(@PathVariable("id") Integer id) {
		Product prod = pService.LikeProduct(id);
		return ResponseEntity.accepted().body(prod);
	}
		@GetMapping("/liked")
	public ResponseEntity<List<Product>> getLikedProductsHandler(@RequestHeader("token") String token){
		
		List<Product> likedProds = pService.getLikedProducts(token);
		
		return ResponseEntity.accepted().body(likedProds);

	}

}
