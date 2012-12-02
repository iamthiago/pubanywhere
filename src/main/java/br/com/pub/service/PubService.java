package br.com.pub.service;

import java.util.List;

import javax.mail.internet.AddressException;
import javax.mail.internet.InternetAddress;
import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import br.com.pub.domain.Pub;
import br.com.pub.mail.EmailSender;
import br.com.pub.repository.PubRepository;

@Service
public class PubService {
	
	private static Logger log = LoggerFactory.getLogger(PubService.class);
	
	@Autowired private PubRepository pubRepository;
	
	public List<Pub> listNearPubs(Double lat, Double lng) {
		//TODO: listar somente pubs ativos
		return pubRepository.listAll();
	}
	
	public void registerPub(Pub pub, HttpServletRequest request) {
		if (pub.getLat() != null || pub.getLng() != null) {
			
			try {
				pubRepository.insert(valid(pub));
			} catch (AddressException e) {
				e.printStackTrace();
			}
			
			EmailSender.sendMail(pub, request);
			
		} else {
			log.error("Lat or Lng null");
		}
	}
	
	public void activePub(Long id) {
		Pub pub = pubRepository.find(id);		
		pub.setEnabled(true);
		pubRepository.update(pub);
	}

	private Pub valid(Pub pub) throws AddressException {
		pub.getNome().toUpperCase();
		pub.getEmail().toLowerCase();
		
		validEmail(pub.getEmail());
		validWebSite(pub);
		
		pub.setEnabled(false);
		return pub;
	}

	private void validEmail(String email) throws AddressException {
		try {
			InternetAddress mail = new InternetAddress(email);
			mail.validate();
		} catch (AddressException e) {
			log.error(e.getMessage());
			throw new AddressException();
		}
	}

	private void validWebSite(Pub pub) {
		pub.getWebsite().toLowerCase();
		if (!pub.getWebsite().contains("http://")) {
			pub.setWebsite("http://" + pub.getWebsite());
		}
	}
	
	
}
