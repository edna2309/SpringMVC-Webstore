package com.packt.webstore.domain.repository;

import java.util.List;
import java.util.Map;
import java.util.Set;

import com.packt.webstore.domain.Product;

public interface ProductRepository {
	
	List <Product> getAllProducts();			
	Product getProductById(String productId);	
	List<Product> getProductsByCategory(String category);	
	Set<Product> getProductsByFilter(Map<String, List<String>> filterParams);		
	void addProduct(Product product);
	
	List <Product> getAllProductsFromCart();
	void addProductToCart(Product product);
	
	Product getProductByIdCart(String productId);
}
