<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page isErrorPage="true"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>



<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<style>
.container {
	display: flex;
	justify-content: space-between;
	margin-bottom: 30px
}

h1, h4 {
	text-align: center;
}

.top_section {
	display: flex;
	justify-content: space-evenly;
}

.boxs {
	max-width: 600px;
	min-width: 300px; padding : 20px;
	margin: auto;
	background-color: #ccccccd1;
	border-radius: 5px;
	padding: 20px;
}

body {
	background-image:
		url('https://vectorified.com/image/vector-full-free-16.png');
}
</style>

</head>
<body>
	<h1>Welcome to Simple Cart</h1>
	<h4>
		<a href="#register">Register</a>
	</h4>
	<div>
		<div class="boxs">

			<div>
				<div class="col">
					<h1>Login</h1>
					<form action="/login" method="post">
						<p class="text-danger">${error }</p>
						<%-- 	<p class="text-danger"> ${loginError }</p> --%>
						<div>
							<label>Email :</label> <input type="text" name="email"
								class="form-control" value="test@test.com" />
						</div>
						<div>
							<label>Password :</label> <input type="password" name="password"
								class="form-control" value="password" />
						</div>
						<button class="btn btn-primary" value="Sign In">Submit</button>
					</form>
				</div>
				<!--  end of login  -->
			</div>
		</div>
		<br />
		<hr />
		<br />
		<div class="boxs">

			<div id="register" class="col">
				<h4>Please register with the store</h4>
				<form:form action="/registration" method="post"
					modelAttribute="user">
					<div>
						<label>Name :</label>
						<form:input path="name" class="form-control" />
						<form:errors path="name" class="text-danger" />
					</div>
					<div>
						<label>Email :</label>
						<form:input path="email" class="form-control" />
						<form:errors path="email" class="text-danger" />
					</div>
					<div>
						<div>
							<label>Password :</label>
							<form:input type="password" path="password" class="form-control" />
							<form:errors path="password" class="text-danger" />
						</div>
						<div>
							<label>Confirm password:</label>
							<form:input type="password" path="passwordConfirmation"
								class="form-control" />
							<form:errors path="passwordConfirmation" class="text-danger" />
						</div>
					</div>
					<button class="btn btn-primary" value="Sign Up">Submit</button>
				</form:form>
			</div>
			<!--  end of registration form  -->
		</div>
		<%-- <div class="col">
		<h1>Login</h1>
		<form action="/login" method="post">
			<p class="text-danger">${error }</p>
				<p class="text-danger"> ${loginError }</p>
			<div>
				<label>Email :</label> <input type="text" name="email"
					class="form-control" value="test@test.com" />
			</div>
			<div>
				<label>Password :</label> <input type="password" name="password"
					class="form-control" value="password" />
			</div>
			<button class="btn btn-primary" value="Sign In">Submit</button>
		</form>
	</div>
	<!--  end of login  --> --%>
	</div>
	<!-- end of container  -->





</body>
</html>