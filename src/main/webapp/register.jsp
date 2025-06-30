<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Register Page</title>
<%@include file="component/allCSS.jsp"%>
<link rel="stylesheet" href="styleSheet.css">
</head>
<body>
	<%@include file="component/NavBar.jsp"%>
	<div class="container-fluid RegistrationBG">
		<div class="row">
			<div class="col-md-4 offset-md-4">
				<div class="card mt-5">
					<div class="card-header text-center text-white bg-custom ">
						<i class="fa-solid fa-user-plus fa-3x"></i>
						<h4>Registration</h4>
					</div>
					
					<!-- Display success or error messages with the help of alert -->
					<%
					String regMsg = (String) session.getAttribute("reg-suc");
					if (regMsg != null) {
					%>
					<div class="alert alert-success" role="alert"><%=regMsg%>&nbsp;&nbsp;Login<a href="login.jsp">Click Here</a></div>
					<%
					session.removeAttribute("reg-suc");
					}
					%>
					<%
					String failedMsg = (String) session.getAttribute("reg-failed");
					if (failedMsg != null) {
					%>
					<div class="alert alert-danger" role="alert"><%=failedMsg%></div>
					<%
					session.removeAttribute("reg-failed");
					}
					%>


					<div class="card-body">
						<form action="userservlet" method="post">
							<div class="mb-3">
								<label for="exampleInputName1" class="form-label">Full
									Name </label> <input type="text" class="form-control" name="fullName"
									id="exampleInputName1" aria-describedby="nameHelp">

							</div>
							<div class="mb-3">
								<label for="exampleInputEmail1" class="form-label">Email
									address</label> <input type="email" class="form-control" name="email"
									id="exampleInputEmail1" aria-describedby="emailHelp">
								<div id="emailHelp" class="form-text">We'll never share
									your email with anyone else.</div>
							</div>
							<div class="mb-3">
								<label for="exampleInputPassword1" class="form-label">Password</label>
								<input type="password" class="form-control" name="password"
									id="exampleInputPassword1">
							</div>

							<button type="submit" class="btn btn-custom col-md-12">Register</button>

						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
	<%@include file="component/footer.jsp"%>
</body>
</html>