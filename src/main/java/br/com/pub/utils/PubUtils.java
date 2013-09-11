package br.com.pub.utils;

import static br.com.pub.constants.PUB_CONSTANTS.*;

import java.io.File;
import java.io.IOException;
import java.net.URL;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.io.FileUtils;

import br.com.pub.enumeration.StaticImage;
import br.com.pub.service.AmazonService;
import br.com.pub.service.MessageService;

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
			.replaceAll(" ", "")
			.replaceAll("'", "");
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
	
	public static String setCountryTitle(MessageService messageService, String country, HttpServletRequest request) {
		return messageService.getMessageFromResource(request, "top100") + " - " + messageService.getMessageFromResource(request, "country." + getCountry(country));
	}
	
	private static String getCountry(String country) {
		return country.trim().toLowerCase().replaceAll("\\s+", "");
	}
	
	public static void resolvePage(int page, int maxResults, Map<String, Object> map, HttpServletRequest request) {
		map.put("pageUrl", request.getRequestURL().toString());
		map.put("pageNum", page);
		map.put("maxPages", getMaxPages(maxResults, MAX_ITEMS_PER_PAGE, MAX_PAGES_TO_DISPLAY));
	}
	
	public static int getMaxPages(int size, int maxItems, int maxPages) {
		if (size / maxItems > maxPages) {
			return maxPages;
		} else {
			if (size % maxItems == 0) {
				return size / maxItems;
			} else {
				return (size / maxItems) + 1;
			}
		}
	}
	
	public static int maxItemsPerPage(int page, int multiple) {
		return (page * multiple) - multiple;
	}

	public static int setRank(int reviews) {
		if (reviews <= 50) {
			return 1;
		} else if (reviews > 50 && reviews <= 200) {
			return 2;
		} else if (reviews > 200 && reviews <= 400) {
			return 3;
		} else if (reviews > 400 && reviews <= 600) {
			return 4;
		} else if (reviews > 600) {
			return 5;
		}
		
		return 0;
	}
}