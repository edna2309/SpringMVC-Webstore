<%@ page language="java" contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>

<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
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
<style type="text/css">
* {
	font-size: 19px;
}

.btn.naruci {
	margin-top: -20px;
	margin-bottom: 35px;
	color: white;
	font-size: 18px;
	background-color: #d3b4c3;
	padding: 10px 25px;
	border-radius: 15px;
}

.btn.naruci:hover {
	background-color: #a48c97;
}
</style>
</head>
<body>
	<section>
		<div class="jumbotron">
			<div class="container">
				<a href="/webstore" class="btn naslov"> <spring:message
						code="welcome.greeting.label" /></a> <a
					href="<spring:url value="/products" />"> <i
					class="strelica bi bi-arrow-left-short"></i>
				</a>

			</div>
		</div>
	</section>
	<section class="container">
		<div class="row">
			<table class="table">
				<tr>
					<th>ID</th>
					<th><spring:message code="cart.naziv" /></th>
					<th><spring:message code="cart.kolicina" /></th>
					<th><spring:message code="cart.cijena" /></th>
				</tr>

				<c:forEach items="${productsInCart}" var="product">
					<!-- <div class="col-sm-6 col-md-3 row" style="padding-bottom: 15px">
						<div class="thumbnail">

							<div class="caption">
								<p style="font-size: 24px">${product.name}</p>
								<p>${product.unitPrice}BAM</p>
								<!-- <p>
								<a href=" <spring:url value= "/products/product?id=${product.productId}" /> "
									class="btn details"><span class="glyphicon-info-sign glyphicon" /></span>
									<spring:message code="products.more"/> 
								</a> 
							</p>
							</div>
						</div>
					</div> -->

					<tr>
						<td>${product.productId}</td>
						<td>${product.name}</td>
						<td>${product.quantity}</td>
						<td>${product.unitPrice}</td>
					</tr>
				</c:forEach>
			</table>
			<div class="text-right" style="font-size: 23px">
				<strong style="display: inline"><spring:message
						code="cart.ukupnaCijena" /></strong>
				<p>${ukupno} BAM</p>
			</div>
			<form:form method="POST" modelAttribute="product"
				class="form-horizontal text-center row"
				enctype="multipart/form-data">
				<input type="submit" id="btnCart" class="btn naruci"
					value="<spring:message code="product.order" />" />
			</form:form>
		</div>
	</section>

</body>
</html>