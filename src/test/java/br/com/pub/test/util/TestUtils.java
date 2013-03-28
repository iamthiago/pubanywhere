package br.com.pub.test.util;

import br.com.pub.service.PubUtils;

public class TestUtils {
	
	public static void main(String[] args) {
		String s = "ISH Investments Ltd";
		System.out.println(PubUtils.removeInvalidCharacters(s).toLowerCase());
	}
}
