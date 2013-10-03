package com.pub.repository;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.mongodb.repository.MongoRepository;

import com.pub.mongo.domain.Pub;

public interface PubMongoRepository extends MongoRepository<Pub, String> {
	
	public Pub findByPubId(String pubId);
	
	public Page<Pub> findByCountry(String country, Pageable pageable);
	
}
