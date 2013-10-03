package com.pub.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

import com.pub.mongo.domain.RegisteredCountry;
import com.pub.repository.CountryMongoRepository;


@Service
public class CountryMongoService {
	
	@Autowired CountryMongoRepository countryMongoRepository;
	
	public Page<RegisteredCountry> findAll(Pageable pageable) {
		return countryMongoRepository.findAll(pageable);
	}
}
