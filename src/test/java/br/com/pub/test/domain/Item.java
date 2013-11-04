package br.com.pub.test.domain;

import java.io.Serializable;

import org.bson.types.ObjectId;
import org.springframework.data.annotation.Id;
import org.springframework.data.mongodb.core.index.Indexed;

public class Item implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 3610623276582988503L;
	
	@Id
	private ObjectId id;
	
	@Indexed
	private String itemName;
	
	public Item(){}

	public Item(String itemName) {
		super();
		this.itemName = itemName;
	}

	public ObjectId getId() {
		return id;
	}

	public void setId(ObjectId id) {
		this.id = id;
	}

	public String getItemName() {
		return itemName;
	}

	public void setItemName(String itemName) {
		this.itemName = itemName;
	}

}
