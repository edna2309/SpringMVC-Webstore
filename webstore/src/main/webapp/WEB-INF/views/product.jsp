<%@ page language="java" contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet"
	href="//netdna.bootstrapcdn.com/bootstrap/3.0.0/css/bootstrap.min.css">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.3.0/font/bootstrap-icons.css">
<title>Artist Corner</title>
<link rel="icon" href="https://img.icons8.com/clouds/100/000000/open-envelope-art.png">
<link rel="preconnect" href="https://fonts.gstatic.com">
<link href="https://fonts.googleapis.com/css2?family=Archivo+Narrow:ital,wght@0,400;0,500;0,600;0,700;1,400;1,500;1,600;1,700&family=Montserrat&display=swap" rel="stylesheet">
<style>
* {
	font-family: 'Archivo Narrow';
	font-size: 18px;
}

body {
	background-color: #fbf4f7;
}

.strelica {
	font-size: 50px;
	color: #8d7882;
	display: block;
	margin-top: 20px;
}

.btn.izmjena {
	font-size: 50px;
	color: #bca0ad;
	padding: 5px;
	border-radius: 15px;
	float: right;
}

.btn.izmjena:hover {
	color: #a48c97;
	background-color: transparent;
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

.sifra {
	background-color: #d3b4c3;
	padding: 2px 5px;
	border-radius: 5px;
	color: white;
}

.naslov {
	font-size: 50px;
	color: #bca0ad;
	font-weight: bold;
	font-family: 'Freestyle Script';
	float: right;
}

.naslov:hover {
	color: #bca0ad;
}

.jumbotron {
	background:
		url('https://i.pinimg.com/originals/fe/e4/c6/fee4c620ea682072d3e5f8cb777110bb.jpg');
	background-repeat: no-repeat;
	background-size: fill;
	background-size: cover;
	margin-bottom: 20px;
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

	<section class="container justify-content-center">
		<div class="row align-items-center">
			<div class="col-md-5">
				<img src="${product.productImage}" alt="image" style="width: 100%" />
			</div>
			<div class="col-md-5">
				<div style="font-size: 30px; margin-bottom: 10px; font-weight: bold">
					${product.name}
				</div>
				<p>
					<strong><spring:message code="product.opis" /></strong> <br>
					${product.description}
				</p>
				<p>
					<strong><spring:message code="product.ID" /></strong>: <span
						class="sifra">${product.productId}</span>
				</p>

				<p>
					<strong><spring:message code="product.proizvodjac" /></strong>:
					${product.manufacturer}
				</p>

				<p>
					<strong><spring:message code="product.kategorija" /></strong>:
					${product.category}
				</p>

				<p>
					<strong><spring:message code="product.dostupno" /></strong>:
					${product.unitsInStock}
				</p>

				<p style="font-size: 22px">${product.unitPrice} BAM</p>

			</div>
			<div class="text-center">
				<a href=" /webstore/products/edit?id=${product.productId}"
					class="btn izmjena"> <i class="bi bi-pencil-fill"></i></a>
			</div>
			<br>
			<br>
			<div class="text-right">
				<a href="<spring:url value="/cart" />" class="btn izmjena"> <span
					class="glyphicon-shopping-cart glyphicon"></span></a>
			</div>

		</div>
		<br><br>
		<form:form method="POST" modelAttribute="product"
			class="form-horizontal text-center row" enctype="multipart/form-data">
			<input type="submit" id="btnCart" class="btn naruci" value="<spring:message code="cart.add" />" />
		</form:form>
	</section>




</body>
</html>
