package br.com.pub.mapper;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.jdbc.core.RowMapper;

import br.com.pub.dto.TopUserDTO;

public class TopUserMapper implements RowMapper<TopUserDTO> {

	public TopUserDTO mapRow(ResultSet rs, int rowNum) throws SQLException {
		TopUserDTO top = new TopUserDTO();
		top.setUsername(rs.getString("USERNAME"));
		top.setQtdMsg(rs.getInt("QTDMSG"));
		return top;
	}
}
