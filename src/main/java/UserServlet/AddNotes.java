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

@WebServlet("/AddNotesServlet")
public class AddNotes extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String email=req.getParameter("email");
		String title=req.getParameter("title");
		String content=req.getParameter("content");
		
		postCurd pc=new postCurd(databaseConn.getConn());
		boolean f=pc.AddNotes(title,content,email);
		HttpSession session=req.getSession();
		if(f) {
			session.setAttribute("AddNotes", "Notes Added Successfully..!");
			resp.sendRedirect("AddNotes.jsp");
		}else {
			session.setAttribute("AddNotesFailed", "Something wrong on server..!");
			resp.sendRedirect("AddNotes.jsp");
		}
	}

}
