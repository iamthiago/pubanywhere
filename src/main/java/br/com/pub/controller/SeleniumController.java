package br.com.pub.controller;


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

import br.com.pub.domain.Pub;
import br.com.pub.service.PubService;
import br.com.pub.utils.PubUtils;
import br.com.pub.validation.PubValidations;

@Controller
@RequestMapping("selenium")
public class SeleniumController {

	private static final int MAX_ITEMS_PER_PAGE = 10;
	private static final int MAX_PAGES_TO_DISPLAY = 20;
	
	@Autowired private PubService pubService;
	
	@ResponseBody
	@RequestMapping("start/{city}/{country}")
	public String start(@PathVariable String city, @PathVariable String country) {
		
		try {
			
			execute("Pubs in " + city + ", " + country);
			
		} catch (Exception e) {
			System.out.println(e.getMessage());
			return "fail";
		}
		
		return "done";
	}

	public void execute(String search) throws InterruptedException {
		
		WebDriver driver = new FirefoxDriver();
		driver.get("https://maps.google.ie/maps?hl=en&tab=ll");
		
		WebElement query = driver.findElement(By.name("q"));
		
		query.clear();
		query.sendKeys(search);
		query.submit();
		
		Thread.sleep(2000);
		
		String numbers = driver.findElement(By.xpath("//span[@class='num_results']/b")).getText();
		int maxPages = PubUtils.getMaxPages(Integer.parseInt(numbers.replaceAll("[^0-9]", "")), MAX_ITEMS_PER_PAGE, MAX_PAGES_TO_DISPLAY);
		
		for (int i = 1; i <= maxPages; i++) {
			if (i != 1) {
				changePage(driver);
				Thread.sleep(2000);
			}
			
			getPubs(driver);
			System.out.println("page " + i + " registered!");
		}
		
		driver.quit();
	}

	private void changePage(WebDriver driver) {
		driver.findElement(By.xpath("//td[@class='b']/a/div[@id='nn']")).click();		
	}

	private void getPubs(WebDriver driver) {
		List<WebElement> pubs = driver.findElements(By.xpath("//div[contains(@id, 'panel_')]"));
		List<Pub> listPubs = new ArrayList<Pub>();
		
		for (WebElement webElement : pubs) {
			String name = webElement.findElement(By.xpath("div[contains(@id, 'link_')]/span[@class='pp-place-title']/span")).getText();
			String local = webElement.findElement(By.xpath("div/span[@class='pp-headline-item pp-headline-address']/span")).getText();
			String phone = checkNull(webElement, "div/div/span/span[@class='telephone']/nobr");
			String website = checkNull(webElement, "div/div/span[@class='pp-headline-item pp-headline-authority-page']/span/a/span");
			
			Pub seleniumPub = new Pub(name, local, null, phone, null, website);
			listPubs.add(PubValidations.valid(seleniumPub, false));
		}
		
		pubService.registerPubSelenium(listPubs);
	}

	private String checkNull(WebElement webElement, String expression) {
		List<WebElement> foundElement = webElement.findElements(By.xpath(expression));
		if (!foundElement.isEmpty()) {
			return foundElement.get(0).getText();
		}
		return null;
	}
}
