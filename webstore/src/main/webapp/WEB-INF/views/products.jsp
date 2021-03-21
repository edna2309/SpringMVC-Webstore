<%@ page language="java" contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet"
	href="//netdna.bootstrapcdn.com/bootstrap/3.0.0/css/bootstrap.min.css">
<link rel="stylesheet" href="resources/css/products.css">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.3.0/font/bootstrap-icons.css">
<title>Artist Corner</title>
<link rel="icon" href="https://img.icons8.com/clouds/100/000000/open-envelope-art.png">
<link rel="preconnect" href="https://fonts.gstatic.com">
<link href="https://fonts.googleapis.com/css2?family=Archivo+Narrow:ital,wght@0,400;0,500;0,600;0,700;1,400;1,500;1,600;1,700&family=Montserrat&display=swap" rel="stylesheet">
</head>
<body>
	<section>
		<div class="jumbotron">
			<div class="container">
				<a href="/webstore" class="btn naslov">
					<spring:message code="welcome.greeting.label" /></a>
				
				<a href=" /webstore/products/add " class="btn icon"> <i class="bi bi-plus-circle-fill"></i>
				</a>
			</div>
		</div>
	</section>
	<section class="container">
		<div class="row">
			<c:forEach items="${products}" var="product">
				<div class="col-sm-6 col-md-3" style="padding-bottom: 15px">
					<div class="thumbnail">
						<img src="${product.productImage}" alt="image" />
						<div class="caption">
							<p style="font-size: 24px">${product.name}</p>
							<p>${product.description}</p>
							<p>${product.unitPrice} BAM</p>
							<p>${product.unitsInStock} <spring:message code="products.inStock" /></p>
							<p>
								<a href=" <spring:url value= "/products/product?id=${product.productId}" /> "
									class="btn details"><span class="glyphicon-info-sign glyphicon" /></span>
									<spring:message code="products.more"/>
								</a>
							</p>
						</div>
					</div>
				</div>
			</c:forEach>
		</div>
	</section>
</body>
</html>