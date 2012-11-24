package br.com.pub.controller;

import java.util.ArrayList;
import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import br.com.pub.form.PubForm;

@Controller
public class TesteController {
	
	@RequestMapping(value = "maps")
	public String maps() {
		return "maps";
	}
	
	@RequestMapping(value = "registerPub")
	public String pubs() {
		return "registerPub";
	}
	
	@ResponseBody
	@RequestMapping(value = "praias", method = RequestMethod.GET)
	public List<PubForm> praias() {
		
		List<PubForm> pubs = new ArrayList<PubForm>();
		
		PubForm pub1 = new PubForm();
		pub1.setNome("Bondi Beach");
		pub1.setLat(-33.890542);
		pub1.setLng(151.274856);
		
		PubForm pub2 = new PubForm();
		pub2.setNome("Coogee Beach");
		pub2.setLat(-33.923036);
		pub2.setLng(151.259052);
		
		PubForm pub3 = new PubForm();
		pub3.setNome("Cronulla Beach");
		pub3.setLat(-34.028249);
		pub3.setLng(151.157507);
		
		PubForm pub4 = new PubForm();
		pub4.setNome("Manly Beach");
		pub4.setLat(-33.80010128657071);
		pub4.setLng(151.28747820854187);
		
		PubForm pub5 = new PubForm();
		pub5.setNome("Maroubra Beach");
		pub5.setLat(-33.950198);
		pub5.setLng(151.259302);
		
		pubs.add(pub1);
		pubs.add(pub2);
		pubs.add(pub3);
		pubs.add(pub4);
		pubs.add(pub5);
		
		return pubs;
	}
}
