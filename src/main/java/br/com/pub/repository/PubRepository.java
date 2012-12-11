package br.com.pub.repository;

import java.util.List;

import br.com.pub.domain.Pub;

public interface PubRepository extends AbstractRepository<Pub> {
	
	public List<Pub> listaPubsJdbc();

}
