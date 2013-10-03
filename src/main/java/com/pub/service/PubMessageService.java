package com.pub.service;

import static com.pub.constants.PUB_CONSTANTS.MODAL_MESSAGE;
import static com.pub.constants.PUB_CONSTANTS.MODAL_TITLE;

import java.util.Arrays;
import java.util.Date;
import java.util.LinkedList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.mongodb.core.MongoOperations;
import org.springframework.stereotype.Service;

import com.pub.form.MessageForm;
import com.pub.mongo.domain.Messages;
import com.pub.mongo.domain.Pub;
import com.pub.mongo.domain.Users;
import com.pub.repository.PubMongoRepository;
import com.pub.repository.UserMongoRepository;
import com.pub.utils.PubUtils;
import com.pub.utils.ResultMessage;


@Service
public class PubMessageService {

	@Autowired private MessageService message;
	@Autowired private MongoOperations mongoOperations;
	@Autowired private PubMongoRepository pubMongoRepository;
	@Autowired private UserMongoRepository userMongoRepository;
	
	public List<ResultMessage> registerReview(MessageForm messageForm, HttpServletRequest request, Users userSession) {
		
		List<ResultMessage> lista = new LinkedList<ResultMessage>();
		
		if (userSession == null) {
			lista.add(new ResultMessage(MODAL_TITLE, message.getMessageFromResource(request, "config.info")));
			lista.add(new ResultMessage(MODAL_MESSAGE, "Log into Facebook to rate!"));
			return lista;
		}
		
		final Pub pubFound = pubMongoRepository.findByPubId(messageForm.getPubId());
		
		if (pubFound != null) {
			
			if (pubFound.getMessages() != null) {
				for (Messages pubMessages : pubFound.getMessages()) {
					if (pubMessages.getUser().getUsername().equals(userSession.getUsername())) {
						lista.add(new ResultMessage(MODAL_TITLE, message.getMessageFromResource(request, "config.info")));
						lista.add(new ResultMessage(MODAL_MESSAGE, message.getMessageFromResource(request, "config.error.voted")));
						return lista;
					}
				}
			}
			
			pubFound.setPubCountRating(pubFound.getPubCountRating() + 1);
			pubFound.setPubValueRating(pubFound.getPubValueRating() + messageForm.getRating());
			pubFound.setPubTotalRating(pubFound.getPubValueRating() / pubFound.getPubCountRating());
			pubFound.setRating((pubFound.getPubCountRating() * pubFound.getPubTotalRating()) / 5);
			
			userSession.setReviews(userSession.getReviews() + 1);
			userSession.setRank(PubUtils.setRank(userSession.getReviews()));
			
			Messages messages = new Messages();
			messages.setMessageRating(messageForm.getRating());
			messages.setUser(userSession);
			messages.setCreated(new Date());
			
			pubFound.setMessages(Arrays.asList(messages));
			
			mongoOperations.save(messages);
			pubMongoRepository.save(pubFound);
			userMongoRepository.save(userSession);
		}
		
		lista.add(new ResultMessage(MODAL_TITLE, message.getMessageFromResource(request, "config.success")));
		lista.add(new ResultMessage(MODAL_MESSAGE, message.getMessageFromResource(request, "config.success.voted")));
		return lista;
	}
}