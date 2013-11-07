package com.pub.validation;

import java.util.Date;

import org.apache.commons.lang.StringUtils;

import com.pub.mongo.domain.Pub;
import com.pub.utils.GeocoderUtils;
import com.pub.utils.PubUtils;


public class PubValidations {

	public static Pub valid(Pub pub, boolean isLatLng) {
		
		if (!isLatLng) {
			pub.setDescricao("This pub has not any description yet! Contact us to provide more details.");
		}
		
		pub.setWebsite(validURL(pub.getWebsite()));
		pub.setFacebook(validURL(pub.getFacebook()));
		pub.setTwitter(validURL(pub.getTwitter()));
		
		pub.setEmail(validEmail(pub.getEmail()));
		
		pub.setDesde(new Date());
		pub.setEnabled(true);
		
		pub.setPubImages(1);
		
		GeocoderUtils.setGoogleLocation(pub, isLatLng);
		
		if (pub.getLat() != null && pub.getLng() != null) {
			pub.setLocation(new double[] {pub.getLng(), pub.getLat()});
		}
		
		pub.setPubId(PubUtils.retiraAcentoRegex(pub.getName().toLowerCase().trim()));
		return pub;
	}
	
	private static String validURL(String url) {
		if (!StringUtils.isEmpty(url)) {
			if (!url.contains("www.")) {
				url = "www." + url;
			}
			
			if (!url.contains("http://") && !url.contains("https://")) {
				url = "http://" + url;
			}
			
			url.toLowerCase().trim();
		}
		
		return url;
	}
	
	private static String validEmail(String email) {
		if (!StringUtils.isEmpty(email)) {
			return email.toLowerCase().trim();
		}
		return null;
	}
}
