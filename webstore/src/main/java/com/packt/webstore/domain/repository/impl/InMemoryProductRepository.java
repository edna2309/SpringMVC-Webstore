package com.packt.webstore.domain.repository.impl;

import java.math.BigDecimal;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Map;
import java.util.Set;

import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import com.packt.webstore.DB.DB;
import com.packt.webstore.domain.Product;
import com.packt.webstore.domain.repository.ProductRepository;
import com.packt.webstore.exception.ProductNotFoundException;

@Repository
public class InMemoryProductRepository implements ProductRepository {

	private List<Product> listOfProducts = new ArrayList<Product>();
	private List<Product> listOfProductsInCart = new ArrayList<Product>();
	
	public InMemoryProductRepository() throws SQLException {	
		// iz baze
		Connection con = DB.getConnection();
		Statement stmt = con.createStatement();
		String query = "select * from product";
		ResultSet rs = stmt.executeQuery(query);
		while (rs.next()) {
			 Product p = new Product(rs.getString("productId"), rs.getString("name"), rs.getBigDecimal("unitPrice"));
			 p.setCategory(rs.getString("category"));
			 p.setManufacturer(rs.getString("manufacturer"));
			 p.setDescription(rs.getString("description"));
			 p.setUnitsInStock(rs.getInt("unitsInStock"));
			 p.setProductImage(rs.getString("image"));
			 
			 listOfProducts.add(p);
		}

	}

	public List<Product> getAllProducts() {
		return listOfProducts;
	}

	public Product getProductById(String productId) {
		Product productById = null;

		for (Product product : listOfProducts) {
			if (product != null && product.getProductId() != null && product.getProductId().equals(productId)) {
				productById = product;
				break;
			}
		}

		if (productById == null) {
			throw new ProductNotFoundException("No products found with the product id: " + productId);
		}

		return productById;
	}

	public List<Product> getProductsByCategory(String category) {
		List<Product> productsByCategory = new ArrayList<Product>();

		for (Product product : listOfProducts) {
			if (category.equalsIgnoreCase(product.getCategory())) {
				productsByCategory.add(product);
			}
		}

		return productsByCategory;
	}

	public Set<Product> getProductsByFilter(Map<String, List<String>> filterParams) {
		Set<Product> productsByBrand = new HashSet<Product>();
		Set<Product> productsByCategory = new HashSet<Product>();
		Set<Product> rezultat = new HashSet<Product>();
		Set<String> criterias = filterParams.keySet();

		if (criterias.contains("brand")) {
			for (String brandName : filterParams.get("brand")) {
				for (Product product : listOfProducts) {
					if (brandName.equalsIgnoreCase(product.getManufacturer())) {
						productsByBrand.add(product);
					}
				}
			}
		}
		if (criterias.contains("category")) {
			for (String category : filterParams.get("category")) {
				productsByCategory.addAll(this.getProductsByCategory(category));
			}
		}

		if (productsByBrand.isEmpty() && !productsByCategory.isEmpty()) {
			rezultat = productsByCategory;
		} else if (productsByCategory.isEmpty() && !productsByBrand.isEmpty()) {
			rezultat = productsByBrand;
		} else {
			productsByCategory.retainAll(productsByBrand);
			rezultat = productsByCategory;
		}
		return rezultat;
	}

	public void addProduct(Product product) {

		listOfProducts.add(product);
	}
	// ----------------------------------------------------------

	public List<Product> getAllProductsFromCart() {
		
		return listOfProductsInCart;
	}

	public void addProductToCart(Product product) {
		listOfProductsInCart.add(product);
		
	}
	
	public Product getProductByIdCart(String productId) {
		Product productById = null;

		for (Product product : listOfProductsInCart) {
			if (product != null && product.getProductId() != null && product.getProductId().equals(productId)) {
				productById = product;
				break;
			}
		}

		return productById;
	}

}
