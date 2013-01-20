package br.com.pub.test.util;

import java.math.BigInteger;
import java.security.SecureRandom;

import org.apache.commons.lang.RandomStringUtils;

public class TesteRandomPassword {
	
	private static SecureRandom random = new SecureRandom();
	
	public static void main(String[] args) {
		System.out.println(new BigInteger(130, random).toString(32));
		
		System.out.println(RandomStringUtils.randomAlphanumeric(15));
	}
}
