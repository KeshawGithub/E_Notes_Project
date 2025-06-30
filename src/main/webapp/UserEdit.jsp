<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="UserEntity.Users"%>
 
 <%
Users user = (Users) session.getAttribute("UserObj");
if (user == null) {
	session.setAttribute("Login-error", "Please Login");
	response.sendRedirect("login.jsp");
	
}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>UserDetailUpdate</title>
<%@include file="component/allCSS.jsp"%>
<link rel="stylesheet" href="styleSheet.css">
<style>

body {
    margin: 0;
    padding: 0;
    display: flex;
    justify-content: center;
    align-items: center;
    height: 100vh;
    background-image: linear-gradient(to left bottom, #5a077d, #760b98, #940fb3, #b30fcd, #d50ce8);
    background-size: 400% 400%;
    animation: gradientAnimation 8s ease infinite;

}



h1 {
    display: inline-block;
    font-size: 2.5em;
    line-height: 1.5; /* Space between lines */
    overflow: hidden;
    white-space: nowrap; /* Prevents text wrapping */
    animation: typing 9s steps(40);
}



/* Gradient background animation */
@keyframes gradientAnimation {
    0% { background-position: 0% 50%; }
    50% { background-position: 100% 50%; }
    100% { background-position: 0% 50%; }
}

/* Typing effect */
@keyframes typing {
    from { width: 0; }
    to { width: 100%; }
}

/* Fade-in effect */
@keyframes fadeIn {
    from { opacity: 0; }
    to { opacity: 1; }
}

.div1 {
	height:360px;
    text-align: center; /* Center the content inside the div */
  	color: white;
 
	
}
.div2{
text-align: center; /* Center the content inside the div */
}

</style>
</head>
<body>

<div class="div1">
    <h1>Under Development....<br>Currently in Progress....</h1>
</div>

<div class="div2">
<a href="ShowNotes.jsp"class="btn btn-custom">go Back</a>
</div>

</body>
</html>