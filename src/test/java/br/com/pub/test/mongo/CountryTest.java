package br.com.pub.test.mongo;

import static org.junit.Assert.*;

import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.mongodb.core.MongoTemplate;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.pub.config.MongoConfig;
import com.pub.mongo.domain.RegisteredCountry;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(classes = {MongoConfig.class})
public class CountryTest {
	
	@Autowired MongoTemplate mongoTemplate;
	
	@Before
	public void setup() throws Exception {
		assertTrue(mongoTemplate.collectionExists(RegisteredCountry.class));
	}
	
	@Test
	public void insertRegisteredCountries() throws Exception {
		long count = mongoTemplate.getCollection("").count();
		if (count == 0) {
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
			
			mongoTemplate.save(country1);
			mongoTemplate.save(country2);
			mongoTemplate.save(country3);
			mongoTemplate.save(country4);
			mongoTemplate.save(country5);
			mongoTemplate.save(country6);
			mongoTemplate.save(country7);
			mongoTemplate.save(country8);
		}
		
		assertEquals(8, mongoTemplate.getCollection("registeredCountry").count());
		
	}

}
