package gdu.edu.studentk16.demo_221402.lib;

import java.io.File;
import java.util.Scanner;

public class lib {
	public static String readFile(String pathfile) throws Exception  {
		File myObj = new File(pathfile);
	    if (myObj.exists()) {
	    	String data = "";
	    	Scanner myReader = new Scanner(myObj);
	        while (myReader.hasNextLine()) {
	          data = data + myReader.nextLine();
	        }
	        myReader.close();
	        return data;
	    } else {
	    	throw new Exception(pathfile + " does not exist.");
	    }
	}
}
