package com.pub.repository;

import org.springframework.data.mongodb.repository.MongoRepository;

import com.pub.mongo.domain.Users;

public interface UserMongoRepository extends MongoRepository<Users, String>{
	
	public Users findByUsername(String username);
}
