package br.com.pub.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import br.com.pub.domain.Pub;
import br.com.pub.service.PubService;
import br.com.pub.sitemap.XmlUrl;
import br.com.pub.sitemap.XmlUrlSet;

@Controller
public class SitemapController {
	
	@Autowired
	private PubService pubService;
	
	@ResponseBody
	@RequestMapping(value = "/sitemap.xml", method = RequestMethod.GET, produces = "application/xml")
	public XmlUrlSet getSiteMap() {
		
		List<Pub> pubs = pubService.listAllPubs();

		XmlUrlSet xmlUrlSet = new XmlUrlSet();
		create(xmlUrlSet, "", XmlUrl.Priority.HIGH);
		create(xmlUrlSet, "/login", XmlUrl.Priority.MEDIUM);
		create(xmlUrlSet, "/help", XmlUrl.Priority.MEDIUM);
		create(xmlUrlSet, "/contact", XmlUrl.Priority.MEDIUM);
		
		create(xmlUrlSet, "/pubs/top100World", XmlUrl.Priority.MEDIUM);
		
		create(xmlUrlSet, "/pubs/country/Brazil", XmlUrl.Priority.MEDIUM);
		create(xmlUrlSet, "/pubs/country/United%20States", XmlUrl.Priority.MEDIUM);
		create(xmlUrlSet, "/pubs/country/Argentina", XmlUrl.Priority.MEDIUM);

		for (Pub pub : pubs) {
			create(xmlUrlSet, "/pubs/" + pub.getPubId(), XmlUrl.Priority.HIGH);
		}

		return xmlUrlSet;
	}
	
	private void create(XmlUrlSet xmlUrlSet, String link, XmlUrl.Priority priority) {
        xmlUrlSet.addUrl(new XmlUrl("http://www.pubanywhere.com" + link, priority));
    }
}
