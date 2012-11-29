package br.com.pub.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import br.com.pub.domain.Pub;
import br.com.pub.repository.PubRepository;

@Service
public class PubService {
	
	@Autowired private PubRepository pubRepository;
	
	public List<Pub> listNearPubs(Double lat, Double lng) {
		return pubRepository.listAll();
	}
	
	public void registerPub(Pub pub) {
		pubRepository.insert(pub);
	}
}
