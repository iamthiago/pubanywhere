package br.com.pub.mapper;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.jdbc.core.RowMapper;

import br.com.pub.domain.Pub;

public class PubMapper implements  RowMapper<Pub>{

	public Pub mapRow(ResultSet rs, int rowNum) throws SQLException {
		Pub pub = new Pub();
		pub.setNome(rs.getString("NOME"));
		pub.setLocal(rs.getString("LOCAL"));
		pub.setDescricao(rs.getString("DESCRICAO"));
		pub.setPhone(rs.getString("PHONE"));
		pub.setEmail(rs.getString("EMAIL"));
		pub.setWebsite(rs.getString("WEBSITE"));
		pub.setLat(rs.getDouble("LAT"));
		pub.setLng(rs.getDouble("LNG"));
		pub.setEnabled(rs.getBoolean("ENABLED"));
		return pub;
	}	
}
