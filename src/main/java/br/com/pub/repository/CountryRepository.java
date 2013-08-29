package br.com.pub.repository;

import java.util.List;

import br.com.pub.domain.RegisteredCountry;

public interface CountryRepository extends AbstractRepository<RegisteredCountry> {
	
	List<RegisteredCountry> listRegisteredCountry(int from);

	int getTotalCountries();

}
