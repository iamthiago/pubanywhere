package br.com.pub.mail;

import java.io.FileNotFoundException;
import java.util.Properties;

import javax.mail.Authenticator;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.AddressException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;

import org.apache.commons.lang.StringUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.util.ResourceUtils;

import br.com.pub.form.ContactForm;

public class EmailUtils {
	
	final static String username = "pubanywhere@gmail.com";
	final static String password = "thi287243138!";
	
	private static Logger log = LoggerFactory.getLogger(EmailUtils.class);
	
	public static void sendMail(ContactForm contactForm, HttpServletRequest request, boolean hasImage) {
		
		Properties props = new Properties();
		props.put("mail.smtp.auth", "true");
		props.put("mail.smtp.starttls.enable", "true");
		props.put("mail.smtp.host", "smtp.gmail.com");
		props.put("mail.smtp.port", "587");
		
		Session session = Session.getInstance(props, new Authenticator() {
			protected PasswordAuthentication getPasswordAuthentication() {
				return new PasswordAuthentication(username, password);
			}
		});
		
		try {
			
			MimeMessage message = new MimeMessage(session);
			MimeMessageHelper helper = new MimeMessageHelper(message, true);			
			helper.setTo(InternetAddress.parse(setTo(contactForm)));
			helper.setSubject(contactForm.getSubject());
			helper.setText(contactForm.getDescription(), true);
			
			if (hasImage) {
				helper.addInline("publogo", ResourceUtils.getFile("classpath:pub-logo-mini.png"));				
			}
			
			Transport.send(message);
			
		} catch (AddressException e) {
			log.error(e.getMessage());
			e.printStackTrace();
		} catch (MessagingException e) {
			log.error(e.getMessage());
			e.printStackTrace();
		} catch (FileNotFoundException e) {
			log.error(e.getMessage());
			e.printStackTrace();
		}
		
	}
	
	private static String setTo(ContactForm contactForm) {
		if (StringUtils.isEmpty(contactForm.getTo())) {
			//TODO: alterar email para o contato@pubanywhere.com
			return "thiagoandrade6@gmail.com";
		}
		
		return contactForm.getTo();
	}

	public static String createURLToActive(HttpServletRequest request, String string) {
		String path = request.getRequestURL().toString();
		String newPath = path.replace("/registerPub", "/activePub/");
		return newPath.concat(string);
	}
	
	public static String createURLToResetPassword(HttpServletRequest request, String emailHash, String hash) {
		String path = request.getRequestURL().toString();
		return path.replace("/user/forgotPassword", "/user/forgotPassword/" + emailHash + "/" + hash);
	}
	
	public static boolean validEmail(String email) {
		boolean isValid = false;
		try {
			InternetAddress mail = new InternetAddress(email);
			mail.validate();
			isValid = true;
		} catch (AddressException e) {
			log.error(e.getMessage());
		}		
		return isValid;
	}
}
