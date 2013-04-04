package br.com.pub.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import br.com.pub.domain.RegisteredCountry;
import br.com.pub.repository.CountryRepository;

@Service
public class CountryService {
	
	@Autowired CountryRepository countryRepository;
	
	public List<RegisteredCountry> getRegisteredCountries() {
		return countryRepository.listAll();
	}
}
