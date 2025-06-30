<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@page import="UserEntity.Users"%>
<%
Users user1 = (Users) session.getAttribute("UserObj");
if (user1 == null) {
	response.sendRedirect("login.jsp");
	session.setAttribute("Login-error", "Please Login..");
}
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Add Notes</title>
<%@include file="component/allCSS.jsp"%>
<link rel="stylesheet" href="styleSheet.css">
<style>
body {
	background-color: #000; /* Black background */
	color: white;
}

.container {
	margin-top: 70px;
	max-width: 900px;
	background: rgba(255, 255, 255, 0.1);
	padding: 30px;
	border-radius: 20px;
	box-shadow: 0px 4px 10px rgba(0, 0, 0, 0.7);
}
/* Form Hover Effects */
.form-control {
	background: rgba(255, 255, 255, 0.2);
	color: white;
	border: 1px solid #a22cea; /* Gold border */
	transition: all 0.3s ease;
}

.form-control:focus, .form-control:hover {
	background: white;
	color: black;
	border: 1px solid black;
}
/* Buttons */
.btn-custom {
	font-size: 16px;
	font-weight: bold;
	padding: 10px 20px;
	border-radius: 5px;
	border: none;
	background: #FFD700; /* Gold button background */
	color: black;
	transition: 0.5s;
}
</style>
</head>
<body>
	<%@include file="component/NavBar.jsp"%>
	<div class="container">
		<div class="container-fluid ">
			<div class="row">
				<div class="col-md-12">
					<h2 class="text-center">Add Your Notes</h2>
					<form action="AddNotesServlet" method="post">
						<%
						Users user = (Users) session.getAttribute("UserObj");
						if (user != null) {
						%>
						<input type="hidden" value="<%=user.getEmail()%>" name="email">
						<%
						}
						%>



						<div class="mb-3">
							<label for="exampleInputEmail1" class="form-label">Enter
								Title </label> <input type="text" class="form-control" name="title"
								required="required" placeholder="Enter your note's title"
								id="exampleInputEmail1" aria-describedby="emailHelp">

						</div>
						<div class="mb-3">
							<label for="exampleInputPassword1" class="form-label">Enter
								Content</label>
							<textarea rows="10" col="" class="form-control" name="content"
								required="required" placeholder="Write your content here"></textarea>
						</div>
						<!-- Display success or error messages with the help of alert -->

						<%
						String SaveNotes = (String) session.getAttribute("AddNotes");
						if (SaveNotes != null) {
						%>
						<div class="alert alert-success" role="alert"><%=SaveNotes%></div>
						<%
						session.removeAttribute("AddNotes");
						}
						
						%>
						
						<%
						String NotAddedNotes = (String) session.getAttribute("AddNotesFailed");
						if (NotAddedNotes != null) {
						%>
						<div class="alert alert-success" role="alert"><%=NotAddedNotes%></div>
						<%
						session.removeAttribute("AddNotesFailed");
						}
						%>
						
						<div class="text-end">
							<button type="submit" class="btn btn-custom">Add Notes</button>
						</div>


					</form>

				</div>
			</div>

		</div>
	</div>
</body>
</html>
