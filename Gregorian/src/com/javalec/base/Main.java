package com.javalec.base;

import java.text.*;
import java.util.*;

public class Main {

	public static void main(String[] args) {
		// TODO Auto-generated method stub

		SimpleDateFormat formatter = new SimpleDateFormat ( "yyyy-MM-dd HH:mm:ss", Locale.KOREA );
		Date currentTime = new Date ();
		String dTime = formatter.format ( currentTime );
		System.out.println ( dTime );
		
		
		
	}
	
	

}
