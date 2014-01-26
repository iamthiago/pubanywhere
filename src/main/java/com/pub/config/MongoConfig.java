package com.pub.config;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.PropertySource;
import org.springframework.core.env.Environment;
import org.springframework.data.authentication.UserCredentials;
import org.springframework.data.mongodb.MongoDbFactory;
import org.springframework.data.mongodb.core.MongoTemplate;
import org.springframework.data.mongodb.core.SimpleMongoDbFactory;
import org.springframework.data.mongodb.repository.config.EnableMongoRepositories;

import com.mongodb.Mongo;
import com.mongodb.MongoURI;

@Configuration
@EnableMongoRepositories(basePackages="com.pub.repository")
@PropertySource({"classpath:config.properties"})
public class MongoConfig {
	
	@Autowired Environment env;
	
	@Bean
	public MongoURI mongoURI() throws Exception {
		return new MongoURI(env.getProperty("dbUrl"));
	}
	
	@Bean
	public MongoDbFactory mongoDbFactory() throws Exception {
		UserCredentials userCredentials = new UserCredentials(env.getProperty("dbUser"), env.getProperty("dbPassword"));
		return new SimpleMongoDbFactory(new Mongo(mongoURI()), "pubanywhere", userCredentials);
	}
	
    @Bean
    public MongoTemplate mongoTemplate() throws Exception {
    	return new MongoTemplate(mongoDbFactory());
    }
}