package br.com.pub.test.util;

import br.com.pub.domain.Pub;
import br.com.pub.service.PubUtils;

public class TestUtils {
	
	public static void main(String[] args) {
		Pub pub = new Pub();
		pub.setName(" Thiago's é outro ");
		System.out.println(PubUtils.removeInvalidCharacters(pub.getName().toLowerCase()));
	}
}
