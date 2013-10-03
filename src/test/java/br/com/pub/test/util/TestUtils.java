package br.com.pub.test.util;

import org.apache.commons.lang.StringUtils;

public class TestUtils {
	
	public static void main(String[] args) {
		String url1 = "pubanywhere.com";
		String url2 = "www.pubanywhere.com";
		String url3 = null;
		
		System.out.println(validURL(url1));
		System.out.println(validURL(url2));
		System.out.println(validURL(url3));
	}
	
	private static String validURL(String url) {
		if (!StringUtils.isEmpty(url)) {
			if (!url.contains("www.")) {
				url = "www." + url;
			}
			
			if (!url.contains("http://") && !url.contains("https://")) {
				url = "http://" + url;
			}
			
			url.toLowerCase().trim();
		}
		
		return url;
	}
}
