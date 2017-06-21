package ntou.cs.wbse.controller;
import java.io.IOException;
import java.io.InputStream;
import java.io.FileOutputStream;
import java.io.OutputStream;
import java.sql.Blob;
import java.sql.ResultSet;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

@MultipartConfig(maxFileSize = 16177215)
// upload file's size up to 16MB
public class AnswerUploadDBServlet extends HttpServlet {
	private static final int BUFFER_SIZE = 4096;
    // database connection settings
    private String dbUser = "root";
    private String dbPass = "123";
    private String dbURL = "jdbc:mysql://localhost/testc?useUnicode=true&characterEncoding=UTF-8";
    //naive way to obtain a connection to database
    //this MUST be improved, shown for 
    
    public Connection getConnection() {
        Connection conn = null;
        try {
        	DriverManager.registerDriver(new com.mysql.jdbc.Driver());
            conn = DriverManager.getConnection(dbURL, dbUser, dbPass);
        } catch (Exception e) {         
            throw new RuntimeException("Failed to obtain database connection.", e);
        }
        return conn;
    }
    //useUnicode=true&characterEncoding=UTF-8
   
	@SuppressWarnings("finally")
	public void doPost(HttpServletRequest request, HttpServletResponse response)
        throws ServletException, IOException {
        //get values of text fields
    	String yourAnswer = request.getParameter("guess");
    	ServletContext quizContext = this.getServletContext();
        int playerId = (int)quizContext.getAttribute("id");
        System.out.println(playerId);
        Connection conn = null; // connection to the database
        String message = null; // message will be sent back to client
        try {
            // connects to the database
        	request.setCharacterEncoding("UTF-8");
        	response.setContentType("text/htm; charset=UTF-8");
        	System.out.println(yourAnswer);
        	
            conn = getConnection();
            // constructs SQL statement
            String sql = "INSERT INTO answer (answer) values (?)";
            //Using a PreparedStatement to save the file
            PreparedStatement pstmtSave = conn.prepareStatement(sql);
            // System.out.println(yourAnswer);
            pstmtSave.setString(1, yourAnswer);
            
            int row = pstmtSave.executeUpdate();
            if (row > 0) {
                message = "Answer uploaded and saved into database";
            }
            
        } catch (SQLException ex) {
            message = "ERROR: " + ex.getMessage();
            ex.printStackTrace();
        } finally {
            if (conn != null) {
                // closes the database connection
                try {
                    conn.close();
                } catch (SQLException ex) {
                    //silent
                }
            }
            System.out.println(playerId);
            if(playerId == 4){
            	System.out.println("yes");
            	//doPost(request, response);
            	quizContext.setAttribute("yourAnswer", yourAnswer);
            	//ansContext.setAttribute("quiz", 123);//test
            	response.sendRedirect("/SQLTest/FileDownloadDBServletresult");
            	//RequestDispatcher dispatcher = request.getRequestDispatcher("/FileDownloadDBServletresult");
				//dispatcher.forward(request,response);
				//return;
            }else{
            	//doPost(request, response);
                getServletContext().getRequestDispatcher("/message.jsp").forward(request, response);
            	//RequestDispatcher dispatcher = request.getRequestDispatcher("/message.jsp");
				//dispatcher.forward(request,response);
				//return;
            }
        }
        
    }
}