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

import br.com.pub.domain.Pub;

//TODO: futuramente qnd houver necessidade, implementar como servico generico, para atender não só um unico email, mas sim vários
public class EmailSender {
	
	final static String username = "pubanywhere@gmail.com";
	final static String password = "pubanywhere250586!";
	
	private static Logger log = LoggerFactory.getLogger(EmailSender.class);
	
	public static void sendMail(Pub pub, HttpServletRequest request) {
		
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
			message.setContent("Click the link below to activate the bar/pub.<br/> <a href="+ createURL(request, pub.getPubId()) + ">" + createURL(request, pub.getPubId()) +"</a>", "text/html");
			
			Transport.send(message);
			
		} catch (AddressException e) {
			log.error(e.getMessage());
			e.printStackTrace();
		} catch (MessagingException e) {
			log.error(e.getMessage());
			e.printStackTrace();
		}
		
	}

	private static String createURL(HttpServletRequest request, Long id) {
		String path = request.getRequestURL().toString();
		String newPath = path.replace("/registerPub", "/activePub/");
		return newPath.concat(id.toString());
	}	
}
