package br.com.pub.service;

import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.googlecode.ehcache.annotations.TriggersRemove;

import br.com.pub.domain.Pub;
import br.com.pub.domain.PubMessages;
import br.com.pub.domain.Users;
import br.com.pub.form.MessageForm;
import br.com.pub.repository.PubMessageRepository;
import br.com.pub.repository.PubRepository;

@Service
public class PubMessageService {

	@Autowired private PubRepository pubRepository;
	@Autowired private PubMessageRepository pubMessageRepository;
	
	@TriggersRemove(
			cacheName={
					"abstractFindCache",
					"listPubsByUsernameCache",
					"listPubsPerCountryCache",
					"listTop100WorldCache",
					"getPubReviewCache",
					"getPubReviewByUserCache"},
					removeAll=true)
	public boolean registerReview(MessageForm messageForm, Users userSession) {
		Pub pubFound = pubRepository.find(messageForm.getPubId());
		if (pubFound != null) {
			
			pubFound.setPubCountRating(pubFound.getPubCountRating() + 1);
			pubFound.setPubValueRating(pubFound.getPubValueRating() + messageForm.getRating());
			pubFound.setPubTotalRating(pubFound.getPubValueRating() / pubFound.getPubCountRating());
			
			PubMessages messages = new PubMessages();
			messages.setMessageRating(messageForm.getRating());
			messages.setPub(pubFound);
			messages.setUsers(userSession);
			messages.setMessageReview(messageForm.getMessage());
			messages.setCreated(new Date());
			
			pubRepository.update(pubFound);
			pubMessageRepository.insert(messages);
			
			return true;
		} else {
			return false;
		}
	}
	
	public List<PubMessages> getPubReviewByPub(String pubId) {
		return pubMessageRepository.getPubReviewByPub(pubId);
	}
	
	public List<PubMessages> getPubReviewByUser(String username) {
		return pubMessageRepository.getPubReviewByUser(username);
	}
}