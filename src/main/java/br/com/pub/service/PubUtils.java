package br.com.pub.service;

import java.lang.reflect.Field;
import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Method;



public class PubUtils {
	
	public static String replaceSpaceByUnderline(String string) {
		return string.replace(" ", "_");
	}

	public static Object removeWhiteSpaces(Object obj) {
		try {
			
			Field[] declaredFields = obj.getClass().getDeclaredFields();
			Method[] declaredMethods = obj.getClass().getDeclaredMethods();
			
			for (Field field : declaredFields) {
				for (Method method : declaredMethods) {
					boolean isGet = method.getName().startsWith("get");
					if (isGet && method.getName().toLowerCase().contains(field.getName())) {
						if (method.invoke(obj) != null) {
							field.setAccessible(true);
							field.set(obj, method.invoke(obj).toString().trim());
						}
					}
				}
			}
			
		} catch (SecurityException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IllegalArgumentException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IllegalAccessException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (InvocationTargetException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return obj;
	}
}