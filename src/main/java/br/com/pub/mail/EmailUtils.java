package br.com.pub.mail;

import java.util.Properties;

import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.AddressException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import br.com.pub.form.ContactForm;

public class EmailUtils {
	
	final static String username = "pubanywhere@gmail.com";
	final static String password = "pubanywhere250586!";
	
	private static Logger log = LoggerFactory.getLogger(EmailUtils.class);
	
	public static void sendMail(ContactForm contactForm, HttpServletRequest request) {
		
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
			
			Message message = new MimeMessage(session);
			message.setFrom(new InternetAddress(contactForm.getEmail()));
			message.setRecipients(Message.RecipientType.TO, InternetAddress.parse("thiagoandrade6@gmail.com"));
			message.setSubject(contactForm.getSubject());
			message.setContent("Name: " + contactForm.getName() + "<br>" + "Email: " + contactForm.getEmail() + "<br>" + "Description: " + contactForm.getDescription(), "text/html");
			
			Transport.send(message);
			
		} catch (AddressException e) {
			log.error(e.getMessage());
			e.printStackTrace();
		} catch (MessagingException e) {
			log.error(e.getMessage());
			e.printStackTrace();
		}
		
	}

	public static String createURL(HttpServletRequest request, Long id) {
		String path = request.getRequestURL().toString();
		String newPath = path.replace("/registerPub", "/activePub/");
		return newPath.concat(id.toString());
	}
	
	public static void validEmail(String email) throws AddressException {
		try {
			InternetAddress mail = new InternetAddress(email);
			mail.validate();
		} catch (AddressException e) {
			log.error(e.getMessage());
			throw new AddressException("Invalid Email");
		}
	}
}
