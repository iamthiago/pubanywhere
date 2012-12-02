package br.com.pub.test.mail;
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


public class Teste {

	final static String username = "pubanywhere@gmail.com";
	final static String password = "pubanywhere250586!";
	final static String url = "http://localhost:8080/pubanywhere/pubs/activePub/";
	
	public static void main(String[] args) {
		sendMail();
	}
	
	public static void sendMail() {
		
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
			message.setFrom(new InternetAddress("pubanywhere@gmail.com"));
			message.setRecipients(Message.RecipientType.TO, InternetAddress.parse("thiagoandrade6@gmail.com"));
			message.setSubject("Register a bar/pub");
			message.setContent("Click the link below to activate the bar/pub.<br/> <a href="+ url + ">" + url +"</a>", "text/html");
			
			Transport.send(message);
			
		} catch (AddressException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (MessagingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
}
