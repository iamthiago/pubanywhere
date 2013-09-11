package br.com.pub.validation;

import java.math.BigDecimal;
import java.util.Date;
import java.util.List;

import org.apache.commons.lang.StringUtils;

import br.com.pub.domain.Pub;
import br.com.pub.utils.PubUtils;

import com.google.code.geocoder.Geocoder;
import com.google.code.geocoder.GeocoderRequestBuilder;
import com.google.code.geocoder.model.GeocodeResponse;
import com.google.code.geocoder.model.GeocoderAddressComponent;
import com.google.code.geocoder.model.GeocoderRequest;
import com.google.code.geocoder.model.GeocoderResult;
import com.google.code.geocoder.model.GeocoderStatus;
import com.google.code.geocoder.model.LatLng;

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
		pub.setEnabled(false);
		
		setGoogleLocation(pub, isLatLng);
		
		pub.setPubId(PubUtils.retiraAcentoRegex(pub.getName().toLowerCase().trim()));
		return pub;
	}
	
	private static String validURL(String url) {
		String newUrl = null;
		if (!StringUtils.isEmpty(url)) {
			if (!url.contains("http://") && !url.contains("https://")) {
				newUrl = "http://" + url;
				return newUrl.toLowerCase().trim();
			}
		}
		return newUrl;
	}
	
	private static String validEmail(String email) {
		if (!StringUtils.isEmpty(email)) {
			return email.toLowerCase().trim();
		}
		return null;
	}
	
	private static void setGoogleLocation(Pub pub, boolean isLatLng) {
		final Geocoder geocoder = new Geocoder();
		if (isLatLng) {
			getGeoByLatLng(pub, geocoder);
		} else {
			getGeoByAddress(pub, geocoder);
		}
	}

	public static void getGeoByLatLng(Pub pub, final Geocoder geocoder) {
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
	
	public static void getGeoByAddress(Pub pub, final Geocoder geocoder) {
		GeocoderRequest request = new GeocoderRequestBuilder()
				.setAddress(pub.getLocal())
				.setLanguage("en")
				.getGeocoderRequest();

		GeocodeResponse response = geocoder.geocode(request);
		if (response.getStatus().equals(GeocoderStatus.OK)) {
			List<GeocoderResult> results = response.getResults();
			for (GeocoderResult geoResult : results) {
				
				BigDecimal lat = geoResult.getGeometry().getLocation().getLat();
				BigDecimal lng = geoResult.getGeometry().getLocation().getLng();
				
				pub.setLat(lat.doubleValue());
				pub.setLng(lng.doubleValue());
				
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
