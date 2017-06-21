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
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


public class FileDownloadDBServletresult extends HttpServlet {
 
    // size of byte buffer to send file
    private static final int BUFFER_SIZE = 4096;  
    private int i =1;
    private String[] str = new String[10];
    private String[] ansstr = new String[10];
    // database connection settings
    private String host = "localhost";
    private String dbUser = "root";
    private String dbPass = "123";
    final private String database = "testc";
    private String dbURL = "jdbc:mysql://localhost/testc?useUnicode=true&characterEncoding=UTF-8";
    
    protected void doGet(HttpServletRequest request,
            HttpServletResponse response) throws ServletException, IOException {
    	ServletContext ansContext = this.getServletContext();	
    	String strquiz = (String)ansContext.getAttribute("quiz");
    	ArrayList<String> friendsid = new ArrayList<String>();
    	friendsid = (ArrayList<String>)ansContext.getAttribute("FriendId");
    	System.out.println(friendsid);
    	System.out.println("test1");
    	//String strquiz = Integer.toString(quiz);
    	System.out.println(strquiz);//correct answer
    	for(;i<6;i++){
        Connection conn = null; // connection to the database
        try {
            // connects to the database
        	DriverManager.registerDriver(new com.mysql.jdbc.Driver());
            conn = DriverManager.getConnection("jdbc:mysql://" + host + "/"
                    + database + "?" + "user=" + dbUser + "&password=" + dbPass);
 
            String ANSsql = "SELECT * FROM answer WHERE id = "+i;
            String sql = "SELECT * FROM photo WHERE id = "+i;
            PreparedStatement statement = conn.prepareStatement(sql);
            String photoURL = null;
            ResultSet result = statement.executeQuery();
          
            if (result.next()) {
               photoURL = result.getString("photo");    
               str[i-1]=photoURL;
               
               System.out.println(i);
               System.out.println(photoURL);
               
            } 
            PreparedStatement statement1 = conn.prepareStatement(ANSsql);
            String answ = null;
            ResultSet result1 = statement1.executeQuery();
          
            if (result1.next()) {
            	answ = result1.getString("answer");    
               ansstr[i-1]=answ;
               
               System.out.println(i);
               System.out.println(answ);
               
            } 
           /* request.setAttribute("photoURL", str);
            System.out.print(str);
            RequestDispatcher view = request.getRequestDispatcher("message.jsp");
			view.forward(request, response);
            OutputStream outStream = response.getOutputStream();
    		outStream.close(); */
    		/*RequestDispatcher view = request.getRequestDispatcher("Result.jsp");
			view.forward(request, response);*/
        } catch (SQLException ex) {
            ex.printStackTrace();
            //response.getWriter().print("SQL Error: " + ex.getMessage());
        } /*catch (IOException ex) {
            ex.printStackTrace();
           // response.getWriter().print("IO Error: " + ex.getMessage());
        } */finally {
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
    	request.setAttribute("photoURL1", str);
    	request.setAttribute("answer1", ansstr);
    	//ansContext.setAttribute("photoURL", str);
    	//ansContext.setAttribute("answer", ansstr);
    	for(i=0;i<5;i++){System.out.println(str[i]);}
    	for(i=0;i<2;i++){System.out.println(ansstr[i]);}
    	String ans = (String)ansContext.getAttribute("yourAnswer");
    	System.out.println(ans);
    	System.out.println(strquiz);

    	if(ans.equals(strquiz)){request.setAttribute("result", 1);}
    	else{request.setAttribute("result", 0);}
    	RequestDispatcher view = request.getRequestDispatcher("Result.jsp");
			view.forward(request, response);
           OutputStream outStream = response.getOutputStream();
   		outStream.close(); 
}
}