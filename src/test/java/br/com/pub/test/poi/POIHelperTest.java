package br.com.pub.test.poi;

import java.util.LinkedList;
import java.util.List;

import com.pub.mongo.domain.Pub;
import com.pub.utils.POIHelper;


public class POIHelperTest {
	
	public static void main(String[] args) {
		
		List<Pub> list = new LinkedList<Pub>();
		
		for (int i = 1; i < 3; i++) {
			Pub pub = new Pub();
			pub.setName("Thiago Pub - " + i);
			pub.setLocal("30 St Kevins Road");
			pub.setCity("Galway");
			pub.setCountry("Ireland");
			pub.setLat(1.5);
			pub.setLng(-1.5);
			pub.setPubId("thiagopub" + i);
			list.add(pub);
		}
		
		POIHelper.exportListToXls(Pub.class, list, "D:/pubs_selenium.xls");
	}

}
