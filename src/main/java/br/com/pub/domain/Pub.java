package br.com.pub.domain;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

import org.hibernate.validator.constraints.Email;
import org.hibernate.validator.constraints.NotEmpty;
import org.springframework.format.annotation.NumberFormat;
import org.springframework.format.annotation.NumberFormat.Style;

@Entity
public class Pub implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = -2798520271567297643L;
	
	@Id
	@GeneratedValue(strategy = GenerationType.TABLE)
	@Column(name = "PUB_ID", insertable = true, updatable = false)
	private Long pubId;
	
	@NotEmpty
	@Column(name = "NOME")
	private String nome;
	
	@NotEmpty
	@Column(name = "LOCAL")
	private String local;
	
	@NotEmpty
	@Column(name = "DESCRICAO")
	private String descricao;
	
	@NumberFormat(style = Style.NUMBER)
	@Column(name = "PHONE")
	private Integer phone;
	
	@Email
	@Column(name = "EMAIL")
	private String email;
	
	@Column(name = "WEBSITE")
	private String website;
	
	@Column(name = "LAT", precision = 15, scale = 20)
	private Double lat;
	
	@Column(name = "LNG", precision = 15, scale = 20)
	private Double lng;
	
	@Column(name = "ENABLED")
	private boolean enabled;

	public Long getPubId() {
		return pubId;
	}

	public void setPubId(Long pubId) {
		this.pubId = pubId;
	}

	public String getNome() {
		return nome;
	}

	public void setNome(String nome) {
		this.nome = nome;
	}

	public String getLocal() {
		return local;
	}

	public void setLocal(String local) {
		this.local = local;
	}

	public String getDescricao() {
		return descricao;
	}

	public void setDescricao(String descricao) {
		this.descricao = descricao;
	}

	public Integer getPhone() {
		return phone;
	}

	public void setPhone(Integer phone) {
		this.phone = phone;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getWebsite() {
		return website;
	}

	public void setWebsite(String website) {
		this.website = website;
	}

	public Double getLat() {
		return lat;
	}

	public void setLat(Double lat) {
		this.lat = lat;
	}

	public Double getLng() {
		return lng;
	}

	public void setLng(Double lng) {
		this.lng = lng;
	}

	public boolean isEnabled() {
		return enabled;
	}

	public void setEnabled(boolean enabled) {
		this.enabled = enabled;
	}
}
