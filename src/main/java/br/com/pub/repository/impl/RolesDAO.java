package br.com.pub.repository.impl;

import org.springframework.stereotype.Repository;

import br.com.pub.domain.Authorities;
import br.com.pub.repository.RolesRepository;

@Repository
public class RolesDAO extends AbstractDAO<Authorities> implements RolesRepository {

}
