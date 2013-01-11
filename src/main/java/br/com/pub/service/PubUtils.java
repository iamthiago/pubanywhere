package br.com.pub.service;

public class PubUtils {
	
	public static String replaceSpaceByUnderline(String string) {
		return string.replace(" ", "_");
	}
	
	public static String removeInvalidCharacters(String string) {
		return string.replaceAll("[^A-Za-z0-9()\\[\\]]", "-");
	}
}