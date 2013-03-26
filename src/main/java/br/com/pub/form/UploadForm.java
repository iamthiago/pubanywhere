package br.com.pub.form;

import java.io.Serializable;

import org.springframework.web.multipart.commons.CommonsMultipartFile;

import br.com.pub.annotation.MaxSizeUpload;

public class UploadForm implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = -6795260943774137339L;
	
	@MaxSizeUpload
	private CommonsMultipartFile file;

	public CommonsMultipartFile getFile() {
		return file;
	}

	public void setFile(CommonsMultipartFile file) {
		this.file = file;
	}
}