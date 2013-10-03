package com.pub.repository;

import org.springframework.data.mongodb.repository.MongoRepository;

import com.pub.mongo.domain.Authorities;

public interface RolesMongoRepository extends MongoRepository<Authorities, Long> {
	
	public Authorities findByAuthoritiesId(Long authoritiesId);

}
