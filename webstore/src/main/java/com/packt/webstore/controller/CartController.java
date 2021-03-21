package com.packt.webstore.controller;

import java.math.BigDecimal;
import java.sql.Connection;
import java.sql.SQLException;
import java.sql.Statement;

import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.StringUtils;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.packt.webstore.DB.DB;
import com.packt.webstore.domain.Product;
import com.packt.webstore.service.ProductService;

@Controller
public class CartController {
	@Autowired
	private ProductService productService;
	
	@RequestMapping("/cart")
	public String lista(Model model) {
		model.addAttribute("productsInCart", productService.getAllProductsFromCart());
		return "cart";
	}
	
	@RequestMapping(value="/cart", method = RequestMethod.GET)
	public String list(Model model) {
		model.addAttribute("productsInCart", productService.getAllProductsFromCart());
		float ukupno = 0;
		for(Product p : productService.getAllProductsFromCart()) {
			ukupno = ukupno + p.getQuantity() * p.getUnitPrice().floatValue();
		}
		model.addAttribute("ukupno", ukupno);
		return "cart";
	}

	@RequestMapping(value = "/products/product", method = RequestMethod.POST)
	public String processAddNewProductForm(@ModelAttribute("product") Product newProduct, @RequestParam("id") String productId,
			BindingResult result, HttpServletRequest request) throws SQLException {
		if (result.hasErrors()) {
			return "cart";
		}
		Product p=productService.getProductByIdCart(productId);
		if(p==null)
		{
			productService.addProductToCart(productService.getProductById(productId));
		}
		else{			
			p.setQuantity(p.getQuantity()+1);
			
		}
		
		return "redirect:/cart";
	}
	
	@RequestMapping(value="/cart", method = RequestMethod.POST)
	public String narudzba(Model model) throws SQLException {	
		Connection con = DB.getConnection();
		Statement stmt = con.createStatement();
		for(Product p : productService.getAllProductsFromCart()) {
			p.setUnitsInStock(p.getUnitsInStock()-p.getQuantity());
			String query = "update product " + "set unitsInStock=" + p.getUnitsInStock() + "  where productId='" +p.getProductId() + "'";
			stmt.executeUpdate(query);
			System.out.println("Uspjesan update");
		}
		productService.getAllProductsFromCart().clear();
		return "redirect:/products";
	}
}
//trebas napraviti cart