package UserServlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import CURD.postCurd;
import Dbconn.databaseConn;
@WebServlet("/DeletePost")
public class DeletePost extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
	              int id=Integer.parseInt(req.getParameter("id"));
	              postCurd pc=new postCurd(databaseConn.getConn());
	              boolean f=pc.DeleteNotes(id);
	              HttpSession session = req.getSession();
	              
	              if(f) {
	            	  	session.setAttribute("DeleteNote", "Delete Successfully..!");
	      				resp.sendRedirect("ShowNotes.jsp"); 
	              }else {
	            	  session.setAttribute("NotDeleteNote", "Something is wrong on server..!");
	      				resp.sendRedirect("ShowNotes.jsp");
	              }
	              
	}

}
