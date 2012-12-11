package br.com.pub.repository.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import br.com.pub.domain.Pub;
import br.com.pub.mapper.PubMapper;
import br.com.pub.repository.PubRepository;

@Repository
public class PubDAO extends AbstractDAO<Pub> implements PubRepository {

	@Autowired
	private JdbcTemplate jdbcTemplate;
	
	public List<Pub> listaPubsJdbc() {
		StringBuilder sql = new StringBuilder();
		sql.append("SELECT * FROM PUB");
		return jdbcTemplate.query(sql.toString(), new PubMapper());
	}
}
