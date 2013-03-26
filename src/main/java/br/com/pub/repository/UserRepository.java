package br.com.pub.repository;

import br.com.pub.domain.Users;

public interface UserRepository extends AbstractRepository<Users> {
	
	Users findUserByUsername(String username);
	
	Users findUserByEmailHash(String name);
}
