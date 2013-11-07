package br.com.pub.test.util;

import com.pub.utils.PubUtils;

public class TesteMaxPages {
	
	public static void main(String[] args) {
		
		int x = PubUtils.getMaxPages(154, 10, 20);
		System.out.println(x);
		
		int y = PubUtils.getMaxPages(250, 10, 20);
		System.out.println(y);
		
	}

}
