<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@page import="UserEntity.Users"%>
<%@page import="UserEntity.UserPost"%>
<%@page import="CURD.postCurd"%>
<%@page import="java.util.List"%>
<%@page import="Dbconn.databaseConn"%>

<%
Users user = (Users) session.getAttribute("UserObj");
if (user == null) {
	session.setAttribute("Login-error", "Please Login");
	response.sendRedirect("login.jsp");
	return;
}
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Show Notes</title>
<%@include file="component/allCSS.jsp"%>
<link rel="stylesheet" href="styleSheet.css">
<style>
body {
	background-color: #000;
	color: white;
}

.container {
	margin-top: 40px;
	max-width: 900px;
	background: rgba(255, 255, 255, 0.1);
	padding: 0px 30px 30px 30px;
	border-radius: 20px;
	box-shadow: 0px 4px 10px rgba(0, 0, 0, 0.7);
}

.card-body {
	background: rgba(255, 255, 255, 0.2);
	color: white;
	border: 1px solid #a22cea;
	border-radius: 20px;
	transition: all 0.3s ease;
}

.card-body:hover {
	background: white;
	color: black;
	border: 1px solid black;
}
</style>
</head>
<body>
	<%@include file="component/NavBar.jsp"%>
	<h2 class="text-center mt-5">All Notes</h2>
	<!-- Display success or error messages with the help of alert -->

	<%
	String EditNotes = (String) session.getAttribute("AddEditNote");
	if (EditNotes != null) {
	%>
	<div class="alert alert-success text-center" role="alert"><%=EditNotes%></div>
	<%
	session.removeAttribute("AddEditNote");
	}
	%>

	<%
	String NotEditNotes = (String) session.getAttribute("NotEditNote");
	if (NotEditNotes != null) {
	%>
	<div class="alert alert-danger text-center" role="alert"><%=NotEditNotes%></div>
	<%
	session.removeAttribute("NotEditNote");
	}
	%>
	
	<%
	String DeleteNotes = (String) session.getAttribute("DeleteNote");
	if (DeleteNotes != null) {
	%>
	<div class="alert alert-success text-center" role="alert"><%=DeleteNotes%></div>
	<%
	session.removeAttribute("DeleteNote");
	}
	%>
	
	<%
	String NotDeleteNote = (String) session.getAttribute("NotDeleteNote");
	if (NotDeleteNote != null) {
	%>
	<div class="alert alert-success text-center" role="alert"><%=NotDeleteNote%></div>
	<%
	session.removeAttribute("NotDeleteNote");
	}
	%>
	
	
	<div class="container">
		<div class="row">
			<div class="col-md-12">
				<%
				postCurd up = new postCurd(databaseConn.getConn());
				List<UserPost> posts = up.getData(user.getEmail());

				if (posts != null && !posts.isEmpty()) {
					for (UserPost userpost : posts) {
				%>
				<!-- Published Info and Image -->
				<div class="d-flex justify-content-between align-items-center">
					<div>
						<p class="mb-0">
							<b class="text-success">Published By:</b> <b class="text-primary"><%=user.getName()%></b>
						</p>
						<p class="mb-0">
							<b class="text-success">Published Date:</b> <b
								class="text-primary"><%=userpost.getFormattedPdate()%></b>
						</p>
					</div>
					<div>
						<img alt="Published Image" src="image/pngtree.png"
							class="card-img-top" style="max-width: 100px;">
					</div>
				</div>

				<!-- Card Body -->
				<div class="card-body p-4">
					<h5 class="card-title mb-3 text-center"><%=userpost.getTitle()%></h5>
					<p><%=userpost.getContent()%></p>

					<div class="text-end mt-2">
						
						<form action="DeletePost" method="post" style="display:inline; ">
    							<input type="hidden" name="id" value="<%= userpost.getId() %>">
    							<button type="submit" class="btn btn-danger">Delete</button>
							</form>
						<a
							href="NotesEdit.jsp?id=<%=userpost.getId()%>"
							class="btn btn-primary">Edit</a>
					</div>
				</div>
				<hr>
				<%
				}
				} else {
				%>
				<p>No posts available.</p>
				<%
				}
				%>
			</div>
		</div>
	</div>
</body>
</html>
