package com.packt.webstore.domain;

import java.math.BigDecimal;

import javax.validation.constraints.Digits;
import javax.validation.constraints.Min;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Pattern;
import javax.validation.constraints.Size;

import org.hibernate.validator.constraints.NotEmpty;
import org.springframework.web.multipart.MultipartFile;

import com.packt.webstore.validator.ProductId;

public class Product {
	@Pattern(regexp = "P[0-9]+", message = "{Pattern.Product.productId.validation}")
	@ProductId
	private String productId;
	
	@Size(min = 4, max = 50, message = "{Size.Product.name.validation}")
	private String name;
	
	@Min(value = 0, message = "{Min.Product.unitPrice.validation}")
	@Digits(integer = 8, fraction = 2, message = "{Digits.Product.unitPrice.validation}")
	//@NotNull(message = "{NotNull.Product.unitPrice.validation}")
	private BigDecimal unitPrice;

	//@NotEmpty(message = "{NotEmpty.Product.manufacturer.validation}")
	private String manufacturer;

	//@NotEmpty(message = "{NotEmpty.Product.category.validation}")
	private String category;
	
	@Min(value = 0, message = "{Min.Product.unitsInStock.validation}")
	private int unitsInStock;
	
	private boolean discontinued;
	private String description;
	//private MultipartFile productImage;
	
	private int quantity = 1;
	
	private String productImage;
	
	public String getProductImage() {
		return productImage;
	}

	public void setProductImage(String productImage) {
		this.productImage = productImage;
	}

	public String getProductId() {
		return productId;
	}

	public void setProductId(String productId) {
		this.productId = productId;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public BigDecimal getUnitPrice() {
		return unitPrice;
	}

	public void setUnitPrice(BigDecimal unitPrice) {
		this.unitPrice = unitPrice;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public String getManufacturer() {
		return manufacturer;
	}

	public void setManufacturer(String manufacturer) {
		this.manufacturer = manufacturer;
	}

	public String getCategory() {
		return category;
	}

	public void setCategory(String category) {
		this.category = category;
	}

	public int getUnitsInStock() {
		return unitsInStock;
	}

	public void setUnitsInStock(int unitsInStock) {
		this.unitsInStock = unitsInStock;
	}

	public boolean isDiscontinued() {
		return discontinued;
	}

	public void setDiscontinued(boolean discontinued) {
		this.discontinued = discontinued;
	}


	public Product() {
		super();
	}

	public Product(String productId, String name, BigDecimal unitPrice) {
		this.productId = productId;
		this.name = name;
		this.unitPrice = unitPrice;
	}

	// add setters and getters for all the fields here
	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		Product other = (Product) obj;
		if (productId == null) {
			if (other.productId != null)
				return false;
		} else if (!productId.equals(other.productId))
			return false;
		return true;
	}

	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + ((productId == null) ? 0 : productId.hashCode());
		return result;
	}

	@Override
	public String toString() {
		return "Product [productId=" + productId + ", name=" + name + "]";
	}

	public int getQuantity() {
		return quantity;
	}

	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}
	
	
}
