<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>My Store Cart</title>
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

.inventory-item-outer {
	margin: 10px;
}

.delete-icon {
	max-width: 40px;
	margin-left: 60px;
}

.inventory-item {
    padding: 5px;
    border-bottom: 1px solid green;
    margin: auto;
}

.right18 {
	float: right;
	font-size: 18px;
}

.item-id {
	font-size: 9px;
}

.item-cover {
	display: flex;
	align-items: center;
}

.item-img {
	position: relative;
	width: 73px;
	height: 77px;
	border: 0.5px solid black;
	background-color: white;
}

.header {
	font-size: 18px;
}

#totalQ {
	margin-top: -50px;
}
</style>
</head>
<body class="container dashboard">


	<div class="header well">
		<a href="/dashboard"> Home </a>| <a href="/logout">Logout</a>
		<div class="show-inline right18">
			<span>${user.name}'s Cart </span>
		</div>
	</div>
	<hr />

	<div class="inventory">
		<c:forEach items="${fullOrder}" var="item">
			<div class="inventory-item-outer">
				<span class="item-id">Item code # ${item.inventory.id}</span>
				<div class="inventory-item">

					<div class="item-cover">
						<div class="item-img">
							<a href="/store/${item.inventory.id}/view"> 
							<img class="item-img"
								src="https://indistore.s3.amazonaws.com/${fn:toLowerCase(item.inventory.name)}.jpeg"
								onerror="if (this.src != 'https://indistore.s3.amazonaws.com/error.png') this.src = 'https://indistore.s3.amazonaws.com/error.png';">
							</a>
						</div>
						<a href="/store/${item.inventory.id}/view">
							<h4 style="margin-left: 30px;">${item.inventory.name}</h4>
						</a>
						<div>
							<a href="/cart/delete/${item.id}"> <img class="delete-icon"
								src="https://cdn.iconscout.com/icon/premium/png-256-thumb/delete-1432400-1211078.png"
								alt="Delete Icon" width="256">
							</a>
						</div>
					</div>
					<div id="totalQ" style="float: right; display: flex;">
						<div class="quantity">${item.quantity}&nbsp;x&nbsp;</div>
						<span> $</span>
						<div class="">${item.inventory.price}0</div>
						<div style="display: flex;">
							<span>&nbsp; = $</span>
							<div class="price">${item.inventory.price * item.quantity}0</div>
						</div>
					</div>
					</h4>
				</div>
				</a>
			</div>
		</c:forEach>

		<hr />
		<div class="inventory-item" style="padding: 20px;">
			<h4>
				Total <span style="float: right" id="total">--</span>
			</h4>
		</div>
	</div>
</body>

<script type="text/javascript">
	let cartBox = document.querySelectorAll("div.price");
	let total = 0;
	for (let i = 0; i < cartBox.length; i++) {
		total = total + (cartBox[i].innerText * 1);
	}
	document.querySelector("#total").innerHTML = "$ " + parseFloat(total).toFixed(2);

</script>

</html>