package com.pub.service;

import java.io.File;
import java.util.Properties;
import java.util.concurrent.Executors;

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

import com.pub.enumeration.ContentTypeEnum;
import com.pub.utils.MessageUtils;


public class AmazonService {
	
	private static final Logger log = LoggerFactory.getLogger(AmazonService.class);
	private static final Properties config = MessageUtils.loadPropertyFile(AmazonService.class, "config.properties");
	
	private static final String AWSACCESSKEY = config.getProperty("awskey");
	private static final String AWSSECRETKEY = config.getProperty("awssecret");
	private static final AWSCredentials AWSCREDENTIALS = new AWSCredentials(AWSACCESSKEY, AWSSECRETKEY);
	private static S3Service s3Service;
	private static S3Bucket pubanywhere;

	private static int size = 0;
	
	public static int upload(final CommonsMultipartFile image, final String fileName) {
		
		Executors.newSingleThreadExecutor().submit(new Runnable() {
			
			@Override
			public void run() {
				try {
					
					s3Service = new RestS3Service(AWSCREDENTIALS);
					AccessControlList bucketAcl = s3Service.getBucketAcl("pubanywhere");
					bucketAcl.grantPermission(GroupGrantee.ALL_USERS, Permission.PERMISSION_READ);
					pubanywhere = s3Service.getBucket("pubanywhere");
					
					if (pubanywhere != null) {
						
						final boolean exist = isFileOnAmazon(fileName + "_1");
						if (!exist) {
							S3Object object = new S3Object(fileName + "_1", image.getBytes());
							object.setContentLength(image.getSize());
							object.setContentType(ContentTypeEnum.PNG.getDescricao());
							object.setAcl(bucketAcl);
							s3Service.putObject(pubanywhere, object);
						} else {
							final S3Object[] listObjects = s3Service.listObjects("pubanywhere", fileName, null);
							size = listObjects.length;
							if (isFileOnAmazon(fileName + "_" + size)) {
								S3Object object = new S3Object(fileName + "_" + (size + 1), image.getBytes());
								object.setContentLength(image.getSize());
								object.setContentType(ContentTypeEnum.PNG.getDescricao());
								object.setAcl(bucketAcl);
								s3Service.putObject(pubanywhere, object);
							}
						}
					}
					
				} catch (Exception e) {
					log.error("Error uploading image: " + fileName, e.getMessage());
				}
				
				log.info("Uploading image: " + fileName + " on amazon");
			}
		});
		
		return size;
	}
	
	public static void uploadFile(final File file, final String fileName, final ContentTypeEnum contentType, final boolean rewrite) {
		try {
			
			s3Service = new RestS3Service(AWSCREDENTIALS);
			AccessControlList bucketAcl = s3Service.getBucketAcl("pubanywhere");
			bucketAcl.grantPermission(GroupGrantee.ALL_USERS, Permission.PERMISSION_READ);
			pubanywhere = s3Service.getBucket("pubanywhere");
			
			if (pubanywhere != null) {
				S3Object object = new S3Object(pubanywhere, file);
				object.setContentLength(file.length());
				object.setContentType(contentType.getDescricao());
				object.setName(fileName);
				object.setAcl(bucketAcl);
				
				if (rewrite) {
					s3Service.putObject(pubanywhere, object);
				} else {
					if (!isFileOnAmazon(fileName)) {
						s3Service.putObject(pubanywhere, object);
					}
				}
				
				log.info("Uploading file: " + fileName + " on amazon");
			}
			
		} catch (Exception e) {
			log.error("Error uploading file: " + fileName, e.getMessage());
		}
	}
	
	public static boolean isFileOnAmazon(final String fileName) {
		try {
			return s3Service.isObjectInBucket("pubanywhere", fileName);
			
		} catch (Exception e) {
			log.error("Error to verify file: " + fileName, e.getMessage());
		}
		
		return false;
	}
	
	public static S3Object getFileFromAmazon(final String fileName) {
		try {
			
			s3Service = new RestS3Service(AWSCREDENTIALS);
			if (isFileOnAmazon(fileName)) {
				return s3Service.getObject("pubanywhere", fileName);
			}
			
		} catch (Exception e) {
			log.error("Error to retrieve file: " + fileName, e.getMessage());
		}
		return null;
	}
}
