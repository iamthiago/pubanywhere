package com.pub.repository.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.mongodb.core.MongoTemplate;
import org.springframework.data.mongodb.core.geo.Distance;
import org.springframework.data.mongodb.core.geo.GeoResults;
import org.springframework.data.mongodb.core.geo.Point;
import org.springframework.data.mongodb.core.query.NearQuery;
import org.springframework.stereotype.Repository;

import com.pub.mongo.domain.Pub;
import com.pub.repository.PubCustomMongoRepository;

@Repository
public class PubCustomMongoDAO implements PubCustomMongoRepository {

	@Autowired MongoTemplate mongoTemplate;
	
	@Override
	public GeoResults<Pub> findByLatAndByLng(double lat, double lng, Distance distance) {
		Point location = new Point(lat, lng);
		NearQuery query = NearQuery.near(location).maxDistance(distance);
		return mongoTemplate.geoNear(query, Pub.class);
	}
}
