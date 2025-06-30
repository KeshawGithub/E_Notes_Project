<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">                             
<title>Online E-Notes</title>
<%@include file="component/allCSS.jsp"%>
<link rel="stylesheet" href="styleSheet.css">

</head>
<body>
	<%@include file="component/NavBar.jsp"%>
	<div class="container-fluid back-img">
		<div class="text-center indexH1">
			<h1 class="text">
				<i class="fa-solid fa-book"></i>E Notes-Save Your Notes
			</h1>
			<a class="btn btn-light me-3" href="login.jsp"><i
				class="fa-solid fa-right-to-bracket"></i>&nbsp;Login</a> 
			<a
				class="btn btn-light me-2" href="register.jsp"><i
				class="fa-solid fa-address-card"></i>&nbsp;Register</a>
		</div>


	</div>
	<%@include file="component/footer.jsp"%>


</body>
</html>