package com.pub.utils;

import java.io.IOException;
import java.io.InputStream;
import java.util.Properties;

/**
 * The <code>MessageUtils</code> class represents a simple interface to interact with Properties files.
 * 
 * @author Thiago
 * 
 */
public class MessageUtils {
	
	/**
	 * Returns an instance of the given property file
	 * 
	 * @param clazz the clazz to be used to get the resource
	 * @param fileName the file to be loaded from classpath
	 * @return an instance of the given file
	 */
	public static <T> Properties loadPropertyFile(Class<T> clazz, String fileName) {
		
		InputStream in = null;
		Properties file = new Properties();
		
		try {
			in = clazz.getClassLoader().getResourceAsStream(fileName);
			file.load(in);
			
		} catch (IOException e) {
			e.printStackTrace();
		} finally {
			try {
				in.close();
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
		
		return file;
	}
}