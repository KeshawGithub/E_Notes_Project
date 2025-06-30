<%@page import="UserEntity.Users"%>
<nav class="navbar navbar-expand-lg navbar-dark bg-custom ">
	<div class="container-fluid">
		<a class="navbar-brand " href="index.jsp"><i
			class="fa-solid fa-book"></i>&nbsp;DIARY</a>
		<button class="navbar-toggler" type="button" data-bs-toggle="collapse"
			data-bs-target="#navbarSupportedContent"
			aria-controls="navbarSupportedContent" aria-expanded="false"
			aria-label="Toggle navigation">
			<span class="navbar-toggler-icon"></span>
		</button>
		<div class="collapse navbar-collapse" id="navbarSupportedContent">
			<ul class="navbar-nav me-auto mb-2 mb-lg-0">
				<li class="nav-item"><a class="nav-link active"
					aria-current="page" href="index.jsp"><i
						class="fa-solid fa-house-chimney"></i>&nbsp;Home</a></li>
				<li class="nav-item"><a class="nav-link active"
					href="AddNotes.jsp"><i class="fa-solid fa-circle-plus"></i>&nbsp;Add
						Notes</a></li>

				<li class="nav-item"><a class="nav-link active"
					href="ShowNotes.jsp"><i class="fa-solid fa-book"></i>&nbsp;Show
						Notes</a></li>
			</ul>
			<%
			Users u = (Users) session.getAttribute("UserObj");
			if (u != null) {
			%>
			<a class="btn btn-light me-3" href="#" data-bs-toggle="modal"
				data-bs-target="#exampleModal"><i
				class="fa-solid fa-circle-user"></i>&nbsp;<%=u.getName()%></a>
			<form action="UserLogout" method="post">
				<button type="submit" class="btn btn-light">&nbsp;Logout</button>
			</form>
			<%
			} else {
			%>
			<a class="btn btn-light me-3" href="login.jsp"><i
				class="fa-solid fa-right-to-bracket"></i>&nbsp;Login</a> <a
				class="btn btn-light me-2" href="register.jsp"><i
				class="fa-solid fa-address-card"></i>&nbsp;Register</a>
			<%
			}
			%>

		</div>
	</div>

	<!-- Modal Show UserDetails</-->
	<%
	if (u != null) {
	%>
	<div class="modal fade" id="exampleModal" tabindex="-1"
		aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content"
				style="background-image: url('image/abstract.jpg'); background-size: cover;">
				<div class="modal-header">
					<h5 class="modal-title fs-3 text-dark" id="exampleModalLabel">User
						Details</h5>
				</div>
				<div class="modal-body">
					<div class="container pt-2 ">
						<div class="text-center text-dark ">
							<i class="fa fa-user fa-3x"></i>
						</div>
						<h5 class="text-center"><%=u.getName()%></h5>
						<table class="table">
							<tr>
								<th>Name</th>
								<td><%=u.getName()%></td>
							</tr>
							<tr>
								<th>Email Id</th>
								<td><%=u.getEmail()%></td>
							</tr>
							<tr>
								<th>Password</th>
								<td><%=u.getPassword()%></td>
								<td><a href="UserEdit.jsp?email=<%=u.getEmail()%>"
									class="btn btn-primary">Edit</a></td>
							</tr>
						</table>
					</div>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-danger"
						data-bs-dismiss="modal">Close</button>
				</div>
			</div>
		</div>
	</div>
	<%
	}
	%>



</nav>
