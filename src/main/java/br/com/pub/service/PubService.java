package br.com.pub.service;

import static br.com.pub.constants.PUB_CONSTANTS.MODAL_MESSAGE;
import static br.com.pub.constants.PUB_CONSTANTS.MODAL_TITLE;

import java.util.LinkedList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataIntegrityViolationException;
import org.springframework.security.access.AccessDeniedException;
import org.springframework.stereotype.Service;
import org.springframework.validation.BindingResult;

import br.com.pub.domain.Pub;
import br.com.pub.mail.EmailMessageCreator;
import br.com.pub.repository.PubRepository;
import br.com.pub.utils.PubUtils;
import br.com.pub.utils.ResultMessage;
import br.com.pub.validation.PubValidations;

import com.googlecode.ehcache.annotations.Cacheable;
import com.googlecode.ehcache.annotations.TriggersRemove;

@Service
public class PubService {
	
	@Autowired private PubRepository pubRepository;
	@Autowired private MessageService message;
	
	private static Logger log = LoggerFactory.getLogger(PubService.class);
	
	@TriggersRemove(
			cacheName={
					"listPubsPerCountryCache",
					"listAllPubsPerCountryCache",
					"listTop100WorldCache"},
					removeAll=true)
	public List<ResultMessage> registerPub(Pub pub, HttpServletRequest request, BindingResult result) {
		
		List<ResultMessage> lista = new LinkedList<ResultMessage>();
		
		if (result.hasErrors()) {
			lista.add(new ResultMessage(MODAL_TITLE, message.getMessageFromResource(request, "config.error")));
			lista.add(new ResultMessage(MODAL_MESSAGE, message.getMessageFromResource(request, "config.error.fields")));
			
		} else {
			
			try {
				
				Pub newPub = pubRepository.insert(PubValidations.valid(pub));
				
				if (pub.getFile() != null) {
					AmazonService.upload(pub.getFile(), newPub.getPubId());
				}
				
				EmailMessageCreator.sendPubMail(pub, request);
				
				lista.add(new ResultMessage(MODAL_TITLE, message.getMessageFromResource(request, "config.success")));
				lista.add(new ResultMessage(MODAL_MESSAGE, message.getMessageFromResource(request, "config.success.pub.success", new Object[]{newPub.getPubId()})));
			
			} catch (DataIntegrityViolationException e) {
				lista.add(new ResultMessage(MODAL_TITLE, message.getMessageFromResource(request, "config.error")));
				lista.add(new ResultMessage(MODAL_MESSAGE, message.getMessageFromResource(request, "config.error.pubExists")));
			} catch (AccessDeniedException e) {
				lista.add(new ResultMessage(MODAL_TITLE, message.getMessageFromResource(request, "config.denied")));
				lista.add(new ResultMessage(MODAL_MESSAGE, message.getMessageFromResource(request, "config.error.pubdenied")));
			}
		}
		
		return lista;
		
	}
	
	public void activePub(String id) {
		Pub pub = pubRepository.find(id);
		pub.setEnabled(true);
		this.savePub(pub);
	}
	
	@TriggersRemove(
			cacheName={
					"listPubsPerCountryCache",
					"listAllPubsPerCountryCache",
					"listTop100WorldCache"},
					removeAll=true)
	public void savePub(Pub pub) {
		pubRepository.update(pub);
	}
		
	public Pub findPubById(String pubId) {
		return pubRepository.find(pubId);
	}
	
	@Cacheable(cacheName="listNearPubsCache")
	public List<Pub> listNearPubs(Double lat, Double lng) {
		//TODO: listar somente pubs ativos
		log.info("Listando todos os pubs");
		return pubRepository.listAll();
	}
	
	public List<Pub> listAllPubs() {
		log.info("Listando todos os pubs");
		return pubRepository.listAll();
	}
	
	public List<Pub> listTop6(){
		log.info("Listando top 6 pubs no mundo");
		return pubRepository.top6();
	}
	
	public List<Pub> listLast3() {
		log.info("Listando ultimos 3 pubs cadastrados");
		return pubRepository.last3();
	}
	
	public List<Pub> listPubsPerCountry(String country, int page) {
		log.info("Listando pubs por country " + country);
		return pubRepository.listPubsPerCountry(country, PubUtils.maxItemsPerPage(page, 5));
	}
	
	public List<Pub> listAllPubsPerCountry(String country) {
		log.info("Listando all pubs por country " + country);
		return pubRepository.listAllPubsPerCountry(country);
	}
	
	public List<Pub> listTop100World(int page){
		log.info("Listando top 100 pubs no mundo");
		return pubRepository.listTop100World(PubUtils.maxItemsPerPage(page, 5));
	}
	
	public int getTotalPubsPerCountry(String country) {
		return pubRepository.getTotalPubsPerCountry(country);
	}
}