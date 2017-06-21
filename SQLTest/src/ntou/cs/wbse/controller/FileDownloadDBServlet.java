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

public class FileDownloadDBServlet extends HttpServlet {
 
    // size of byte buffer to send file
    private static final int BUFFER_SIZE = 4096;  
    // database connection settings
    private String host = "localhost";
    private String dbUser = "root";
    private String dbPass = "123";
    final private String database = "testc";
    
    protected void doPost(HttpServletRequest request,
            HttpServletResponse response) throws ServletException, IOException {

        Connection conn = null; // connection to the database
        
        ServletContext quizContext = this.getServletContext();
        int playerId = (int)quizContext.getAttribute("id");
      
        //int playerId = 2;
     
        try {
            // connects to the database
        	DriverManager.registerDriver(new com.mysql.jdbc.Driver());
            conn = DriverManager.getConnection("jdbc:mysql://" + host + "/"
                    + database + "?" + "user=" + dbUser + "&password=" + dbPass);
         
            // queries the database
            int a =  playerId / 2;
            String aString = String.valueOf(a);
            String sql = "SELECT * FROM photo WHERE id =" + aString;
            PreparedStatement statement = conn.prepareStatement(sql);
            String photoURL = null;
            ResultSet result = statement.executeQuery();
            if (result.next()) {
                photoURL = result.getString("photo");                
                request.setAttribute("photoURL", photoURL);
             
                RequestDispatcher view = request.getRequestDispatcher("/even.jsp");
    			view.forward(request, response);
               } 
            } catch (SQLException ex) {
            ex.printStackTrace();
            //response.getWriter().print("SQL Error: " + ex.getMessage());
        } catch (IOException ex) {
            ex.printStackTrace();
            //response.getWriter().print("IO Error: " + ex.getMessage());
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
}