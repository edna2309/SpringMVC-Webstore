package com.packt.webstore.controller;

import java.io.File;
import java.math.BigDecimal;
import java.sql.Connection;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.StringUtils;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.MatrixVariable;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.packt.webstore.DB.DB;
import com.packt.webstore.domain.Product;
import com.packt.webstore.domain.repository.ProductRepository;
import com.packt.webstore.exception.NoProductsFoundUnderCategoryException;
import com.packt.webstore.exception.ProductNotFoundException;
import com.packt.webstore.service.ProductService;
import com.packt.webstore.validator.ProductValidator;

@RequestMapping("/products")
@Controller
public class ProductController {

	@Autowired
	private ProductService productService;

	@Autowired
	private ProductValidator productValidator;

	@RequestMapping
	public String list(Model model) {
		model.addAttribute("products", productService.getAllProducts());
		return "products";
	}

	@RequestMapping("/all")
	public String allProducts(Model model) {
		model.addAttribute("products", productService.getAllProducts());

		return "products";
	}

	@RequestMapping("/{category}")
	public String getProductsByCategory(Model model, @PathVariable("category") String category) {
		List<Product> products = productService.getProductsByCategory(category);
		if (products == null || products.isEmpty()) {
			throw new NoProductsFoundUnderCategoryException();
		}
		model.addAttribute("products", products);
		return "products";
	}

	@RequestMapping("/filter/{ByCriteria}")
	public String getProductsByFilter(@MatrixVariable(pathVar = "ByCriteria") Map<String, List<String>> filterParams,
			Model model) {
		model.addAttribute("products", productService.getProductsByFilter(filterParams));
		return "products";
	}

	@RequestMapping("/product")
	public String getProductById(@RequestParam("id") String productId, Model model) {
		model.addAttribute("product", productService.getProductById(productId));
		return "product";
	}

	@RequestMapping(value = "/add", method = RequestMethod.GET)
	public String getAddNewProductForm(Model model) {
		Product newProduct = new Product();
		model.addAttribute("newProduct", newProduct);
		return "addProduct";
	}

	@RequestMapping(value = "/add", method = RequestMethod.POST)
	public String processAddNewProductForm(@ModelAttribute("newProduct") @Valid Product newProduct,
			BindingResult result, HttpServletRequest request) throws SQLException {
		if (result.hasErrors()) {
			return "addProduct";
		}

		String[] suppressedFields = result.getSuppressedFields();
		if (suppressedFields.length > 0) {
			throw new RuntimeException("Attempting to bind disallowed fields: "
					+ StringUtils.arrayToCommaDelimitedString(suppressedFields));
		}

		/*
		 * MultipartFile productImage = newProduct.getProductImage(); String
		 * rootDirectory = request.getSession().getServletContext().getRealPath("\\");
		 * if (productImage != null && !productImage.isEmpty()) { try {
		 * productImage.transferTo( new File(rootDirectory +
		 * "\\resources\\images\\" + newProduct.getProductImage().getOriginalFilename() + "
		 * .png")); } catch (Exception e) { throw new
		 * RuntimeException("Product Image saving failed", e); } }
		 */

		productService.addProduct(newProduct);
		Product p = new Product();
		if (newProduct.getProductImage().isEmpty()) {
			p.setProductImage("https://redzonekickboxing.com/wp-content/uploads/2017/04/default-image-620x600.jpg");
		} else {
			p.setProductImage(newProduct.getProductImage());
		}
		newProduct.setProductImage(p.getProductImage());
		Connection con = DB.getConnection();
		Statement stmt = con.createStatement();
		String query = "insert into product(productId, name, unitPrice, description, manufacturer, category, unitsInStock, image) "
				+ "values ('" + newProduct.getProductId().toString() + "', " + "'" + newProduct.getName() + "', " + " "
				+ newProduct.getUnitPrice() + ", " + "'" + newProduct.getDescription() + "', " + "'"
				+ newProduct.getManufacturer() + "', " + "'" + newProduct.getCategory() + "', " + ""
				+ newProduct.getUnitsInStock() + ", " + "'" + newProduct.getProductImage() + "')";

		stmt.executeUpdate(query);
		System.out.println(query);
		return "redirect:/products";
	}

	@InitBinder
	public void initialiseBinder(WebDataBinder binder) {
		binder.setDisallowedFields("unitsInOrder", "discontinued");

		binder.setAllowedFields("productId", "name", "unitPrice", "description", "manufacturer", "category",
				"unitsInStock", "productImage", "language", "id");
		binder.setValidator(productValidator);
	}

	@ExceptionHandler(ProductNotFoundException.class)
	public ModelAndView handleError(HttpServletRequest req, ProductNotFoundException exception) {
		ModelAndView mav = new ModelAndView();
		mav.addObject("invalidProductId", exception.getProductId());
		mav.addObject("exception", exception);
		mav.addObject("url", req.getRequestURL() + "?" + req.getQueryString());
		mav.setViewName("productNotFound");
		return mav;
	}

	// -------------------------------------------- EDIT

	@RequestMapping(value = "/edit", method = RequestMethod.GET)
	public String getEditNewProductForm(@RequestParam("id") String productId, Model model) {
		Product newProduct = new Product();
		newProduct = productService.getProductById(productId);
		model.addAttribute("newProduct", newProduct);
		return "editProduct";
	}

	@RequestMapping(value = "/edit", method = RequestMethod.POST)
	public String processEditNewProductForm(@ModelAttribute("newProduct") Product editProduct, BindingResult result,
			HttpServletRequest request, @RequestParam("id") String productId) throws SQLException {
		if (result.hasErrors()) {
			return "editProduct";
		}
		String[] suppressedFields = result.getSuppressedFields();
		if (suppressedFields.length > 0) {
			throw new RuntimeException("Attempting to bind disallowed fields: "
					+ StringUtils.arrayToCommaDelimitedString(suppressedFields));
		}
		// productService.addProduct(newProduct);

		Connection con = DB.getConnection();
		Statement stmt = con.createStatement();
		String query = "update product " + "set name= " + "'" + editProduct.getName() + "', " + " " + "unitPrice= "
				+ editProduct.getUnitPrice() + ", " + "" + "description='" + editProduct.getDescription() + "', " + ""
				+ "manufacturer='" + editProduct.getManufacturer() + "', " + "category='" + editProduct.getCategory()
				+ "', " + "unitsInStock=" + editProduct.getUnitsInStock() + ", " + "image='"
				+ editProduct.getProductImage() + "' " + " where productId='"
				+ productService.getProductById(productId).getProductId() + "'";

		stmt.executeUpdate(query);

		Product p = productService.getProductById(productId);
		p.setName(editProduct.getName());
		p.setUnitPrice(editProduct.getUnitPrice());
		p.setDescription(editProduct.getDescription());
		p.setManufacturer(editProduct.getManufacturer());
		p.setCategory(editProduct.getCategory());
		p.setUnitsInStock(editProduct.getUnitsInStock());
		if (editProduct.getProductImage().isEmpty()) {
			p.setProductImage("https://redzonekickboxing.com/wp-content/uploads/2017/04/default-image-620x600.jpg");
		} else {
			p.setProductImage(editProduct.getProductImage());
		}

		return "redirect:/products";
	}

}
