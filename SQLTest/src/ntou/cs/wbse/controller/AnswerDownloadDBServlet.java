package ntou.cs.wbse.controller;

import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.sql.Blob;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class AnswerDownloadDBServlet extends HttpServlet {
 
    // size of byte buffer to send file
    private static final int BUFFER_SIZE = 4096;  
    // database connection settings
    private String dbUser = "root";
    private String dbPass = "123";
    private String dbURL = "jdbc:mysql://localhost/testc?useUnicode=true&characterEncoding=UTF-8";
    
    protected void doPost(HttpServletRequest request,
            HttpServletResponse response) throws ServletException, IOException {

        Connection conn = null; // connection to the database
		
		
       
        ServletContext quizContext = this.getServletContext();
        int playerId = (int)quizContext.getAttribute("id"); //get player's id(1st, 2nd...)
     
		String quiz = (String) quizContext.getAttribute("quiz");
		
		if(playerId != 1)
		{
			try {
	        	DriverManager.registerDriver(new com.mysql.jdbc.Driver());
	            conn = DriverManager.getConnection(dbURL, dbUser, dbPass);
	           
	            int a =  playerId / 2;
	            String aString = String.valueOf(a);
	            String sql = "SELECT * FROM answer WHERE id =" + aString;
	            PreparedStatement statement = conn.prepareStatement(sql);
	            String answer = null;
	            ResultSet result = statement.executeQuery();
	            if (result.next()) {
	                answer = result.getString("answer");                
	                request.setAttribute("answer", answer);
	             
	                RequestDispatcher view = request.getRequestDispatcher("canvas.jsp");
	    			view.forward(request, response);
	    		
	            } 
	        } catch (SQLException ex) {
	            ex.printStackTrace();
	            //response.getWriter().print("SQL Error: " + ex.getMessage());
	        } catch (IOException ex) {
	            ex.printStackTrace();
	           // response.getWriter().print("IO Error: " + ex.getMessage());
	        } finally {
	            if (conn != null) {
	                // closes the database connection
	                try {
	                    conn.close();
	                } catch (SQLException ex) {
	                    ex.printStackTrace();
	                }
	            }          
	        }
		}
		else
		{
			
			RequestDispatcher view = request.getRequestDispatcher("canvas.jsp");
 			view.forward(request, response);
		}
    }
}