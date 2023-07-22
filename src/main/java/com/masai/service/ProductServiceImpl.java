package com.masai.service;

import java.util.ArrayList;
import java.util.List;
import java.util.Optional;
import java.util.regex.Pattern;
import java.util.stream.Collectors;

import javax.persistence.EntityManager;
import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.ResponseBody;

import com.masai.exception.CategoryNotFoundException;
import com.masai.exception.ProductNotFoundException;
import com.masai.models.CategoryEnum;
import com.masai.models.Product;
import com.masai.models.ProductDTO;
import com.masai.models.ProductStatus;
import com.masai.models.Seller;
import com.masai.repository.ProductDao;
import com.masai.repository.SellerDao;

@Service
public class ProductServiceImpl implements ProductService {

	@Autowired
	private ProductDao prodDao;

	@Autowired
	private SellerService sService;

	@Autowired
	private SellerDao sDao;



	@Transactional
public void deleteProductWithSellerProduct(Product product) {
    // Delete rows from the seller_product table first
    String deleteSellerProductQuery = "DELETE FROM seller_product sp WHERE sp.product_product_id = :productId";
    entityManager.createNativeQuery(deleteSellerProductQuery)
            .setParameter("productId", product.getProductId())
            .executeUpdate();

    // Delete the product from the product table
    entityManager.remove(product);
}

	@Override
	public Product addProductToCatalog(String token, Product product) {

		Product prod = null;
		Seller seller1 = sService.getCurrentlyLoggedInSeller(token);
		product.setSeller(seller1);

		Seller Existingseller = sService.getSellerByMobile(product.getSeller().getMobile(), token);
		Optional<Seller> opt = sDao.findById(Existingseller.getSellerId());

		if (opt.isPresent()) {
			Seller seller = opt.get();

			product.setSeller(seller);
			if(product.getQuantity()>0){
				product.setStatus(ProductStatus.AVAILABLE);
			}else{
				product.setStatus(ProductStatus.OUTOFSTOCK);
			}

			System.out.println("ddddddddddddd"+product.getCategory());
			if(product.getCategory().toString()=="MOBILES"){
				System.out.println("dd\ndddddddd\nddd");
				product.setCategory(CategoryEnum.MOBILES);
			}
			prod = prodDao.save(product);
			;

			seller.getProduct().add(product);
			sDao.save(seller);

		} else {
			prod = prodDao.save(product);
			;
		}

		return prod;
	}

	@Override
	public Product getProductFromCatalogById(Integer id) throws ProductNotFoundException {

		Optional<Product> opt = prodDao.findById(id);
		if (opt.isPresent()) {
			return opt.get();
		}

		else
			throw new ProductNotFoundException("Product not found with given id");
	}

	@Autowired
	private EntityManager entityManager;
	@Override
	public String deleteProductFromCatalog(Integer id) throws ProductNotFoundException {
		Optional<Product> opt = prodDao.findById(id);
	
		if (opt.isPresent()) {
			Product prod = opt.get();
			System.out.println(prod);
			System.out.println("0000000000000");

			// Detach the product entity from the seller
		//	deleteProductWithSellerProduct(prod);

			prod.getSeller().getProduct().remove(prod);
			prodDao.delete(prod);
			return "Product deleted from catalog";
		} else {
			throw new ProductNotFoundException("Product not found with given id");
		}
	}
	

	@Override
	public Product updateProductIncatalog(Product prod) throws ProductNotFoundException {

		Optional<Product> opt = prodDao.findById(prod.getProductId());

		if (opt.isPresent()) {
			opt.get();
			Product prod1 = prodDao.save(prod);
			return prod1;
		} else
			throw new ProductNotFoundException("Product not found with given id");
	}

	@Override
	public List<Product> getAllProductsIncatalog() {
		List<Product> list = prodDao.findAll();
		
		if (list.size() > 0) {
			return list;
		} else
			throw new ProductNotFoundException("No products in catalog");

	}

