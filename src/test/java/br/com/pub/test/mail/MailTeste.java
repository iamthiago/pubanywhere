package br.com.pub.test.mail;
import java.io.FileNotFoundException;
import java.util.Properties;

import javax.mail.Authenticator;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.MimeMessage;

import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.util.ResourceUtils;


public class MailTeste {

	final static String username = "pubanywhere@gmail.com";
	final static String password = "thi287243138!";
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
			
			MimeMessage message = new MimeMessage(session);
			MimeMessageHelper helper = new MimeMessageHelper(message, true);
			helper.setTo("thiagoandrade6@gmail.com");
			helper.setSubject("Welcome to Pub Anywhere!");
			helper.setText(
					"<html>" +
					"<body>" +
					"<center>" +
					"<img src='cid:publogo'> <br><br>" +
					"<div style='font-weight: bold; font-size: 14px;'><h2>Welcome to Pub Anywhere!</h2><br><br><br>Pub Anywhere is a bars/pubs global website, aiming for help people to find the nearest place of where they are to enjoy a beer.<br><br>Understand better in: www.pubanywhere.com<br><br>Completely free, beyond the registration and map visualization, you also has a dedicated page. Abuse it, share with your friends, share on facebook and twitter, get the world!<br><br>www.pubanywhere.com/pubs/" + "<br><br><br><br>Best Regards<br>Thiago - Founder<br>www.pubanywhere.com</div>" +
					"</center>" +
					"</body>" +
					"</html>", true);

			helper.addInline("publogo", ResourceUtils.getFile("classpath:pub-logo-mini.png"));
			
			Transport.send(message);

		} catch (MessagingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (FileNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
}
