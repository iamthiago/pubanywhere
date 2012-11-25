package br.com.pub.repository.impl;

import org.springframework.stereotype.Repository;

import br.com.pub.domain.Pub;
import br.com.pub.repository.PubRepository;

@Repository
public class PubDAO extends AbstractDAO<Pub> implements PubRepository {

}
