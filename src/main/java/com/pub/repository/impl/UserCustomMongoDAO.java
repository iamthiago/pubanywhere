package com.pub.repository.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Sort;
import org.springframework.data.mongodb.core.MongoTemplate;
import org.springframework.data.mongodb.core.query.Criteria;
import org.springframework.data.mongodb.core.query.Query;
import org.springframework.stereotype.Repository;

import com.pub.mongo.domain.Users;
import com.pub.repository.UserCustomMongoRepository;

@Repository
public class UserCustomMongoDAO implements UserCustomMongoRepository {

	@Autowired private MongoTemplate mongoTemplate;
	
	@Override
	public List<Users> findTopUsers() {
		Query query = new Query();
		query.addCriteria(Criteria.where("reviews").gt(0));
		query.with(new Sort(Sort.Direction.DESC, "reviews"));
		return mongoTemplate.find(query, Users.class);
	}
}
