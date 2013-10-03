package com.pub.enumeration;

public enum Month {
	
	//meses de acordo com o Calendar
	
	JAN(0, "JAN"),
	FEV(1, "FEV"),
	MAR(2, "MAR"),
	ABR(3, "ABR"),
	MAY(4, "MAY"),
	JUN(5, "JUN"),
	JUL(6, "JUL"),
	AGO(7, "AGO"),
	SET(8, "SET"),
	OUT(9, "OUT"),
	NOV(10, "NOV"),
	DEZ(11, "DEZ");
	
	private final int codigo;
	private final String descricao;
	
	private Month (int codigo, String descricao) {
		this.codigo = codigo;
		this.descricao = descricao;
	}
	
	public int getCodigo() {
		return codigo;
	}

	public String getDescricao() {
		return descricao;
	}
}
