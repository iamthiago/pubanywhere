package br.com.pub.repository;

import java.util.List;

import br.com.pub.domain.Pub;

public interface PubRepository extends AbstractRepository<Pub> {
	
	public List<Pub> listPubsByUsername(String username);

	public List<Pub> listPubsPerCountry(String country);
	
	public List<Pub> listTop100World();
	
	public List<Pub> top6();
	
	
	/*MOBILE*/
	public List<Pub> listTop10Mobile();

}
