<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>My Store Inventory Item</title>
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bulma@0.9.0/css/bulma.min.css">
<!-- <link rel="stylesheet" href="../CSS/styles.css"> -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bulma@0.9.0/css/bulma.min.css">

<style>
body {
	font-size: 1.5em;
	margin: auto;
	width: 55%;
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

.error {
	font-size: 12px;
}

.item-img {
	max-width: 50%;
}

.inventory {
	display: grid;
	grid-template-columns: 1fr 1fr 1fr;
	grid-gap: 40px;
}

.inventory-item {
	min-width: 450px;
	min-height: 120px;
	background-color: white;
	text-align: center;
	padding: 20px;
	border-radius: 5px;
	border: 5px solid green;
	margin: auto;
	border-radius: 5px;
}

.top {
	display: flex;
	justify-content: space-between;
	margin-right: 30px;
	margin-left: 33px;
	margin-top: 20px;
}

.fontT {
	font-size: 16px;
}

.fontL {
	font-size: 22px;
}

.add_to_cart {
	text-align: center;
	margin-top: 20px;
}

.item-flex {
	display: flex;
	align-items: center;
	justify-content: center;
}

.inventory-box {
	display: grid;
	grid-template-columns: 1fr 1fr;
	grid-gap: 40px;
}

.price {
	width: 26%;
	margin: 11px;
}

.right18 {
	float: right;
	font-size: 18px;
}

.header {
	font-size: 18px;
}
</style>
</head>
<body>

	<div class="header well">
		<a href="/dashboard"> Home </a>| <a href="/logout">Logout</a>
		<div class="show-inline right18">
			<a class="item-badge" href="/store/cart"> <span>${user.name}'s
					Cart </span>
			</a>
		</div>
	</div>
	<hr />

	<div class="inventory-item">
		<h3>Selected Item</h3>
		<hr />
		<div class="inventory-box">
			<img
				src="https://indistore.s3.amazonaws.com/${fn:toLowerCase(inventory.name)}.jpeg"
				onerror="if (this.src != 'https://indistore.s3.amazonaws.com/error.png') this.src = 'https://indistore.s3.amazonaws.com/error.png';">
			<div>
				<span class="fontT">Description</span>
				<p class="fontL">${inventory.name}</p>
				<hr />
				<span class="fontT">Price</span>
				<p class="fontL">$ ${inventory.price}0</p>
				<hr />
				<span class="fontT">${inventory.iten_inhand} - quantity in
					Stock</span>
			</div>
		</div>
		<hr />
		<form:form class="add_to_cart" action="/cart/addItem" method="POST"
			modelAttribute="usersCart">
			<form:input type="hidden" path="inventory" value="${inventory.id}" />
			<form:input type="hidden" path="user" value="${user.id}" />
			<div class="item-flex">
				<form:label path="quantity">quantity of  </form:label>
				<form:input type="number" class="price input is-hovered"
					path="quantity" value="0" />
				<form:errors path="quantity" class="has-text-danger error" />
				<input class="button is-success" type="submit" value="Add to Cart" />
			</div>
		</form:form>
</body>
</html>