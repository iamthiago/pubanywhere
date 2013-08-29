package br.com.pub.repository;

import java.util.List;

import br.com.pub.domain.Pub;

public interface PubRepository extends AbstractRepository<Pub> {
	
	public List<Pub> listPubsPerCountry(String country, int from);
	
	public List<Pub> listAllPubsPerCountry(String country);
	
	public List<Pub> listTop100World(int from);
	
	public List<Pub> top6();

	public List<Pub> last3();

	public int getTotalPubsPerCountry(String country);
	
	public Pub registerPub(Pub pub);

}
