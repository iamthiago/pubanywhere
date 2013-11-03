package br.com.pub.test.mongo;

import java.lang.reflect.InvocationTargetException;
import java.net.UnknownHostException;
import java.util.List;

import org.springframework.context.annotation.AnnotationConfigApplicationContext;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.support.AbstractApplicationContext;
import org.springframework.data.mongodb.core.MongoTemplate;
import org.springframework.data.mongodb.core.query.Criteria;
import org.springframework.data.mongodb.core.query.Query;
import org.springframework.data.mongodb.core.query.Update;
import org.springframework.data.mongodb.repository.config.EnableMongoRepositories;

import com.mongodb.Mongo;
import com.mongodb.WriteConcern;
import com.pub.mongo.domain.FacebookUser;
import com.pub.mongo.domain.Messages;
import com.pub.mongo.domain.Pub;
import com.pub.mongo.domain.RegisteredCountry;
import com.pub.mongo.domain.Users;
import com.pub.repository.CountryMongoRepository;
import com.pub.repository.PubMongoRepository;

@Configuration
@EnableMongoRepositories(basePackages="com.pub.repository")
public class MongoTesteConfig {
	
	@Bean
    public static Mongo mongo() throws UnknownHostException {
        return new Mongo("localhost");
    }

    @Bean
    public static MongoTemplate mongoTemplate(Mongo mongo) {
        MongoTemplate mongoTemplate = new MongoTemplate(mongo, "pubanywhere-mongo");
        mongoTemplate.setWriteConcern(WriteConcern.SAFE);
        return mongoTemplate;
    }
    
    public static void main(String[] args) throws UnknownHostException, IllegalAccessException, InvocationTargetException {
		AbstractApplicationContext ctx = new AnnotationConfigApplicationContext(MongoTesteConfig.class);
		MongoTemplate mongoTemplate = mongoTemplate(mongo());
		deleteAllCollections(mongoTemplate);
		addCountries(ctx);
		
		ctx.close();
	}
    
    public static void deleteAllCollections(MongoTemplate mongoTemplate) throws UnknownHostException {
		mongoTemplate.dropCollection(FacebookUser.class);
		mongoTemplate.dropCollection(Messages.class);
		mongoTemplate.dropCollection(Pub.class);
		mongoTemplate.dropCollection(RegisteredCountry.class);
		mongoTemplate.dropCollection(Users.class);
	}

	public static void addLocationToPub(AbstractApplicationContext ctx, MongoTemplate mongoTemplate) {
		PubMongoRepository pubMongoRepository = ctx.getBean(PubMongoRepository.class);
		final List<Pub> list = pubMongoRepository.findAll();
		for (Pub pub : list) {
			Update update = new Update();
			update.set("location", new double [] {pub.getLat(), pub.getLng()});
			mongoTemplate.updateFirst(new Query(Criteria.where("pubId").is(pub.getPubId())), update, Pub.class);
			System.out.println("updated: " + pub.getPubId());
		}
	}
	
	public static void addCountries(AbstractApplicationContext ctx) {
		CountryMongoRepository countryMongoRepository = ctx.getBean(CountryMongoRepository.class);
		RegisteredCountry country1 = new RegisteredCountry();
		country1.setImgName("united_states.jpg");
		country1.setName("United States");
		country1.setSpringCode("country.unitedstates");
		
		RegisteredCountry country2 = new RegisteredCountry();
		country2.setImgName("ireland.jpg");
		country2.setName("Ireland");
		country2.setSpringCode("country.ireland");
		
		RegisteredCountry country3 = new RegisteredCountry();
		country3.setImgName("germany.jpg");
		country3.setName("Germany");
		country3.setSpringCode("country.germany");
		
		RegisteredCountry country4 = new RegisteredCountry();
		country4.setImgName("england.jpg");
		country4.setName("United Kingdom");
		country4.setSpringCode("country.unitedkingdom");
		
		RegisteredCountry country5 = new RegisteredCountry();
		country5.setImgName("praga.jpg");
		country5.setName("Czech Republic");
		country5.setSpringCode("country.czechrepublic");
		
		RegisteredCountry country6 = new RegisteredCountry();
		country6.setImgName("brazil.jpg");
		country6.setName("Brazil");
		country6.setSpringCode("country.brazil");
		
		RegisteredCountry country7 = new RegisteredCountry();
		country7.setImgName("argentina.jpg");
		country7.setName("Argentina");
		country7.setSpringCode("country.argentina");
		
		RegisteredCountry country8 = new RegisteredCountry();
		country8.setImgName("netherlands.jpg");
		country8.setName("The Netherlands");
		country8.setSpringCode("country.thenetherlands");
		
		countryMongoRepository.save(country1);
		countryMongoRepository.save(country2);
		countryMongoRepository.save(country3);
		countryMongoRepository.save(country4);
		countryMongoRepository.save(country5);
		countryMongoRepository.save(country6);
		countryMongoRepository.save(country7);
		countryMongoRepository.save(country8);
	}
}
