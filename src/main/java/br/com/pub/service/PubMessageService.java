package br.com.pub.service;

import static br.com.pub.constants.PUB_CONSTANTS.MODAL_MESSAGE;
import static br.com.pub.constants.PUB_CONSTANTS.MODAL_TITLE;

import java.util.Date;
import java.util.LinkedList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import br.com.pub.domain.Pub;
import br.com.pub.domain.PubMessages;
import br.com.pub.domain.Users;
import br.com.pub.form.MessageForm;
import br.com.pub.repository.PubMessageRepository;
import br.com.pub.repository.PubRepository;
import br.com.pub.repository.UserRepository;
import br.com.pub.utils.PubUtils;
import br.com.pub.utils.ResultMessage;

import com.googlecode.ehcache.annotations.TriggersRemove;

@Service
public class PubMessageService {

	@Autowired private PubRepository pubRepository;
	@Autowired private PubMessageRepository pubMessageRepository;
	@Autowired private MessageService message;
	@Autowired private UserRepository userRepository;
	
	@TriggersRemove(
			cacheName={
					"listPubsPerCountryCache",
					"listAllPubsPerCountryCache",
					"listTop100WorldCache"},
					removeAll=true)
	public List<ResultMessage> registerReview(MessageForm messageForm, HttpServletRequest request, Users userSession) {
		
		List<ResultMessage> lista = new LinkedList<ResultMessage>();
		
		if (userSession == null) {
			lista.add(new ResultMessage(MODAL_TITLE, message.getMessageFromResource(request, "config.info")));
			lista.add(new ResultMessage(MODAL_MESSAGE, "Log into Facebook to rate!"));
			return lista;
		}
		
		final List<PubMessages> existReview = getPubReviewByPub(messageForm.getPubId());
		for (PubMessages pubMessages : existReview) {
			if (pubMessages.getUsers().getUsername().equals(userSession.getUsername())) {
				lista.add(new ResultMessage(MODAL_TITLE, message.getMessageFromResource(request, "config.info")));
				lista.add(new ResultMessage(MODAL_MESSAGE, "Pub already voted!"));
				return lista;
			}
		}
		
		Pub pubFound = pubRepository.find(messageForm.getPubId());
		if (pubFound != null) {
			
			pubFound.setPubCountRating(pubFound.getPubCountRating() + 1);
			pubFound.setPubValueRating(pubFound.getPubValueRating() + messageForm.getRating());
			pubFound.setPubTotalRating(pubFound.getPubValueRating() / pubFound.getPubCountRating());
			
			userSession.setReviews(userSession.getReviews() + 1);
			userSession.setRank(PubUtils.setRank(userSession.getReviews()));
			
			PubMessages messages = new PubMessages();
			messages.setMessageRating(messageForm.getRating());
			messages.setPub(pubFound);
			messages.setUsers(userSession);
			messages.setCreated(new Date());
			
			userRepository.update(userSession);
			pubRepository.update(pubFound);
			pubMessageRepository.insert(messages);
		}
		
		return null;
	}
	
	public List<PubMessages> getPubReviewByPub(String pubId) {
		return pubMessageRepository.getPubReviewByPub(pubId);
	}
}