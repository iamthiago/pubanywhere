package com.pub.repository;

import org.springframework.data.mongodb.core.geo.Distance;
import org.springframework.data.mongodb.core.geo.GeoResults;

import com.pub.mongo.domain.Pub;

public interface PubCustomMongoRepository {
	
	public GeoResults<Pub> findByLatAndByLng(double lat, double lng, Distance distance);

}
