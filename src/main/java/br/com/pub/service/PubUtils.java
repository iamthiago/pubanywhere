package br.com.pub.service;

import java.io.File;
import java.io.IOException;
import java.net.URL;

import org.apache.commons.io.FileUtils;

import br.com.pub.enumeration.StaticImage;

public class PubUtils {
	
	public static String replaceSpaceByUnderline(String string) {
		return string.replaceAll(" ", "_");
	}
	
	public static String removeInvalidCharacters(String string) {
		return string.replaceAll("[^A-Za-z0-9()\\[\\]]", "");
	}
	
	public static String retiraAcentoRegex(String string) {
		return string
			.replaceAll("[áàâãª]", "a")
			.replaceAll("[ÁÀÂÃ]", "A")
			.replaceAll("[éèêë]", "e")
			.replaceAll("[ÉÈÊË]", "E")
			.replaceAll("[íìî]", "i")
			.replaceAll("[ÍÌÎ]", "I")
			.replaceAll("[óòôõº]", "o")
			.replaceAll("[ÓÒÔÕ]", "O")
			.replaceAll("[úùû]", "u")
			.replaceAll("[ÚÙÛ]", "U")
			.replaceAll("[ç]", "c")
			.replaceAll("[Ç]", "C")
			.replaceAll(" ", "");
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