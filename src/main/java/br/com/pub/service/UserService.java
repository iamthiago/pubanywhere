package br.com.pub.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import br.com.pub.domain.Users;
import br.com.pub.repository.UserRepository;

@Service
public class UserService {
	
	@Autowired
	private UserRepository userRepository;
	
	public void InserirUser(Users users) {
		userRepository.insert(users);
	}
}
