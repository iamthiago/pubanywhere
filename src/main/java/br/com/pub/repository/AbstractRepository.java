package br.com.pub.repository;

import java.util.List;


public interface AbstractRepository<T> {
	
	T insert(T t);
	
	void delete(Object id);
	
	T find(Object id);
	
	T update(T t);

	List<T> listAll();
}
