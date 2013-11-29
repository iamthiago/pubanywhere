package com.pub.controller;


import java.util.ArrayList;
import java.util.List;

import org.openqa.selenium.By;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.firefox.FirefoxDriver;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.pub.mongo.domain.Pub;
import com.pub.service.PubMongoService;
import com.pub.utils.PubUtils;
import com.pub.validation.PubValidations;


@Controller
@RequestMapping("selenium")
public class SeleniumController {

	private static final int MAX_ITEMS_PER_PAGE = 10;
	private static final int MAX_PAGES_TO_DISPLAY = 20;
	
	private List<Pub> totalPubs;
	
	@Autowired private PubMongoService pubMongoService;
	
	@ResponseBody
	@RequestMapping("start/{city}/{country}")
	public String start(@PathVariable String city, @PathVariable String country) {
		
		try {
			
			execute("Pubs in " + city + ", " + country);
			
		} catch (Exception e) {
			pubMongoService.registerPubSelenium(totalPubs);
			System.out.println("pubs inserted before error: " + totalPubs.size());
			System.out.println(e.getMessage());
			return "fail";
		}
		
		return "done";
	}

	public void execute(String search) throws InterruptedException {
		
		totalPubs = new ArrayList<Pub>();
		
		WebDriver driver = new FirefoxDriver();
		driver.get("https://maps.google.ie/maps?hl=en&tab=ll");
		
		WebElement query = driver.findElement(By.name("q"));
		
		query.clear();
		query.sendKeys(search);
		query.submit();
		
		Thread.sleep(3000);
		
		String numbers = driver.findElement(By.xpath("//span[@class='num_results']/b")).getText();
		int maxPages = PubUtils.getMaxPages(Integer.parseInt(numbers.replaceAll("[^0-9]", "")), MAX_ITEMS_PER_PAGE, MAX_PAGES_TO_DISPLAY);
		
		for (int i = 1; i <= maxPages; i++) {
			if (i != 1) {
				WebElement page = changePage(driver);
				if (page != null) {
					page.click();
					Thread.sleep(3000);
				} else {
					break;
				}
			}
			
			totalPubs.addAll(getPubs(driver));
			System.out.println("page " + i + " scanned!");
		}
		
		pubMongoService.registerPubSelenium(totalPubs);
		driver.quit();
	}

	private WebElement changePage(WebDriver driver) {
		return driver.findElement(By.xpath("//td[@class='b']/a/div[@id='nn']"));
	}

	private List<Pub> getPubs(WebDriver driver) {
		List<WebElement> pubs = driver.findElements(By.xpath("//div[contains(@id, 'panel_')]"));
		List<Pub> listPubs = new ArrayList<Pub>();
		
		for (WebElement webElement : pubs) {
			String name = checkNull(webElement, "div[contains(@id, 'link_')]/span[@class='pp-place-title']/span");
			String local = checkNull(webElement, "div/span[@class='pp-headline-item pp-headline-address']/span");
			String phone = checkNull(webElement, "div/div/span/span[@class='telephone']/nobr");
			String website = checkNull(webElement, "div/div/span[@class='pp-headline-item pp-headline-authority-page']/span/a/span");
			
			Pub seleniumPub = new Pub(name, local, phone, website);
			if (seleniumPub.getName() != null && seleniumPub.getLocal() != null) {
				final Pub validPub = PubValidations.valid(seleniumPub, false);
				if (validPub.getLat() != null && validPub.getLng() != null) {
					listPubs.add(validPub);
				}
			}
		}
		
		return listPubs;
	}

	private String checkNull(WebElement webElement, String expression) {
		List<WebElement> foundElement = webElement.findElements(By.xpath(expression));
		if (!foundElement.isEmpty()) {
			return foundElement.get(0).getText();
		}
		return null;
	}
}
