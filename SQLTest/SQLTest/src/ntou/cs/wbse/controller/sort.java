package ntou.cs.wbse.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.util.Random;

/**
 * Servlet implementation class FBServlet
 */

public class sort extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public sort() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.setCharacterEncoding("UTF-8");
		doGet(request, response);
		request.setCharacterEncoding("UTF-8");
		String[] friendId = request.getParameterValues("friend");
		String myId = request.getParameter("myId");
		ArrayList<String> FriendId = new ArrayList<String>();
		int size=java.lang.reflect.Array.getLength(friendId); 
	

		Random rand=new Random(); 
 		String temp;
 		for(int i = 0; i<10;i++){
 			int num = rand.nextInt(size);
 			temp = friendId[0];
 			friendId[0] = friendId[num];
 			friendId[num] = temp;
 		}
 		FriendId.add(myId);
 		for (int i=0;i<size;i++) 
		  { 
		    FriendId.add(friendId[i]);
		  }
 		for (int i=0;i<4;i++) 
		  { 
		    System.out.println(FriendId.get(i)); 
		  }
 		
 		ServletContext quizContext = this.getServletContext();
		quizContext.setAttribute("FriendId", FriendId);
 		request.setAttribute("Friendid", FriendId);
 		request.setAttribute("size", size);
 		RequestDispatcher view = request.getRequestDispatcher("SendStart.jsp");
		view.forward(request, response);
	}

}
