package com.pub.enumeration;

public enum Roles {
	
	ROLE_ADMIN(1, "ROLE_ADMIN"),
	ROLE_USER(2, "ROLE_USER");
	
	private final long codigo;
	private final String descricao;
	
	private Roles(long codigo, String descricao) {
		this.codigo = codigo;
		this.descricao = descricao;
	}
	
	public long getCodigo() {
		return codigo;
	}
	public String getDescricao() {
		return descricao;
	}
}
