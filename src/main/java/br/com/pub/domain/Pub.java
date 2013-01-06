package br.com.pub.domain;

import java.io.Serializable;
import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import javax.persistence.Transient;

import org.hibernate.validator.constraints.Email;
import org.hibernate.validator.constraints.Length;
import org.hibernate.validator.constraints.NotEmpty;
import org.springframework.web.multipart.commons.CommonsMultipartFile;

import br.com.pub.annotation.MaxSizeUpload;

@Entity
public class Pub implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = -2798520271567297643L;
	
	@Id
	@Column(name = "PUB_ID", insertable = true, updatable = false)
	private String pubId;
	
	@NotEmpty
	@Column(name = "NOME")
	private String nome;
	
	@NotEmpty
	@Column(name = "LOCAL")
	private String local;
	
	@NotEmpty
	@Length(max = 2000)
	@Column(name = "DESCRICAO", length = 2000)
	private String descricao;
	
	@Column(name = "PHONE")
	private String phone;
	
	@Email
	@Column(name = "EMAIL")
	private String email;
	
	@Column(name = "WEBSITE")
	private String website;
	
	@Column(name = "FACEBOOK")
	private String facebook;
	
	@Column(name = "TWITTER")
	private String twitter;
	
	@Temporal(TemporalType.TIMESTAMP)
	@Column(name = "DESDE")
	private Date desde;

	@Column(name = "LAT", precision = 15, scale = 20)
	private Double lat;
	
	@Column(name = "LNG", precision = 15, scale = 20)
	private Double lng;
	
	@Column(name = "ENABLED")
	private boolean enabled;
	
	@Transient
	@MaxSizeUpload
	private CommonsMultipartFile file;
	
	@Column(name = "PUBVIEWS")
	private long pubViews;
	
	@Column(name = "PUBRATING")
	private long pubRating;

	public String getPubId() {
		return pubId;
	}

	public void setPubId(String pubId) {
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

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
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

	public String getFacebook() {
		return facebook;
	}

	public void setFacebook(String facebook) {
		this.facebook = facebook;
	}

	public String getTwitter() {
		return twitter;
	}

	public void setTwitter(String twitter) {
		this.twitter = twitter;
	}

	public Date getDesde() {
		return desde;
	}

	public void setDesde(Date desde) {
		this.desde = desde;
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

	public CommonsMultipartFile getFile() {
		return file;
	}

	public void setFile(CommonsMultipartFile file) {
		this.file = file;
	}

	public long getPubViews() {
		return pubViews;
	}

	public void setPubViews(long pubViews) {
		this.pubViews = pubViews;
	}

	public long getPubRating() {
		return pubRating;
	}

	public void setPubRating(long pubRating) {
		this.pubRating = pubRating;
	}
}
