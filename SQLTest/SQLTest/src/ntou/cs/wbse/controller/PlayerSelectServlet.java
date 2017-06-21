package ntou.cs.wbse.controller;
import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;

public class PlayerSelectServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
		ArrayList<String> friendId = new ArrayList<String>();
		ServletContext friendContext = this.getServletContext();		
		friendId = (ArrayList<String>)friendContext.getAttribute("FriendId");
		int count = 0;
		String person = request.getParameter("person_ID");

	
		for (int i=1;i<4;i++) { 
			count++;
		    //friendId[i]
	
			if(friendId.get(i).equals(person)){
				if(i % 2 == 0){
		
					friendContext.setAttribute("id", i+1);
					//response.sendRedirect("/FileDownloadDBServlet");
					RequestDispatcher dispatcher = request.getRequestDispatcher("/AnswerDownloadDBServlet");
					dispatcher.forward(request,response);
					return;
				}
				else{
			
					friendContext.setAttribute("id", i+1);
					//response.sendRedirect("/AnswerDownloadDBServlet");
					RequestDispatcher dispatcher = request.getRequestDispatcher("/FileDownloadDBServlet");
					dispatcher.forward(request,response);
					return;
				}
			}
		  }
			friendContext.setAttribute("id", 1);
			//response.sendRedirect("/AnswerDownloadDBServlet");
			RequestDispatcher dispatcher = request.getRequestDispatcher("/AnswerDownloadDBServlet");
			dispatcher.forward(request,response);
			return;
    }
}
