package br.com.pub.service;

import java.math.BigDecimal;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.lang.StringUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import br.com.pub.domain.Pub;
import br.com.pub.enumeration.Country;
import br.com.pub.form.ContactForm;
import br.com.pub.mail.EmailUtils;
import br.com.pub.repository.PubRepository;

import com.google.code.geocoder.Geocoder;
import com.google.code.geocoder.GeocoderRequestBuilder;
import com.google.code.geocoder.model.GeocodeResponse;
import com.google.code.geocoder.model.GeocoderAddressComponent;
import com.google.code.geocoder.model.GeocoderRequest;
import com.google.code.geocoder.model.GeocoderResult;
import com.google.code.geocoder.model.GeocoderStatus;
import com.google.code.geocoder.model.LatLng;

@Service
public class PubService {
	
	@Autowired private PubRepository pubRepository;
	
	private static Logger log = LoggerFactory.getLogger(PubService.class);
	
	public List<Pub> listNearPubs(Double lat, Double lng) {
		//TODO: listar somente pubs ativos
		log.info("Listando todos os pubs");
		return pubRepository.listAll();
	}
	
	public String registerPub(Pub pub, HttpServletRequest request) {
		
		Pub newPub = pubRepository.insert(valid(pub));
		log.info("Pub: " + newPub.getName() + " inserido na base");
		
		if (!newPub.getFile().isEmpty()) {
			AmazonService.upload(newPub);
		}
		
		//TODO: fazer envio de email asynchronous para não demorar a redirecionar para a pagina de detalhes do pub
		sendMailToActive(newPub, request);
		sendMarketMail(newPub, request);
		
		return newPub.getPubId();
	}
	
	private Pub valid(Pub pub) {
		
		validWebSite(pub);
		pub.setEmail(pub.getEmail().toLowerCase().trim());
		pub.setFacebook(pub.getFacebook().toLowerCase().trim());
		pub.setTwitter(pub.getTwitter().toLowerCase().trim());
		
		pub.setDesde(new Date());
		pub.setEnabled(false);
		
		setGoogleLocation(pub);
		
		pub.setPubId(pub.getPubId().toLowerCase().trim());
		return pub;
	}

	private void validWebSite(Pub pub) {
		pub.setWebsite(pub.getWebsite().toLowerCase().trim());
		if (!pub.getWebsite().contains("http://") && !pub.getWebsite().contains("https://")) {
			if (StringUtils.isNotEmpty(pub.getWebsite())) {
				pub.setWebsite("http://" + pub.getWebsite());
			}
		}
	}
	
	private void setGoogleLocation(Pub pub) {
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

	private void sendMailToActive(Pub pub, HttpServletRequest request) {
		ContactForm form = new ContactForm();
		form.setEmail("pubanywhere@gmail.com");
		form.setSubject("Register " + pub.getName());
		form.setDescription(
				"Pub: " + pub.getName() + "<br/>" +
				"Location: " + pub.getLocal() + "<br/>" +
				"Description: " + pub.getDescricao() + "<br/><br/>" +
				"<a href="+ EmailUtils.createURL(request, pub.getPubId()) + ">" + EmailUtils.createURL(request, pub.getPubId()) +"</a>");
		
		EmailUtils.sendMail(form, request);
		log.info("enviando email para ativação do pub: " + pub.getName());
	}
	
	private void sendMarketMail(Pub pub, HttpServletRequest request) {
		if (pub.getEmail() != null) {
			ContactForm form = new ContactForm();
			form.setEmail("pubanywhere@gmail.com");
			form.setTo(pub.getEmail());
			form.setDescription(getMessageMarket(pub, form));
			EmailUtils.sendMail(form, request);
			log.info("Enviado email marketing do pub: " + pub.getName());
		}
	}
	
	private String getMessageMarket(Pub pub, ContactForm form) {
		StringBuilder msg = new StringBuilder();
		if (pub.getCountry().equals(Country.BRAZIL.getDescricao())) {
			form.setSubject("Bem vindo ao Pub Anywhere!");
			msg.append("<div style='font-weight: bold; font-size: 14px;'><h2>Bem vindo ao Pub Anywhere!</h2><br><br>Você recebeu este email por alguns motivos:<br><br>- Nós cadastramos seu bar/pub em nossa base de dados<br>- Você se cadastrou em nosso site<br>- Alguém que gosta do seu bar/pub, o cadastrou<br><br><br>Pub Anywhere é um site global de bares e pubs, com o intuito de ajudar as pessoas a encontrarem um local aproximado de onde estão para apreciar uma bela cerveja.<br><br>Entenda melhor em: www.pubanywhere.com<br><br>De forma totalmente gratuita, além do cadastro e visualização no mapa, você conta também com uma página dedicada ao seu bar/pub. Abuse disso, divulgue para os amigos, compartilhe no facebook e twitter, ganhe o mundo!<br><br>www.pubanywhere.com/pubs/" + pub.getPubId() + "<br><br><br><br>Obrigado<br>Thiago - Fundador</div>");
		} else {
			form.setSubject("Welcome to Pub Anywhere!");
			msg.append("<div style='font-weight: bold; font-size: 14px;'><h2>Welcome to Pub Anywhere!</h2><br><br>You have received this mail for some reasons:<br><br>- We registered your bar/pub in our data base<br>- You have registered in our website<br>- Someone who like your bar/pub, registered it<br><br><br>Pub Anywhere is a bars/pubs global website, aiming for help people to find the nearest place of where they are to enjoy a beer.<br><br>Understand better in: www.pubanywhere.com<br><br>Completely free, beyond the registration and map visualization, you also has a dedicated page. Abuse it, share with your friends, share on facebook and twitter, get the world!<br><br>www.pubanywhere.com/pubs/" + pub.getPubId() + "<br><br><br><br>Best Regards,<br>Thiago - Founder</div>");
		}
		return msg.toString();
	}

	public void activePub(String id) {
		Pub pub = pubRepository.find(id);
		pub.setEnabled(true);
		pubRepository.update(pub);
	}
	
	public Pub findPubById(String pubId) {
		return pubRepository.find(pubId);
	}

	public void setPageCount(Pub pub) {
		pub.setPubViews(pub.getPubViews() + 1);
		pubRepository.update(pub);
	}
}