package br.com.pub.test.util;

public class TesteSplit {
	
	public static void main(String[] args) {
		String email = "thiagoandrade6@gmail.com";
		//String[] split = email.split("\\@");
		System.out.println(email.split("\\@")[0]);
		System.out.println(email.replace("@", "."));
	}
}
