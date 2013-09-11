package br.com.pub.repository.impl;

import java.math.BigInteger;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.List;

import javax.persistence.NoResultException;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.BatchPreparedStatementSetter;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import br.com.pub.domain.Pub;
import br.com.pub.repository.PubRepository;

@Repository
public class PubDAO extends AbstractDAO<Pub> implements PubRepository {

	private static final Logger log = LoggerFactory.getLogger(PubDAO.class);
	
	@Autowired private JdbcTemplate jdbcTemplate;
	
	@SuppressWarnings("unchecked")
	@Transactional
	public List<Pub> listPubsPerCountry(String country, int from) {
		try {
			
			return super.em.createNativeQuery("select *, ((pub_count_rating * pub_total_rating) / 5) as new_rating from pub where country = :country order by new_rating desc", Pub.class)
					.setParameter("country", country)
					.setFirstResult(from)
					.setMaxResults(5)
					.getResultList();
			
		} catch (NoResultException e) {
			log.info("No pub found!");
			e.getMessage();
		}
		return null;
	}
	
	@SuppressWarnings("unchecked")
	@Transactional
	public List<Pub> listAllPubsPerCountry(String country) {
		try {
			
			return super.em.createNativeQuery("select *, ((pub_count_rating * pub_total_rating) / 5) as new_rating from pub where country = :country order by new_rating desc", Pub.class)
					.setParameter("country", country)
					.getResultList();
			
		} catch (NoResultException e) {
			log.info("No pub found!");
			e.getMessage();
		}
		return null;
	}

	@SuppressWarnings("unchecked")
	@Transactional
	public List<Pub> listTop100World(int from) {
		try {
			
			return super.em.createNativeQuery("select *, ((pub_count_rating * pub_total_rating) / 5) as new_rating from pub order by new_rating desc", Pub.class)
					.setFirstResult(from)
					.setMaxResults(5)
					.getResultList();
			
		} catch (NoResultException e) {
			log.info("No pub found!");
			e.getMessage();
		}
		return null;
	}
	
	@SuppressWarnings("unchecked")
	@Transactional
	public List<Pub> top6() {
		try {
			
			return super.em.createNativeQuery("select *, ((pub_count_rating * pub_total_rating) / 5) as new_rating from pub order by new_rating desc", Pub.class)
					.setMaxResults(6)
					.getResultList();
			
		} catch (NoResultException e) {
			log.info("No pub found!");
			e.getMessage();
		}
		return null;
	}

	@SuppressWarnings("unchecked")
	@Transactional
	public List<Pub> last3() {
		try {
			
			return super.em.createNativeQuery("select * from pub order by desde desc", Pub.class)
					.setMaxResults(3)
					.getResultList();
			
		} catch (NoResultException e) {
			log.info("No pub found!");
			e.getMessage();
		}
		return null;
	}

	@Transactional
	public int getTotalPubsPerCountry(String country) {
		try {
			
			return ((BigInteger) super.em.createNativeQuery("select count(*) from pub where country = :country")
					.setParameter("country", country)
					.getSingleResult()).intValue();
					
		} catch (NoResultException e) {
			log.info("No pub found!");
			e.getMessage();
		}
		return 0;
	}

	@Transactional
	public void registerListPub(final List<Pub> pubs) {
		
		String sql = "INSERT INTO pub(" +
				            " pub_id, name, local, city, state, country, descricao," + 
				            " lat, lng, phone, website, desde, email, enabled, " +
				            " pub_count_rating, pub_value_rating, pub_total_rating, pubviews )" +
				    " VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
		
		
		jdbcTemplate.batchUpdate(sql, new BatchPreparedStatementSetter() {
			
			@Override
			public void setValues(PreparedStatement ps, int i) throws SQLException {
				Pub pub = pubs.get(i);
				ps.setString(1, pub.getPubId());
				ps.setString(2, pub.getName());
				ps.setString(3, pub.getLocal());
				ps.setString(4, pub.getCity());
				ps.setString(5, pub.getState());
				ps.setString(6, pub.getCountry());
				ps.setString(7, pub.getDescricao());
				ps.setDouble(8, pub.getLat());
				ps.setDouble(9, pub.getLng());
				ps.setString(10, pub.getPhone());
				ps.setString(11, pub.getWebsite());
				ps.setDate(12, new Date(pub.getDesde().getTime()));
				ps.setString(13, pub.getEmail());
				ps.setBoolean(14, pub.isEnabled());
				ps.setInt(15, 0);
				ps.setDouble(16, 0);
				ps.setDouble(17, 0);
				ps.setLong(18, 0);
			}
			
			@Override
			public int getBatchSize() {
				return pubs.size();
			}
		});
	}	
}
