package br.com.pub.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import br.com.pub.domain.RegisteredCountry;
import br.com.pub.repository.CountryRepository;
import br.com.pub.utils.PubUtils;

@Service
public class CountryService {
	
	@Autowired CountryRepository countryRepository;
	
	public List<RegisteredCountry> getRegisteredCountries(int page) {
		return countryRepository.listRegisteredCountry(PubUtils.maxItemsPerPage(page, 6));
	}

	public int getTotalCountries() {
		return countryRepository.getTotalCountries();
	}
}
