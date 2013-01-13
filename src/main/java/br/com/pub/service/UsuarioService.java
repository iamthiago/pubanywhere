package br.com.pub.service;

import java.util.Calendar;
import java.util.GregorianCalendar;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import br.com.pub.domain.Authorities;
import br.com.pub.domain.Users;
import br.com.pub.domain.Usuario;
import br.com.pub.form.UserForm;
import br.com.pub.repository.RolesRepository;
import br.com.pub.repository.UserRepository;
import br.com.pub.repository.UsuarioRepository;

@Service
public class UsuarioService {

	private static final long USER_ROLE = 1L;

	@Autowired
	private UserRepository userRepository;
	
	@Autowired
	private UsuarioRepository usuarioRepository;
	
	@Autowired
	private RolesRepository rolesRepository;
	
	public void createNewUser(UserForm form) {
		Usuario usuario = new Usuario();
		usuario.setNome(form.getNome());
		usuario.setSobrenome(form.getSobrenome());
		
		if (form.getEmail().equals(form.getConfirmarEmail())) {
			usuario.setEmail(form.getEmail().toLowerCase());
		}
		
		usuario.setSexo(form.getSexo());
		
		Calendar cal = new GregorianCalendar(form.getYear(), form.getMonth(), form.getDay());
		usuario.setDataNascimento(cal.getTime());
		
		if (form.getSenha().equals(form.getConfirmarSenha())) {
			Users newUser = new Users();
			newUser.setUsername(form.getEmail().toLowerCase());
			newUser.setPassword(form.getSenha().toLowerCase());
			newUser.setEnabled(true);
			
			Authorities auth = rolesRepository.find(USER_ROLE);
			if (auth != null) {
				newUser.setAuthorities(auth);
				userRepository.insert(newUser);
				usuarioRepository.insert(usuario);
			}
		}
	}
}
