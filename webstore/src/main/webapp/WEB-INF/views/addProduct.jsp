<%@ page language="java" contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>

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

.logout {
	background-color: #bca0ad;
	color: white;
	font-size: 18px;
}

.add {
	background-color: #bca0ad;
	color: white;
	font-size: 18px;
	border: none;
}

.logout:hover, .add:hover {
	background-color: #bca0ad;
	color: white;
	text-decoration: none;
	color: white;
	background-color: #a48c97;
}

.jumbotron {
	background:
		url('https://i.pinimg.com/originals/fe/e4/c6/fee4c620ea682072d3e5f8cb777110bb.jpg');
	background-repeat: no-repeat;
	background-size: fill;
	background-size: cover;
}

.strelica {
	font-size: 50px;
	color: #8d7882;
	display: block;
	margin-top: 20px;
}

input {
	width: 100%;
	padding: 5px;
	border-radius: 10px
}

textarea {
	border: none;
	resize: none;
	border-radius: 10px
}

textarea:focus {
	border: none;
	outline: none;
}

input[type="text"] {
	border: none;
}

input:focus {
	outline: none;
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
				</a> <a href="<c:url value="/j_spring_security_logout" />"
					class="btn logout">logout</a>
			</div>
		</div>
	</section>
	<section class="container">
		<form:form method="POST" modelAttribute="newProduct"
			class="form-horizontal" enctype="multipart/form-data">
			<form:errors path="*" cssClass="alert alert-danger" element="div" />

			<fieldset>
				<legend class="text-center">
					<strong style="font-size: 24px"><spring:message
							code="addProduct.dodaj" /></strong>
				</legend>

				<div class="form-group">
					<label class="control-label col-lg-3 col-lg-3" for="productId"><spring:message
							code="addProduct.form.productId.label" /> </label>
					<div class="col-lg-6">
						<form:input id="productId" path="productId" type="text"
							class="form:input-large" />
						<form:errors path="productId" cssClass="text-danger" />

					</div>
				</div>

				<div class="form-group">
					<label class="control-label col-lg-3 col-lg-3" for="name"><spring:message
							code="addProduct.form.name.label" /></label>
					<div class="col-lg-6">
						<form:input id="name" path="name" type="text"
							class="form:input-large" />
						<form:errors path="name" cssClass="text-danger" />

					</div>
				</div>

				<div class="form-group">
					<label class="control-label col-lg-3 col-lg-3" for="unitPrice"><spring:message
							code="addProduct.form.unitPrice.label" /></label>
					<div class="col-lg-6">
						<form:input id="unitPrice" path="unitPrice" type="text"
							class="form:input-large" />
						<form:errors path="unitPrice" cssClass="text-danger" />

					</div>
				</div>

				<div class="form-group">
					<label class="control-label col-lg-3 col-lg-3" for="manufacturer"><spring:message
							code="addProduct.form.manufacturer.label" /></label>
					<div class="col-lg-6">
						<form:input id="manufacturer" path="manufacturer" type="text"
							class="form:input-large" />
						<form:errors path="manufacturer" cssClass="text-danger" />
					</div>
				</div>

				<div class="form-group">
					<label class="control-label col-lg-3 col-lg-3" for="category"><spring:message
							code="addProduct.form.category.label" /></label>
					<div class="col-lg-6">
						<form:input id="category" path="category" type="text"
							class="form:input-large" />
						<form:errors path="category" cssClass="text-danger" />
					</div>
				</div>

				<div class="form-group">
					<label class="control-label col-lg-3 col-lg-3" for="unitsInStock"><spring:message
							code="addProduct.form.unitsInStock.label" /></label>
					<div class="col-lg-6">
						<form:input id="unitsInStock" path="unitsInStock" type="text"
							class="form:input-large" />
						<form:errors path="unitsInStock" cssClass="text-danger" />
					</div>
				</div>

				<div class="form-group">
					<label class="control-label col-lg-3" for="description"><spring:message
							code="addProduct.form.description.label" /></label>
					<div class="col-lg-6">
						<form:textarea id="description" path="description" rows="4"
							cols="76" />
					</div>
				</div>

				<div class="form-group">
					<label class="control-label col-lg-3" for="productImage"> <spring:message
							code="addProdcut.form.productImage.label" /></label>
					<div class="col-lg-6">
						<form:input id="productImage" path="productImage" type="text"
							class="form:input-large" />
					</div>
				</div>
				<div class="form-group">
					<div class="col-lg-offset-3 col-lg-6">
						<input type="submit" id="btnAdd" class="btn add" value="Add" />
					</div>
				</div>
			</fieldset>
		</form:form>

	</section>
</body>
</html>
