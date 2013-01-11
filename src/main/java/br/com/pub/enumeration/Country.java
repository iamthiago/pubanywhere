package br.com.pub.enumeration;

public enum Country {
	BRAZIL("Brazil");
	
	private String descricao;

	private Country(String descricao) {
		this.descricao = descricao;
	}

	public String getDescricao() {
		return descricao;
	}

	public void setDescricao(String descricao) {
		this.descricao = descricao;
	}
}
