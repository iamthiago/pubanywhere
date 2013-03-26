package br.com.pub.domain;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.EnumType;
import javax.persistence.Enumerated;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;
import javax.persistence.UniqueConstraint;

import br.com.pub.enumeration.WishOrFavoriteType;

@Entity
@Table(uniqueConstraints = @UniqueConstraint(columnNames = {"PUB_ID", "USERNAME", "WISH_OR_FAVORITE"}))
public class PubWishOrFavorite implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 2277294526859095136L;
	
	@Id
	@GeneratedValue(strategy = GenerationType.TABLE)
	@Column(name = "PUB_FAVORITE_ID")
	private Long id;
	
	@ManyToOne
	@JoinColumn(name = "PUB_ID")
	private Pub pub;
	
	@ManyToOne
	@JoinColumn(name = "USERNAME")
	private Users users;
	
	@Column(name = "WISH_OR_FAVORITE")
	@Enumerated(EnumType.STRING)
	private WishOrFavoriteType type;

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public Pub getPub() {
		return pub;
	}

	public void setPub(Pub pub) {
		this.pub = pub;
	}

	public Users getUsers() {
		return users;
	}

	public void setUsers(Users users) {
		this.users = users;
	}

	public WishOrFavoriteType getType() {
		return type;
	}

	public void setType(WishOrFavoriteType type) {
		this.type = type;
	}
}
