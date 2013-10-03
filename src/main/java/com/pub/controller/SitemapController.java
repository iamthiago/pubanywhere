package com.pub.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.pub.mongo.domain.Pub;
import com.pub.service.PubMongoService;
import com.pub.sitemap.XmlUrl;
import com.pub.sitemap.XmlUrlSet;


@Controller
public class SitemapController {
	
	@Autowired private PubMongoService pubMongoService;
	
	@ResponseBody
	@RequestMapping(value = {"/sitemap.xml"}, produces = "application/xml", method = RequestMethod.GET)
	public XmlUrlSet getSiteMap() {
		
		List<Pub> pubs = pubMongoService.findAll();
		
		XmlUrlSet xmlUrlSet = new XmlUrlSet();
		
		create(xmlUrlSet, "", XmlUrl.Priority.HIGH);
		create(xmlUrlSet, "/help", XmlUrl.Priority.MEDIUM);
		create(xmlUrlSet, "/contact", XmlUrl.Priority.MEDIUM);
		
		create(xmlUrlSet, "/pubs/top100World", XmlUrl.Priority.MEDIUM);
		
		create(xmlUrlSet, "/pubs/country/Brazil", XmlUrl.Priority.MEDIUM);
		create(xmlUrlSet, "/pubs/country/United%20States", XmlUrl.Priority.MEDIUM);
		create(xmlUrlSet, "/pubs/country/Argentina", XmlUrl.Priority.MEDIUM);
		create(xmlUrlSet, "/pubs/country/Ireland", XmlUrl.Priority.MEDIUM);
		create(xmlUrlSet, "/pubs/country/United%20Kingdom", XmlUrl.Priority.MEDIUM);
		create(xmlUrlSet, "/pubs/country/Germany", XmlUrl.Priority.MEDIUM);

		for (Pub pub : pubs) {
			create(xmlUrlSet, "/pubs/" + pub.getPubId(), XmlUrl.Priority.HIGH);
		}

		return xmlUrlSet;
	}
	
	private void create(XmlUrlSet xmlUrlSet, String link, XmlUrl.Priority priority) {
        xmlUrlSet.addUrl(new XmlUrl("http://www.pubanywhere.com" + link, priority));
    }
}
