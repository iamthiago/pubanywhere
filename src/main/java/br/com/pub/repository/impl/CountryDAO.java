package br.com.pub.repository.impl;

import org.springframework.stereotype.Repository;

import br.com.pub.domain.RegisteredCountry;
import br.com.pub.repository.CountryRepository;

@Repository
public class CountryDAO extends AbstractDAO<RegisteredCountry> implements CountryRepository {

	
}
