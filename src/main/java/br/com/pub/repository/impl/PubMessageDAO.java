package br.com.pub.repository.impl;

import java.util.List;

import javax.persistence.NoResultException;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import br.com.pub.domain.PubMessages;
import br.com.pub.dto.TopUserDTO;
import br.com.pub.mapper.TopUserMapper;
import br.com.pub.repository.PubMessageRepository;

@Repository
public class PubMessageDAO extends AbstractDAO<PubMessages> implements PubMessageRepository {

	private static final Logger log = LoggerFactory.getLogger(PubMessageDAO.class);
	
	@Autowired private JdbcTemplate jdbcTemplate;
	
	@Transactional
	@SuppressWarnings("unchecked")
	public List<PubMessages> getPubReviewByPub(String pubId) {
		try {
			
			return super.em.createQuery("SELECT m FROM PubMessages m WHERE m.pub.pubId = :pubId")
					.setParameter("pubId", pubId)
					.getResultList();
			
		} catch (NoResultException e) {
			log.info("No review found for " + pubId);
			e.getMessage();
		}

		return null;
	}

	public List<TopUserDTO> getTopUsers() {
		return jdbcTemplate.query("select username as USERNAME, count(*) as QTDMSG from pubmessages group by username order by  qtdMsg desc limit 6", new TopUserMapper());
	}
}
