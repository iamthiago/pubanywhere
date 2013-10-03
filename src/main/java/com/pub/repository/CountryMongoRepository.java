package com.pub.repository;

import org.springframework.data.mongodb.repository.MongoRepository;

import com.pub.mongo.domain.RegisteredCountry;


public interface CountryMongoRepository extends MongoRepository<RegisteredCountry, String> {

}
