package br.com.pub.service;

import java.io.File;
import java.io.IOException;
import java.net.URL;

import org.apache.commons.io.FileUtils;

import br.com.pub.enumeration.StaticImage;

public class PubUtils {
	
	public static String replaceSpaceByUnderline(String string) {
		return string.replace(" ", "_");
	}
	
	public static String removeInvalidCharacters(String string) {
		return string.replaceAll("[^A-Za-z0-9()\\[\\]]", "");
	}
	
	public static void uploadDefaultImage(StaticImage staticImg, String fileName) {
		try {
			URL url = new URL("http://www.pubanywhere.com/resources/imgs/" + staticImg.getPath());
			File file = new File(staticImg.getPath());
			FileUtils.copyURLToFile(url, file);
			AmazonService.uploadStaticFile(file, fileName);
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
}