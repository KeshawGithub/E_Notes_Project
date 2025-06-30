<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Home page</title>
<%@include file="component/allCSS.jsp"%>
<link rel="stylesheet" href="styleSheet.css">
</head>
<body>
	<%@include file="component/NavBar.jsp"%>
	<div class="card py-5" style="background-image:url('image/keyboard.jpg'); background-size:cover;">
		<div class="card-body text-center">
			<img alt="" src="image/pngtree.png" class="img-fluid mx-auto"
				style="max-width: 340px";>
			<h1 style="color: white">START TAKING YOUR NOTES</h1>
			<a href="AddNotes.jsp" class="btn btn-outline-light">Start Here</a>
		</div>
	</div>
	<%@include file="component/footer.jsp"%>
</body>
</html>