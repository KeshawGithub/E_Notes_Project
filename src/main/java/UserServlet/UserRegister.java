package UserServlet;

import java.io.IOException;


import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import CURD.UserCurd;
import Dbconn.databaseConn;
import UserEntity.Users;


@WebServlet("/userservlet")
public class UserRegister extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String name=req.getParameter("fullName");
		String email=req.getParameter("email");
		String password=req.getParameter("password");
		 
		Users u=new Users(name,email,password);
		 UserCurd uc=new UserCurd(databaseConn.getConn());
		 boolean f=uc.register(u);
		 
		 HttpSession session=req.getSession();
	
		 
		 if(f==true) {
			 session.setAttribute("reg-suc","Registration Successful..!");
			 resp.sendRedirect("register.jsp");
		 }else {
			 session.setAttribute("reg-failed","Something wrong on server..!");
			 resp.sendRedirect("register.jsp");
		 }
	}

}
