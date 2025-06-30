<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Login page</title>
<%@include file="component/allCSS.jsp"%>
<link rel="stylesheet" href="styleSheet.css">
</head>
<body>
	<%@include file="component/NavBar.jsp"%>
	<div class="container-fluid RegistrationBG">
		<div class="row">
			<div class="col-md-4 offset-md-4">
				<div class="card "style="margin-top:100px">
					<div class="card-header text-center text-white bg-custom">
					<i class="fa-duotone fa-solid fa-user fa-3x"></i>
					<h4>User Login</h4>
					</div>
					<!-- Display success or error messages with the help of alert -->
				
					<%
					String failedMsg = (String) session.getAttribute("login-failed");
					if (failedMsg != null) {
					%>
					<div class="alert alert-danger" role="alert"><%=failedMsg%></div>
					<%
					session.removeAttribute("login-failed");
					}
					%>
					
					<%
					String withoutLogin= (String)session.getAttribute("Login-error");
					if(withoutLogin!=null){
					%>
					<div class="alert alert-danger" role="alert"><%=withoutLogin%></div>
					<% 
					session.removeAttribute("Login-error");
					}
					%>
				
					<%
					String LogoutMsg = (String) session.getAttribute("Logout");
					if (LogoutMsg != null) {
					%>
					<div class="alert alert-success" role="alert"><%=LogoutMsg%></div>
					<%
					session.removeAttribute("Logout");
					}
					%>
				
					<div class="card-body">
						<form action="loginServlet" method="post">
							<div class="mb-3">
								<label for="exampleInputEmail1" class="form-label">Email
									address</label> <input type="email" class="form-control" name="email"
									id="exampleInputEmail1" aria-describedby="emailHelp">
							</div>
							<div class="mb-3">
								<label for="exampleInputPassword1" class="form-label">Password</label>
								<input type="password" class="form-control"name="password"
									id="exampleInputPassword1">
							</div>
							
							<button type="submit" class="btn btn-custom col-md-12">Login</button>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
		<%@include file="component/footer.jsp"%>
</body>
</html>