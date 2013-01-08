package br.com.pub.test.util;

import br.com.pub.domain.Pub;
import br.com.pub.service.PubUtils;

public class TestUtils {
	
	public static void main(String[] args) {
		Pub pub = new Pub();
		pub.setNome(" Thiago ");
		pub.setEmail(" thiago@gmail.com ");
		Pub newPub = (Pub) PubUtils.removeWhiteSpaces(pub);
		System.out.println(newPub.getNome());
		System.out.println(newPub.getEmail());
	}
}
