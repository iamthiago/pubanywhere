package br.com.pub.test.geocoder;

import java.math.BigDecimal;
import java.util.List;

import com.google.code.geocoder.Geocoder;
import com.google.code.geocoder.GeocoderRequestBuilder;
import com.google.code.geocoder.model.GeocodeResponse;
import com.google.code.geocoder.model.GeocoderAddressComponent;
import com.google.code.geocoder.model.GeocoderRequest;
import com.google.code.geocoder.model.GeocoderResult;
import com.google.code.geocoder.model.GeocoderStatus;

public class GoogleGeocoder {
	
	public static void main(String[] args) {
		
		final Geocoder geocoder = new Geocoder();

		GeocoderRequest request = new GeocoderRequestBuilder()
				.setAddress(
						"Alameda Rio Negro, 500, Barueri")
				.setLanguage("en").getGeocoderRequest();

		GeocodeResponse response = geocoder.geocode(request);

		if (response.getStatus().equals(GeocoderStatus.OK)) {
			List<GeocoderResult> results = response.getResults();
			for (GeocoderResult geoResult : results) {
				System.out.println(geoResult.getFormattedAddress());

				BigDecimal lat = geoResult.getGeometry().getLocation().getLat();
				BigDecimal lng = geoResult.getGeometry().getLocation().getLng();

				System.out.println("lat: " + lat);
				System.out.println("lng: " + lng);

				List<GeocoderAddressComponent> addressComponents = geoResult.getAddressComponents();
				for (GeocoderAddressComponent address : addressComponents) {
					if (address.getTypes().contains("locality")) {
						System.out.println("Cidade: " + address.getLongName());
					}
					if (address.getTypes().contains("administrative_area_level_1")) {
						System.out.println("Estado: " + address.getLongName());
					}
					if (address.getTypes().contains("country")) {
						System.out.println("País: " + address.getLongName());
					}
				}
			}
		}
	}
}
