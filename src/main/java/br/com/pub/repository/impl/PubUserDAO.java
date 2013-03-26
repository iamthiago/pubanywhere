package br.com.pub.repository.impl;

import org.springframework.stereotype.Repository;

import br.com.pub.domain.PubUser;
import br.com.pub.repository.PubUserRepository;

@Repository
public class PubUserDAO extends AbstractDAO<PubUser> implements PubUserRepository {

}
