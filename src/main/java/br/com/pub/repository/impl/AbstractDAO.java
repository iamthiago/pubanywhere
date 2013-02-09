package br.com.pub.repository.impl;

import java.lang.reflect.ParameterizedType;
import java.lang.reflect.Type;
import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.googlecode.ehcache.annotations.Cacheable;

import br.com.pub.repository.AbstractRepository;

public abstract class AbstractDAO<T> implements AbstractRepository<T> {

	@PersistenceContext
	protected EntityManager em;
	
	private Class<T> clazz;
	
	@SuppressWarnings("unchecked")
	public AbstractDAO() {
		Type t = getClass().getGenericSuperclass();
		ParameterizedType pt = (ParameterizedType) t;
		clazz = (Class<T>) pt.getActualTypeArguments()[0];
	}
	
	@Transactional(propagation = Propagation.REQUIRES_NEW)
	public T insert(T t) {
		em.persist(t);
		return t;
	}

	@Transactional(propagation = Propagation.REQUIRED)
	public void delete(Object id) {
		em.remove(this.em.getReference(clazz, id));
	}
	
	@Cacheable(cacheName="abstractFind")
	@Transactional(propagation = Propagation.REQUIRED)
	public T find(Object id) {
		return em.find(clazz, id);
	}

	@Transactional(propagation = Propagation.REQUIRED)
	public T update(T t) {
		return em.merge(t);
	}
	
	@Cacheable(cacheName="abstractFindAll")
	@SuppressWarnings("unchecked")
	public List<T> listAll() {
		return em.createQuery("SELECT x FROM " + clazz.getSimpleName() + " x ").getResultList();
	}
}
