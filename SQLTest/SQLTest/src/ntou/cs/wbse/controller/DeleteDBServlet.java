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
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

@MultipartConfig(maxFileSize = 16177215)

public class DeleteDBServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
    
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
        	} catch (Exception e) 
        	{         
        		throw new RuntimeException("Failed to obtain database connection.", e);
        	}
        return conn;
    }
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
		Connection conn = null; // connection to the database
        String message = null; // message will be sent back to client
		try {
            // connects to the database
			request.setCharacterEncoding("UTF-8");
        	response.setContentType("text/htm; charset=UTF-8");
            conn = getConnection();
            // constructs SQL statement
            String sql = "DELETE FROM photo";
            //Using a PreparedStatement to save the file
            PreparedStatement pstmtSave = conn.prepareStatement(sql);
            //sends the statement to the database server
            int row = pstmtSave.executeUpdate();
            if (row > 0) 
            {
                message = "File delete! ";
            }
            String sql1 = "DELETE FROM answer";
            //Using a PreparedStatement to save the file
            PreparedStatement pstmtSave1 = conn.prepareStatement(sql1);
            //sends the statement to the database server
            int row1 = pstmtSave1.executeUpdate();
            if (row1 > 0) 
            {
                message += " & Answer delete!";
             }
            String sql2 = "ALTER TABLE `answer` auto_increment = 1";
            //Using a PreparedStatement to save the file
            PreparedStatement pstmtSave2 = conn.prepareStatement(sql2);
            //sends the statement to the database server
            int row2 = pstmtSave2.executeUpdate();
            if (row2 > 0) 
            {
                message += " & ID update to 1";
             }
            String sql3 = "ALTER TABLE `photo` auto_increment = 1";
            //Using a PreparedStatement to save the file
            PreparedStatement pstmtSave3 = conn.prepareStatement(sql3);
            //sends the statement to the database server
            int row3 = pstmtSave3.executeUpdate();
            if (row3 > 0) 
            {
                message += " & ID update to 1";
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

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}
}
