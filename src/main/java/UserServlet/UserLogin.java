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
@WebServlet("/loginServlet")
public class UserLogin extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String email=req.getParameter("email");
		String password=req.getParameter("password");
		 UserCurd uc=new UserCurd(databaseConn.getConn());
		Users u=uc.login(email, password);
		HttpSession session=req.getSession();
		if(u != null) {
			session.setAttribute("UserObj", u);
			resp.sendRedirect("Home.jsp");
		}else {
			session.setAttribute("login-failed", "Invalid UserId and Password");
			resp.sendRedirect("login.jsp");
		}
	}

}
