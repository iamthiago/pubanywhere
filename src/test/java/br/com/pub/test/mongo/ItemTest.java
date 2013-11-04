package br.com.pub.test.mongo;

import static org.junit.Assert.*;

import org.junit.After;
import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.mongodb.core.MongoTemplate;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import br.com.pub.test.domain.Item;

import com.pub.config.MongoConfig;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(classes = { MongoConfig.class })
public class ItemTest {

	@Autowired MongoTemplate mongoTemplate;

	@Before
	public void setup() throws Exception {
		mongoTemplate.dropCollection(Item.class);
	}

	@Test
	public void insertItemIntoNewCollection() throws Exception {
		assertEquals(0, mongoTemplate.getCollection("item").count());
		Item item = new Item("item 1");
		mongoTemplate.save(item);
		assertEquals(1, mongoTemplate.getCollection("item").count());
	}
	
	@After
	public void teardown() {
		mongoTemplate.dropCollection(Item.class);
	}
}
