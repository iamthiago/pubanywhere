package com.pub.repository;

import java.util.List;

import com.pub.mongo.domain.Users;

public interface UserCustomMongoRepository {
	
	public List<Users> findTopUsers();

}
