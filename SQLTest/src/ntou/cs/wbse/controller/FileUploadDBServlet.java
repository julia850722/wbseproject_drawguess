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
import java.util.ArrayList;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

@MultipartConfig(maxFileSize = 16177215)
// upload file's size up to 16MB
public class FileUploadDBServlet extends HttpServlet {
	private static final int BUFFER_SIZE = 4096;
    // database connection settings
    private String host = "localhost";
    private String dbUser = "root";
    private String dbPass = "123";
    final private String database = "testc";

    //naive way to obtain a connection to database
    //this MUST be improved, shown for 
    public Connection getConnection() {
        Connection conn = null;
        try {
            DriverManager.registerDriver(new com.mysql.jdbc.Driver());
            conn = DriverManager.getConnection("jdbc:mysql://" + host + "/"
                    + database + "?" + "user=" + dbUser + "&password=" + dbPass);
        } catch (Exception e) {         
            throw new RuntimeException("Failed to obtain database connection.", e);
        }
        return conn;
    }

    public void doPost(HttpServletRequest request, HttpServletResponse response)
        throws ServletException, IOException {
        //get values of text fields
    	 response.setCharacterEncoding("UTF-8");
 		request.setCharacterEncoding("UTF-8");
        String pictureURL = request.getParameter("hid");
        String FriendName0 = request.getParameter("FriendName0");
        String FriendName1 = request.getParameter("FriendName1");
        String FriendName2 = request.getParameter("FriendName2");
        String FriendName3 = request.getParameter("FriendName3");
        ArrayList<String> FriendName = new ArrayList<String>();
        System.out.println(FriendName0);
        System.out.println(FriendName1);
        System.out.println(FriendName2);
        System.out.println(FriendName3);
        
        FriendName.add(FriendName0);
        FriendName.add(FriendName1);
        FriendName.add(FriendName2);
        FriendName.add(FriendName3);
        ServletContext friendContext = this.getServletContext();		
		friendContext.setAttribute("FriendName", FriendName);
        Connection conn = null; // connection to the database
        String message = null; // message will be sent back to client
        try {
            // connects to the database
            conn = getConnection();
            // constructs SQL statement
            String sql = "INSERT INTO photo (photo) values (?)";
            //Using a PreparedStatement to save the file
            PreparedStatement pstmtSave = conn.prepareStatement(sql);
            pstmtSave.setString(1, pictureURL);

            //sends the statement to the database server
            int row = pstmtSave.executeUpdate();
            if (row > 0) {
                message = "File uploaded and saved into database";
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
            // sets the message in request scope
            request.setAttribute("message", message);

            // forwards to the message page
            getServletContext().getRequestDispatcher("/message.jsp")
                .include(request, response);
        }
    }
}