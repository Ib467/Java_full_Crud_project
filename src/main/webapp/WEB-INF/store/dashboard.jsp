<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ page isErrorPage="true"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bulma@0.9.0/css/bulma.min.css">
<!-- <link rel="stylesheet" href="../CSS/styles.css"> -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">


<style>
body {
	font-size: 1.5em;
	margin: auto;
	min-width: 500px;
}

h1 {
	color: black;
}

th, td, tr {
	padding: 10px;
}

.show-inline * {
	display: inline-block;
}

.inventory {
	display: grid;
	grid-template-columns: 1fr 1fr 1fr;
	grid-gap: 40px;
}

.inventory-item {
	width: 220px;
	min-height: 140px;
	background-color: white;
	text-align: center;
	padding: 20px;
	border-radius: 5px;
	border: 2px solid black;
	margin: auto;
}

.item-id {
	position: absolute;
	font-size: 11px;
}

.inventory-item-outer {
	background-color: #ff520033;
	/*	background-color:rgb(240, 227, 223); */
	padding: 10px;
}

.item-img {
	float: left;
	width: 100px;
	height: 100px;
	object-fit: cover;
	height: 100px;
}

.hide {
	display: none;
}

.item-badge {
	height: 32px;
	min-width: 21px;
	background-color: #fced70;
	border-radius: 10px;
	color: #222;
	font-size: 17px;
	font-weight: 700;
	line-height: 14px;
	text-align: center;
	padding: 10px;
	top: 4px;
	left: 11px;
}

.flex {
	display: flex;
}

.left20 {
	margin-left: 20px;
}

.right {
	float: right
}

.id-box {
	position: absolute;
	right: 37px;
	top: 10px;
}
</style>
</head>
<body class="container dashboard">
	<div class="header well flex">
		<a href="/dashboard">Home</a>
		<div class="show-inline left20">
			<c:if test="${user.id == 1}">
				<a href="/store/new/${user.id}">Add New inventory</a>
			</c:if>
		</div>
		<a class="right left20 " href="/logout">Logout</a>

		<div class="flex id-box">
			<div class="show-inline">
				Welcome, ${user.name}
				<p class="left20">customer:- ${user.id}</p>
				<p class="left20">
					<a class="item-badge left20" href="/store/cart">Cart
						${fn:length(fullOrder)}</a> <i class="fa fa-2x fa-shopping-cart"
						aria-hidden="true"></i>
				</p>
			</div>
		</div>
	</div>
	<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
	<div class="form-inline left20">
		<input class="form-control mr-sm-2" type="search" placeholder="Search"
			aria-label="Search" id="searchText"> <a id="searchBtn"
			href=""><button class="btn btn-outline-success my-2 my-sm-0">Search</button></a>
		<a href="/dashboard"><button class=" btn-outline-success my-2 my-sm-0">Clear</button></a>
		
		
	</div>

	<hr />

	<h2>Store Inventory</h2>
	<hr />

	<div class="inventory">
		<c:choose>
			<c:when test="${empty byName}">
				<c:forEach items="${fullInventory}" var="item">
					<div class="inventory-item-box ${fn:toLowerCase(item.name)}">
						<div class="inventory-item-outer">
							<a href="/store/${item.id}/view"> <span class="item-id">${item.id}</span>
								<div class="inventory-item">

									<img class="item-img"
										src="https://indistore.s3.amazonaws.com/${fn:toLowerCase(item.name)}.jpeg"
										onerror="if (this.src != 'https://indistore.s3.amazonaws.com/error.png') this.src = 'https://indistore.s3.amazonaws.com/error.png';">
									<h4>${item.name}</h4>
									<span>$ ${item.price}</span>0
								</div>
							</a>
						</div>
					</div>
				</c:forEach>
			</c:when>

			<c:otherwise>
				<c:forEach items="${byName}" var="item">
					<div class="inventory-item-box ${fn:toLowerCase(item.name)}">
						<div class="inventory-item-outer">
							<a href="/store/${item.id}/view"> <span class="item-id">${item.id}</span>
								<div class="inventory-item">

									<img class="item-img"
										src="https://indistore.s3.amazonaws.com/${fn:toLowerCase(item.name)}.jpeg"
										onerror="if (this.src != 'https://indistore.s3.amazonaws.com/error.png') this.src = 'https://indistore.s3.amazonaws.com/error.png';">
									<h4>${item.name}</h4>
									<span>$ ${item.price}</span>0
								</div>
							</a>
						</div>
					</div>
				</c:forEach>
			</c:otherwise>
		</c:choose>
	</div>

	<hr />
	<br />

	<!-- Footer -->
	<footer class="page-footer font-small special-color-dark pt-4">

		<!-- Footer Elements -->
		<div class="container">

			<!--Grid row-->
			<div class="row">

				<!--Grid column-->
				<div class="col-md-6 mb-4">

					<form class="input-group flex">
						<input type="text" class="form-control form-control-sm"
							placeholder="Your email" aria-label="Your email"
							aria-describedby="basic-addon2" id="">
						<div class="input-group-append">
							<button class="btn btn-sm btn-outline-white my-0" type="button">Sign
								up</button>
						</div>
					</form>

				</div>
				<!--Grid column-->

			</div>
			<!--Grid row-->

		</div>
		<!-- Footer Elements -->

		<!-- Copyright -->
		<div class="footer-copyright text-center py-3">
			© 2020 Copyright: <a href="/"> SimpleCart.com</a>
		</div>
		<!-- Copyright -->

	</footer>
	<!-- Footer -->

<script type="text/javascript">
	$(document).ready(function() {
		$('#searchText').on('keyup', function(){
			var value = $(this).val().toLowerCase();
			var query = '/dashboard?q=' + value;
			$('#searchBtn').attr('href', query);
		});
	});
</script>


</body>
</html>