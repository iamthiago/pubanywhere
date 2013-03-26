package br.com.pub.test.upload;

import java.io.File;
import java.io.IOException;
import java.net.MalformedURLException;
import java.net.URL;

import org.apache.commons.io.FileUtils;

import br.com.pub.service.AmazonService;

public class UserImageTest {

	public static void main(String[] args) {
		try {
			
			URL url = new URL("http://www.pubanywhere.com/resources/imgs/user_75x75.gif");
			File file = new File("teste");
			FileUtils.copyURLToFile(url, file);
			AmazonService.uploadStaticFile(file, "ciclano");
		
		} catch (MalformedURLException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
}
