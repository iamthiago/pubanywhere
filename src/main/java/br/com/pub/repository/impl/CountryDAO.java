package br.com.pub.repository.impl;

import java.math.BigInteger;
import java.util.List;

import javax.persistence.NoResultException;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import br.com.pub.domain.RegisteredCountry;
import br.com.pub.repository.CountryRepository;

@Repository
public class CountryDAO extends AbstractDAO<RegisteredCountry> implements CountryRepository {

	private static Logger log = LoggerFactory.getLogger(CountryDAO.class);
	
	@Transactional
	@SuppressWarnings("unchecked")
	public List<RegisteredCountry> listRegisteredCountry(int from) {
		try {
			
			return super.em.createNativeQuery("select * from registeredcountry", RegisteredCountry.class)
					.setFirstResult(from)
					.setMaxResults(6)
					.getResultList();
			
		} catch (NoResultException e) {
			log.info("No result found");
			e.getMessage();
		}
		return null;
	}
	
	public int getTotalCountries() {
		try {
			
			return ((BigInteger) super.em.createNativeQuery("select count(*) from registeredcountry")
					.getSingleResult()).intValue();
			
		} catch (NoResultException e) {
			log.info("No result found");
			e.getMessage();
		}
		
		return 0;
	}
}
