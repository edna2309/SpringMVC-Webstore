<%@ page language="java" contentType="text/html; charset=utf-8"%> 
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet"
	href="//netdna.bootstrapcdn.com/bootstrap/3.0.0/css/bootstrap.min.css">
<link rel="stylesheet" href="resources/css/welcome.css">
<title>Artist Corner</title>
<link rel="icon" href="https://img.icons8.com/clouds/100/000000/open-envelope-art.png">
<link rel="preconnect" href="https://fonts.gstatic.com">
<link href="https://fonts.googleapis.com/css2?family=Archivo+Narrow:ital,wght@0,400;0,500;0,600;0,700;1,400;1,500;1,600;1,700&family=Montserrat&display=swap" rel="stylesheet">
</head>
<body>
	<section>
		<div class="bc"style="height:100%" >
			<div class="container">			
				<div class="naslov">
					<spring:message code="welcome.greeting.label" />
				</div>
				<p>
					<spring:message code="welcome.opis.label" />
				</p>
				<a href="/webstore/products" class="main"><spring:message
						code="welcome.katalog.label" /></a>
			</div>
			
			<div class="text-center footer">
				<a href="?language=en" class="sifra" title="English">ENGLISH</a> | 
				<a href="?language=nl" class="sifra" title="Dutch">DUTCH</a> | 
				<a href="?language=bs" class="sifra" title="Bosnian">BOSNIAN</a>
			</div>
		</div>
		
	</section>
</body>
</html>