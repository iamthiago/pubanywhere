package br.com.pub.repository.impl;

import org.springframework.stereotype.Repository;

import br.com.pub.domain.Users;
import br.com.pub.repository.UserRepository;

@Repository
public class UserDAO extends AbstractDAO<Users> implements UserRepository {

}
