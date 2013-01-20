package br.com.pub.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import br.com.pub.domain.Pub;
import br.com.pub.repository.PubRepository;

@Service
public class PubService {
	
	@Autowired private PubRepository pubRepository;
	
	private static Logger log = LoggerFactory.getLogger(PubService.class);
	
	public String registerPub(Pub pub, HttpServletRequest request) {
		Pub newPub = pubRepository.insert(pub);
		log.info("Pub: " + newPub.getName() + " inserido na base");		
		return newPub.getPubId();
	}

	public void activePub(String id) {
		Pub pub = pubRepository.find(id);
		pub.setEnabled(true);
		pubRepository.update(pub);
	}
	
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
	
	public void setPageCount(Pub pub) {
		pub.setPubViews(pub.getPubViews() + 1);
		pubRepository.update(pub);
	}
}