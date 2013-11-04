package com.pub.service;

import static com.pub.constants.PUB_CONSTANTS.MODAL_MESSAGE;
import static com.pub.constants.PUB_CONSTANTS.MODAL_TITLE;

import java.util.ArrayList;
import java.util.LinkedList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DuplicateKeyException;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.data.mongodb.core.MongoTemplate;
import org.springframework.data.mongodb.core.geo.Distance;
import org.springframework.data.mongodb.core.geo.GeoResult;
import org.springframework.data.mongodb.core.geo.GeoResults;
import org.springframework.data.mongodb.core.geo.Metrics;
import org.springframework.security.access.AccessDeniedException;
import org.springframework.stereotype.Service;
import org.springframework.validation.BindingResult;

import com.pub.enumeration.ContentTypeEnum;
import com.pub.enumeration.StaticImage;
import com.pub.mail.EmailMessageCreator;
import com.pub.mongo.domain.Pub;
import com.pub.repository.PubCustomMongoRepository;
import com.pub.repository.PubMongoRepository;
import com.pub.utils.PubUtils;
import com.pub.utils.ResultMessage;
import com.pub.validation.PubValidations;

@Service
public class PubMongoService {

	@Autowired private MessageService message;
	@Autowired private PubMongoRepository pubMongoRepository;
	@Autowired private PubCustomMongoRepository pubCustomMongoRepository;
	@Autowired private MongoTemplate mongoTemplate;
	
	public Pub findByPubId(String pubId) {
		return pubMongoRepository.findByPubId(pubId);
	}
	
	public List<Pub> findAll() {
		return pubMongoRepository.findAll();
	}
	
	public Page<Pub> findAll(Pageable pageable) {
		return pubMongoRepository.findAll(pageable);
	}
	
	public Page<Pub> findByCountry(String country, Pageable pageable) {
		return pubMongoRepository.findByCountry(country, pageable);
	}
	
	public Page<Pub> findLast3(Sort sort) {
		Pageable pageable = new PageRequest(0, 3, sort);
		return pubMongoRepository.findAll(pageable);
	}
	
	public List<Pub> findTopPubs(Sort sort) {
		Pageable pageable = new PageRequest(0, 6, sort);
		return pubMongoRepository.findAll(pageable).getContent();
	}
	
	public void activePub(String id) {
		Pub pub = pubMongoRepository.findByPubId(id);
		pub.setEnabled(true);
		pubMongoRepository.save(pub);
	}
	
	public List<Pub> findNearPubs(double lat, double lng) {
		List<Pub> returnList = new ArrayList<>();
		final GeoResults<Pub> geoResults = pubCustomMongoRepository.findByLatAndByLng(lat, lng, new Distance(5, Metrics.KILOMETERS));
		final List<GeoResult<Pub>> pubs = geoResults.getContent();
		for (GeoResult<Pub> geoResult : pubs) {
			returnList.add(geoResult.getContent());
		}
		return returnList;
	}
	
	public List<ResultMessage> registerPub(Pub pub, HttpServletRequest request, BindingResult result) {
		
		List<ResultMessage> lista = new LinkedList<ResultMessage>();
		
		if (result.hasErrors()) {
			lista.add(new ResultMessage(MODAL_TITLE, message.getMessageFromResource(request, "config.error")));
			lista.add(new ResultMessage(MODAL_MESSAGE, message.getMessageFromResource(request, "config.error.fields")));
			
		} else {
			
			try {
				
				Pub newPub = pubMongoRepository.save(PubValidations.valid(pub, true));
				
				PubUtils.uploadStaticImage(StaticImage.PUB, newPub.getPubId(), ContentTypeEnum.JPG);
				
				EmailMessageCreator.sendPubMail(pub, request);
				
				lista.add(new ResultMessage(MODAL_TITLE, message.getMessageFromResource(request, "config.success")));
				lista.add(new ResultMessage(MODAL_MESSAGE, message.getMessageFromResource(request, "config.success.pub.success", new Object[]{newPub.getPubId()})));
			
			} catch (DuplicateKeyException e) {
				lista.add(new ResultMessage(MODAL_TITLE, message.getMessageFromResource(request, "config.error")));
				lista.add(new ResultMessage(MODAL_MESSAGE, message.getMessageFromResource(request, "config.error.pubExists")));
			} catch (AccessDeniedException e) {
				lista.add(new ResultMessage(MODAL_TITLE, message.getMessageFromResource(request, "config.denied")));
				lista.add(new ResultMessage(MODAL_MESSAGE, message.getMessageFromResource(request, "config.error.pubdenied")));
			}
		}
		
		return lista;
	}
	
	public void registerPubSelenium(final List<Pub> listPubs) {
		try {
			pubMongoRepository.save(listPubs);
		} catch (Exception e) {
			List<Pub> repeatList = new ArrayList<Pub>();
			for (Pub pub : listPubs) {
				final Pub found = pubMongoRepository.findByPubId(pub.getPubId());
				if (found == null && pub.getLat() != null && pub.getLng() != null) {
					repeatList.add(pub);
				}
			}
			
			pubMongoRepository.save(repeatList);
		}
	}
}
