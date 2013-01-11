package br.com.pub.service;

import org.jets3t.service.S3Service;
import org.jets3t.service.acl.AccessControlList;
import org.jets3t.service.acl.GroupGrantee;
import org.jets3t.service.acl.Permission;
import org.jets3t.service.impl.rest.httpclient.RestS3Service;
import org.jets3t.service.model.S3Bucket;
import org.jets3t.service.model.S3Object;
import org.jets3t.service.security.AWSCredentials;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.multipart.commons.CommonsMultipartFile;

import br.com.pub.domain.Pub;

public class AmazonService {
	
	private static final Logger log = LoggerFactory.getLogger(AmazonService.class);
	
	private static final String AWSACCESSKEY = "AKIAJJKOUNSDRGGPCVCQ";
	private static final String AWSSECRETKEY = "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";
	private static final AWSCredentials AWSCREDENTIALS = new AWSCredentials(AWSACCESSKEY, AWSSECRETKEY);
	private static S3Service s3Service;
	private static S3Bucket pubanywhere;
	
	public static String upload(Pub pub) {
		
		CommonsMultipartFile image = pub.getFile();
		
		try {
			
			s3Service = new RestS3Service(AWSCREDENTIALS);
			AccessControlList bucketAcl = s3Service.getBucketAcl("pubanywhere");
			bucketAcl.grantPermission(GroupGrantee.ALL_USERS, Permission.PERMISSION_READ);
			pubanywhere = s3Service.getBucket("pubanywhere");
			
			if (pubanywhere != null) {
				S3Object object = new S3Object(pub.getPubId(), image.getBytes());
				object.setContentLength(image.getSize());
				object.setContentType(image.getContentType());
				object.setAcl(bucketAcl);
				s3Service.putObject(pubanywhere, object);
				log.info("Upload da imagem do pub: " + pub.getName() + " feita na amazon");
			}
			
		} catch (Exception e) {
			log.error("Problemas ao fazer upload da imagem!", e.getMessage());
		}
		
		return null;
	}
}
