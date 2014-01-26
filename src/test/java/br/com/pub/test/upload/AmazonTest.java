package br.com.pub.test.upload;

import java.awt.image.BufferedImage;
import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.IOException;
import java.security.NoSuchAlgorithmException;
import java.util.Properties;

import javax.imageio.ImageIO;

import org.jets3t.service.S3Service;
import org.jets3t.service.S3ServiceException;
import org.jets3t.service.ServiceException;
import org.jets3t.service.acl.AccessControlList;
import org.jets3t.service.acl.GroupGrantee;
import org.jets3t.service.acl.Permission;
import org.jets3t.service.impl.rest.httpclient.RestS3Service;
import org.jets3t.service.model.S3Bucket;
import org.jets3t.service.model.S3Object;
import org.jets3t.service.security.AWSCredentials;

import com.pub.enumeration.ContentTypeEnum;
import com.pub.service.AmazonService;
import com.pub.utils.MessageUtils;


public class AmazonTest {

private static final Properties config = MessageUtils.loadPropertyFile(AmazonService.class, "config.properties");
	
	private static final String AWSACCESSKEY = config.getProperty("awskey");
	private static final String AWSSECRETKEY = config.getProperty("awssecret");
	private static final AWSCredentials AWSCREDENTIALS = new AWSCredentials(AWSACCESSKEY, AWSSECRETKEY);
	private static S3Service s3Service;
	private static S3Bucket pubanywhere;
	
	public static void main(String[] args) {
		
		try {
			
			File file = new File("D:\\Fotos\\Sites\\pub-logo.png");
			BufferedImage originalImage = ImageIO.read(file);
			ByteArrayOutputStream baos = new ByteArrayOutputStream();
			ImageIO.write(originalImage, "png", baos);
			byte[] bytes = baos.toByteArray();
			upload(bytes, "abcde");
		
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	public static void upload(byte[] image, String fileName) {
		
		try {
			
			s3Service = new RestS3Service(AWSCREDENTIALS);
			AccessControlList bucketAcl = s3Service.getBucketAcl("pubanywhere");
			bucketAcl.grantPermission(GroupGrantee.ALL_USERS, Permission.PERMISSION_READ);
			pubanywhere = s3Service.getBucket("pubanywhere");
			
			if (pubanywhere != null) {
				
				final boolean exist = s3Service.isObjectInBucket("pubanywhere", fileName + "_1");
				if (!exist) {
					S3Object object = new S3Object(fileName + "_1", image);
					object.setContentLength(image.length);
					object.setContentType(ContentTypeEnum.PNG.getDescricao());
					object.setAcl(bucketAcl);
					s3Service.putObject(pubanywhere, object);
				} else {
					final S3Object[] listObjects = s3Service.listObjects("pubanywhere", fileName, null);
					int size = listObjects.length;
					if (s3Service.isObjectInBucket("pubanywhere", fileName + "_" + size)) {
						S3Object object = new S3Object(fileName + "_" + (size + 1), image);
						object.setContentLength(image.length);
						object.setContentType(ContentTypeEnum.PNG.getDescricao());
						object.setAcl(bucketAcl);
						s3Service.putObject(pubanywhere, object);
					}
				}
			}
			
		} catch (S3ServiceException e) {
			e.printStackTrace();
		} catch (NoSuchAlgorithmException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		} catch (ServiceException e) {
			e.printStackTrace();
		}
	}
}
