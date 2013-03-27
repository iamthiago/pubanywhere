package br.com.pub.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import br.com.pub.domain.Pub;
import br.com.pub.mail.EmailMessageCreator;
import br.com.pub.repository.PubRepository;
import br.com.pub.validation.PubValidations;

import com.googlecode.ehcache.annotations.TriggersRemove;

@Service
public class PubService {
	
	@Autowired private PubRepository pubRepository;
	
	private static Logger log = LoggerFactory.getLogger(PubService.class);
	
	@TriggersRemove(
			cacheName={
					"abstractFindCache",
					"listPubsByUsernameCache",
					"listPubsPerCountryCache",
					"listTop100WorldCache",
					"getPubReviewCache",
					"getPubReviewByUserCache"},
					removeAll=true)
	public String registerPub(Pub pub, HttpServletRequest request) {
		Pub newPub = pubRepository.insert(PubValidations.valid(pub));
		log.info("Pub: " + newPub.getName() + " inserido na base");
		
		if (pub.getFile() != null) {
			AmazonService.upload(pub.getFile(), pub.getPubId());
		}
		
		EmailMessageCreator.sendPubMail(pub, request);
		
		return newPub.getPubId();
	}
	
	public void activePub(String id) {
		Pub pub = pubRepository.find(id);
		pub.setEnabled(true);
		this.savePub(pub);
	}
	
	@TriggersRemove(
			cacheName={
					"abstractFindCache",
					"listPubsByUsernameCache",
					"listPubsPerCountryCache",
					"listTop100WorldCache",
					"getPubReviewCache",
					"getPubReviewByUserCache"},
					removeAll=true)
	public void savePub(Pub pub) {
		pubRepository.update(pub);
	}
		
	public Pub findPubById(String pubId) {
		return pubRepository.find(pubId);
	}
	
	public List<Pub> listNearPubs(Double lat, Double lng) {
		//TODO: listar somente pubs ativos
		log.info("Listando todos os pubs");
		return pubRepository.listAll();
	}
	
	public List<Pub> listAllPubs() {
		log.info("Listando todos os pubs");
		return pubRepository.listAll();
	}
	
	public List<Pub> listPubsByUsername(String username) {
		log.info("Listando pubs por usuario");
		return pubRepository.listPubsByUsername(username);
	}
	
	public List<Pub> listPubsPerCountry(String country) {
		log.info("Listando pubs por country " + country);
		return pubRepository.listPubsPerCountry(country);
	}
	
	public List<Pub> listTop100World(){
		log.info("Listando top 100 pubs no mundo");
		return pubRepository.listTop100World();
	}
	
	public void setPageCount(Pub pub) {
		pub.setPubViews(pub.getPubViews() + 1);
		this.savePub(pub);
	}
}