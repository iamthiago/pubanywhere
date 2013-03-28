package br.com.pub.validation;

import java.math.BigDecimal;
import java.util.Date;
import java.util.List;

import org.apache.commons.lang.StringUtils;

import br.com.pub.domain.Pub;
import br.com.pub.service.PubUtils;

import com.google.code.geocoder.Geocoder;
import com.google.code.geocoder.GeocoderRequestBuilder;
import com.google.code.geocoder.model.GeocodeResponse;
import com.google.code.geocoder.model.GeocoderAddressComponent;
import com.google.code.geocoder.model.GeocoderRequest;
import com.google.code.geocoder.model.GeocoderResult;
import com.google.code.geocoder.model.GeocoderStatus;
import com.google.code.geocoder.model.LatLng;

public class PubValidations {

	public static Pub valid(Pub pub) {
		validWebSite(pub);
		pub.setEmail(pub.getEmail().toLowerCase().trim());
		
		pub.setDesde(new Date());
		pub.setEnabled(false);
		
		setGoogleLocation(pub);
		
		pub.setPubId(PubUtils.removeInvalidCharacters(pub.getName().toLowerCase().trim()));
		return pub;
	}

	private static void validWebSite(Pub pub) {
		pub.setWebsite(pub.getWebsite().toLowerCase().trim());
		pub.setFacebook(pub.getFacebook().toLowerCase().trim());
		pub.setTwitter(pub.getTwitter().toLowerCase().trim());
		
		if (!pub.getWebsite().contains("http://") && !pub.getWebsite().contains("https://")) {
			if (StringUtils.isNotEmpty(pub.getWebsite())) {
				pub.setWebsite("http://" + pub.getWebsite());
			}
		}
		
		if (!pub.getFacebook().contains("http://") && !pub.getFacebook().contains("https://")) {
			if (StringUtils.isNotEmpty(pub.getFacebook())) {
				pub.setFacebook("http://" + pub.getFacebook());
			}
		}
		
		if (!pub.getTwitter().contains("http://") && !pub.getTwitter().contains("https://")) {
			if (StringUtils.isNotEmpty(pub.getTwitter())) {
				pub.setTwitter("http://" + pub.getTwitter());
			}
		}		
	}
	
	private static void setGoogleLocation(Pub pub) {
		final Geocoder geocoder = new Geocoder();
		GeocoderRequest request = new GeocoderRequestBuilder()
				.setAddress(pub.getLocal())
				.setLocation(new LatLng(new BigDecimal(pub.getLat()), new BigDecimal(pub.getLng())))
				.setLanguage("en")
				.getGeocoderRequest();

		GeocodeResponse response = geocoder.geocode(request);
		if (response.getStatus().equals(GeocoderStatus.OK)) {
			List<GeocoderResult> results = response.getResults();
			for (GeocoderResult geoResult : results) {				
				List<GeocoderAddressComponent> addressComponents = geoResult.getAddressComponents();

				for (GeocoderAddressComponent address : addressComponents) {
					if (address.getTypes().contains("locality")) {
						pub.setCity(address.getLongName());
					}
					if (address.getTypes().contains("administrative_area_level_1")) {
						pub.setState(address.getLongName());
					}
					if (address.getTypes().contains("country")) {
						pub.setCountry(address.getLongName());
					}
				}
			}
		}
	}	
}