	@Override
	public List<Product> getProductsOfCategory(CategoryEnum catenum) {

		//List<Product> list = prodDao.getAllProductsInACategory(catenum);
		List<Product> list= new ArrayList();
		List<Product> listALL= prodDao.findAll();
		for(int i = 0;i<listALL.size();i++){
				if(listALL.get(i).getCategory()==catenum){
					list.add(listALL.get(i) );
				}

		}
		if (list.size() > 0) {

			return list;
		} else
			throw new CategoryNotFoundException("No products found with category:" + catenum);
	}

	@Override
	public List<ProductDTO> getProductsOfStatus(ProductStatus status) {

		List<ProductDTO> list = prodDao.getProductsWithStatus(status);

		if (list.size() > 0) {
			return list;
		} else
			throw new ProductNotFoundException("No products found with given status:" + status);
	}

	@Override
	public Product updateProductQuantityWithId(Integer id,ProductDTO prodDto) {
		Product prod = null;
		 Optional<Product> opt = prodDao.findById(id);
		 
		 if(opt!=null) {
			  prod = opt.get();
			 prod.setQuantity(prod.getQuantity()+prodDto.getQuantity());
			 if(prod.getQuantity()>0) {
				 prod.setStatus(ProductStatus.AVAILABLE);
			 }
			 prodDao.save(prod);
			 
		 }
		 else
			 throw new ProductNotFoundException("No product found with this Id");
		
		return prod;
	}

	

	@Override
	public List<Product> getAllProductsOfSeller(Integer id) {
		System.out.println("hhoooh");

		List<Product> list = prodDao.findAll();
		System.out.println("2");

		List<Product> res = new ArrayList();
		System.out.println("0000000000000000000000"+list );

		for( Product prod : list ) {
			System.out.println(	"+SELLER ID:"+prod.getSeller().getSellerId()+"@@id:"+id.toString());

			if(prod.getSeller().getSellerId().toString().equals(id.toString()))
			{  System.out.println("inside if");
				res.add( prod);
				System.out.println("hhh");
			}
			System.out.println("REEEESSSS"+res);



		}





	//	List<ProductDTO> list = prodDao.getProductsOfASeller(id);
		
		
		if(res.size()>0) {
			
			return res;
			
		}
		
		else {
			throw new ProductNotFoundException("No products with SellerId: "+id);
		}
	}
	
	@Override
	public List<Product> searchProductsByName(String name) {
        try {
            Pattern pattern = Pattern.compile(name, Pattern.CASE_INSENSITIVE);
            List<Product> products = prodDao.findAll()
                    .stream()
                    .filter(product -> pattern.matcher(product.getProductName()).find())
                    .collect(Collectors.toList());

            return products;
        } catch (Exception e) {
            throw new RuntimeException("Failed to search products: " + e.getMessage());
        }
    }

	@Override
	public Product addQrCodde(Integer id,String qr) {
		Product prod = null;
		Optional<Product> opt = prodDao.findById(id);
		
		if(opt!=null) {
			 prod = opt.get();
			 prod.setQrCode(qr);
			
			prodDao.save(prod);
			
		}
		else
			throw new ProductNotFoundException("No product found with this Id");
	   
	   return prod;
   }

	@Override
	public Product LikeProduct(Integer id) {
		// TODO Auto-generated method
		Product prod=getProductFromCatalogById(id);
		if(prod.getIsLiked()==null || prod.getIsLiked()==false){
			prod.setIsLiked(true);
			prodDao.save(prod);
		}else if(prod.getIsLiked()==true ){
			prod.setIsLiked(false);
			prodDao.save(prod);

		}		
		return prod;
	}

	@Override
	public List<Product> getLikedProducts(String token) {
				Seller seller1 = sService.getCurrentlyLoggedInSeller(token);
				List<Product> sellerProd = getAllProductsOfSeller(seller1.getSellerId());
				List<Product> likedProd= new ArrayList();

				for(int i=0;i<sellerProd.size();i++){
						if (sellerProd.get(i).getIsLiked()==null){
						sellerProd.get(i).setIsLiked(false);
						Product prod=	sellerProd.get(i);
									prodDao.save(prod);


					}
					if (sellerProd.get(i).getIsLiked()==true){
						likedProd.add(sellerProd.get(i));
					}

				}
			return likedProd;
	}
   }


