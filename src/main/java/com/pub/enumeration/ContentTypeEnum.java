package com.pub.enumeration;

public enum ContentTypeEnum {
	
	GIF("image/gif"),
	JPG("image/jpeg"),
	PNG("image/png"),
	
	XLS("APPLICATION/VND.MS-EXCEL"),
	WORD("application/msword"),
	
	PDF("application/pdf");
	
	private String descricao;
	
	private ContentTypeEnum(String descricao) {
		this.descricao = descricao;
	}

	public String getDescricao() {
		return descricao;
	}
}
