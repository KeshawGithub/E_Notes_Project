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
import UserEntity.UserPost;

@WebServlet("/EditNotesServlet")
public class EditNotes extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		int id=Integer.parseInt(req.getParameter("Notesid"));
		String title=req.getParameter("title");
		String content=req.getParameter("content");
		postCurd pc=new postCurd(databaseConn.getConn());
		boolean userpost=pc.UpdateData(id,title,content);
		HttpSession session=req.getSession();
		if(userpost) {
			session.setAttribute("AddEditNote", "Update Successfully..!");
			resp.sendRedirect("ShowNotes.jsp");
		}else {
			session.setAttribute("NotEditNote", "Something wrong on server..!");
			resp.sendRedirect("ShowNotes.jsp");
		}

	}

}
