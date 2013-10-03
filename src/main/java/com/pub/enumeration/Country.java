package com.pub.enumeration;

public enum Country {
	BRAZIL("Brazil"),
	BRASIL("Brasil");
	
	private final String descricao;

	private Country(String descricao) {
		this.descricao = descricao;
	}

	public String getDescricao() {
		return descricao;
	}
}
