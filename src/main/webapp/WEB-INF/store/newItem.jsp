<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<style>
body {
	font-size: 1.5em;
	margin: auto;
	width: 500px;
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
.error{
	font-size:9px;
}
</style>
</head>
</head>
<body>

	<h1>Add new item:</h1>



	<form:form action="/store/new" method="POST" modelAttribute="inventory">



		<p>
			<form:label path="name">Title</form:label>
			<form:input class="input" path="name" />
			<form:errors path="name" />
		</p>

		<p>
			<form:label path="price">Price</form:label>
			<form:input class="price" path="price" />
			<form:errors path="price" />
		</p>

		<p>
			<form:label path="iten_inhand">Quantity</form:label>
			<form:input class="price" type="number" path="iten_inhand" value="1" />
			<form:errors path="iten_inhand" class="error danger"/>
		</p>


		<hr />
		<input type="submit" value="Submit" />
	</form:form>


	<br />
	<hr />
	<a href="/dashboard"><h4>Home</h4></a>
</body>
</html>