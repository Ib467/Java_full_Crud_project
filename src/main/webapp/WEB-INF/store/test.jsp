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



	<div class="inventory">
		<c:forEach items="${fullInventory}" var="item">
		<div>${item.name }</div>
		</c:forEach>
	</div>
	<hr/>
		<c:forEach items="${byName}" var="items">
			<div>${items.name }</div>
		</c:forEach>

	<hr/>
	
</body>

</html>