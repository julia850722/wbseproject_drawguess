package ntou.cs.wbse.controller;

import java.io.File;
import java.io.FileNotFoundException;
import java.util.ArrayList;
import java.util.Scanner;
import java.util.StringTokenizer;

import javax.servlet.ServletContext;
import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;
import javax.servlet.annotation.WebListener;
import java.util.Random;

@WebListener
public class FileListener implements ServletContextListener {

	private Scanner input;
	private String filename ;
	private ArrayList <String> quizList = new ArrayList<String>();
	int count ;

    public void contextDestroyed(ServletContextEvent sce)  { 
    	
    }

    public void contextInitialized(ServletContextEvent sce)  { 
    	ServletContext sc = sce.getServletContext();
    	String name = sc.getInitParameter("file");
    	filename = sc. getRealPath(name);
    	 
 		openFile();
 		readQuestions();
 		closeFile();
 		Random rand=new Random(); 
 		//System.out.println(count);
 		int lucky=rand.nextInt(count);
 		
 		String Quiz = quizList.get(lucky);
 		sc.setAttribute("quiz", Quiz); 		
    }
    public void openFile ()
	{
		try
		{
			input = new Scanner(new File(filename), "utf-8");
		} // end try
		catch (FileNotFoundException fileNotFoundException)
		{
			System.err.println("Error opening file.");
			System.exit(1);
		} // end catch
	} // end method openFile

	// read quiz from file
	public void readQuestions ()
	{
		 String quiz = null;
		 count = 0;
		try
		// read records from file using Scanner object
		{			
			while (input.hasNextLine())
			{				
				StringTokenizer tokens = new StringTokenizer(input.nextLine());
				++count;
				if (tokens.hasMoreTokens())
				{					
					String token = tokens.nextToken();					
					quiz = token;
					quizList.add(quiz);
				}				
			}
		} // end try
		
		catch (IllegalStateException stateException)
		{
			System.err.println("Error reading from file.");
			System.exit(1);
		} // end catch
		
	} // end method readRecords

	// close file and terminate application
	public void closeFile ()
	{
		if (input != null)
			input.close(); // close file
	} // end method closeFile	
}
