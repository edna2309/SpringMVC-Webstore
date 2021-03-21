package com.packt.webstore.service;

import com.packt.webstore.domain.Product;

public interface OrderService {
	void processOrder(String productId, int quantity);
}
