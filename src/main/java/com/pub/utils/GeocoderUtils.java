package com.pub.utils;

import java.math.BigDecimal;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.google.code.geocoder.Geocoder;
import com.google.code.geocoder.GeocoderRequestBuilder;
import com.google.code.geocoder.model.GeocodeResponse;
import com.google.code.geocoder.model.GeocoderAddressComponent;
import com.google.code.geocoder.model.GeocoderRequest;
import com.google.code.geocoder.model.GeocoderResult;
import com.google.code.geocoder.model.GeocoderStatus;
import com.google.code.geocoder.model.LatLng;
import com.javadocmd.simplelatlng.LatLngTool;
import com.javadocmd.simplelatlng.util.LengthUnit;
import com.pub.mongo.domain.Pub;

public class GeocoderUtils {
	
	private static Logger log = LoggerFactory.getLogger(GeocoderUtils.class);
	
	public static void setGoogleLocation(Pub pub, boolean isLatLng) {
		final Geocoder geocoder = new Geocoder();
		if (isLatLng) {
			getGeoByPubLatLng(pub, geocoder);
		} else {
			getGeoByPubAddress(pub, geocoder);
		}
	}
	
	private static void getGeoByPubLatLng(Pub pub, final Geocoder geocoder) {
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
		} else {
			log.info(response.getStatus().name());
		}
	}
	
	private static void getGeoByPubAddress(Pub pub, final Geocoder geocoder) {
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
		} else {
			log.info(response.getStatus().name());
		}
	}
	
	public static Map<String, String> getGeoByLatLng(Double lat, Double lng) {
		
		Map<String, String> map = new HashMap<String, String>();
		
		final Geocoder geocoder = new Geocoder();
		GeocoderRequest request = new GeocoderRequestBuilder()
				.setLocation(new LatLng(new BigDecimal(lat), new BigDecimal(lng)))
				.setLanguage("en")
				.getGeocoderRequest();

		GeocodeResponse response = geocoder.geocode(request);
		if (response.getStatus().equals(GeocoderStatus.OK)) {
			List<GeocoderResult> results = response.getResults();
			for (GeocoderResult geoResult : results) {
				
				List<GeocoderAddressComponent> addressComponents = geoResult.getAddressComponents();

				for (GeocoderAddressComponent address : addressComponents) {
					if (address.getTypes().contains("locality")) {
						map.put("CITY", address.getLongName());
					}
					if (address.getTypes().contains("administrative_area_level_1")) {
						map.put("STATE", address.getLongName());
					}
					if (address.getTypes().contains("country")) {
						map.put("COUNTRY", address.getLongName());
					}
				}
			}
		} else {
			log.info(response.getStatus().name());
		}
		
		return map;
	}
	
	public static Double calculateDistance(com.javadocmd.simplelatlng.LatLng point1, com.javadocmd.simplelatlng.LatLng point2) {
		return LatLngTool.distance(point1, point2, LengthUnit.KILOMETER);
	}
}
