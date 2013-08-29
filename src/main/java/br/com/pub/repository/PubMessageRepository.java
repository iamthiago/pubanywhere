package br.com.pub.repository;

import java.util.List;

import br.com.pub.domain.PubMessages;
import br.com.pub.dto.TopUserDTO;

public interface PubMessageRepository extends AbstractRepository<PubMessages> {
	
	List<PubMessages> getPubReviewByPub(String pubId);

	List<TopUserDTO> getTopUsers();
}
