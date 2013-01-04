package br.com.pub.service;

import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.lang.StringUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import br.com.pub.domain.Pub;
import br.com.pub.form.ContactForm;
import br.com.pub.mail.EmailUtils;
import br.com.pub.repository.PubRepository;

@Service
public class PubService {
	
	private static Logger log = LoggerFactory.getLogger(PubService.class);
	
	@Autowired private PubRepository pubRepository;
	
	public List<Pub> listNearPubs(Double lat, Double lng) {
		//TODO: listar somente pubs ativos
		return pubRepository.listAll();
	}
	
	public Long registerPub(Pub pub, HttpServletRequest request) {
		
		if (!pub.getFile().isEmpty()) {
			AmazonService.upload(pub);
		}
		
		Pub newPub = pubRepository.insert(valid(pub));
		//TODO: fazer envio de email asynchronous para não demorar a redirecionar para a pagina de detalhes do pub
		sendMail(pub, request);
		
		return newPub.getPubId();
	}
	
	private Pub valid(Pub pub) {
		pub.setEmail(pub.getEmail().toLowerCase());
		pub.setFacebook(pub.getFacebook().toLowerCase());
		pub.setTwitter(pub.getTwitter().toLowerCase());
		
		validWebSite(pub);
		
		pub.setDesde(new Date());
		pub.setEnabled(false);
		
		pub.setImageName(PubUtils.replaceSpaceByUnderline(pub.getNome()).toLowerCase());
		return pub;
	}

	private void validWebSite(Pub pub) {
		pub.setWebsite(pub.getWebsite().toLowerCase());
		if (!pub.getWebsite().contains("http://") && !pub.getWebsite().contains("https://")) {
			if (StringUtils.isNotEmpty(pub.getWebsite())) {
				pub.setWebsite("http://" + pub.getWebsite());
			}
		}
	}

	private void sendMail(Pub pub, HttpServletRequest request) {
		ContactForm form = new ContactForm();
		form.setName("Pub to Register");
		form.setEmail("pubanywhere@gmail.com");
		form.setSubject("Register " + pub.getNome());
		form.setDescription(
				"<br/><br/>" +
				"Pub: " + pub.getNome() + "<br/>" +
				"Location: " + pub.getLocal() + "<br/>" +
				"Description: " + pub.getDescricao() + "<br/><br/>" +
				"<a href="+ EmailUtils.createURL(request, pub.getPubId()) + ">" + EmailUtils.createURL(request, pub.getPubId()) +"</a>");
		
		EmailUtils.sendMail(form, request);
	}
	
	public void activePub(Long id) {
		Pub pub = pubRepository.find(id);		
		pub.setEnabled(true);
		pubRepository.update(pub);
	}
	
	public Pub findPubById(Long pubId) {
		return pubRepository.find(pubId);		
	}
}
