package br.com.pub.service;

import java.io.File;

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

public class AmazonService {
	
	private static final Logger log = LoggerFactory.getLogger(AmazonService.class);
	
	private static final String AWSACCESSKEY = "AKIAJJKOUNSDRGGPCVCQ";
	private static final String AWSSECRETKEY = "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";
	private static final AWSCredentials AWSCREDENTIALS = new AWSCredentials(AWSACCESSKEY, AWSSECRETKEY);
	private static S3Service s3Service;
	private static S3Bucket pubanywhere;
	
	public static String upload(CommonsMultipartFile image, String fileName) {
		
		try {
			
			s3Service = new RestS3Service(AWSCREDENTIALS);
			AccessControlList bucketAcl = s3Service.getBucketAcl("pubanywhere");
			bucketAcl.grantPermission(GroupGrantee.ALL_USERS, Permission.PERMISSION_READ);
			pubanywhere = s3Service.getBucket("pubanywhere");
			
			if (pubanywhere != null) {
				S3Object object = new S3Object(fileName, image.getBytes());
				object.setContentLength(image.getSize());
				object.setContentType(image.getContentType());
				object.setAcl(bucketAcl);
				s3Service.putObject(pubanywhere, object);
			}
			
		} catch (Exception e) {
			log.error("Error uploading image: " + fileName, e.getMessage());
		}
		
		log.info("Uploading image: " + fileName + " on amazon");
		
		return null;
	}
	
	public static String uploadStaticFile(File file, String fileName) {
		
		try {
			
			s3Service = new RestS3Service(AWSCREDENTIALS);
			AccessControlList bucketAcl = s3Service.getBucketAcl("pubanywhere");
			bucketAcl.grantPermission(GroupGrantee.ALL_USERS, Permission.PERMISSION_READ);
			pubanywhere = s3Service.getBucket("pubanywhere");
			
			if (pubanywhere != null) {
				S3Object object = new S3Object(pubanywhere, file);
				object.setContentLength(file.length());
				object.setContentType("image/gif");
				object.setName(fileName);
				object.setAcl(bucketAcl);
				
				if (!s3Service.isObjectInBucket("pubanywhere", object.getName())) {
					s3Service.putObject(pubanywhere, object);
					log.info("Uploading image: " + fileName + " on amazon");
				}
			}
			
		} catch (Exception e) {
			log.error("Error uploading image: " + fileName, e.getMessage());
		}
		
		return null;
	}
}
