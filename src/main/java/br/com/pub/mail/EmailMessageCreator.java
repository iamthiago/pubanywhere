package br.com.pub.mail;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import br.com.pub.domain.Pub;
import br.com.pub.domain.Users;
import br.com.pub.enumeration.Country;
import br.com.pub.form.ContactForm;

public class EmailMessageCreator {
	
	private static Logger log = LoggerFactory.getLogger(EmailMessageCreator.class);
	
	public static void sendPubMail(Pub pub, HttpServletRequest request) {
		sendMailToActive(pub, request);
		sendMarketMail(pub, request);
	}

	private static void sendMailToActive(Pub pub, HttpServletRequest request) {
		ContactForm form = new ContactForm();
		form.setFrom("pubanywhere@gmail.com");
		form.setSubject("Register " + pub.getName());
		form.setDescription(
				"Pub: " + pub.getName() + "<br/>" +
				"Location: " + pub.getLocal() + "<br/>" +
				"Description: " + pub.getDescricao() + "<br/><br/>" +
				"<a href="+ EmailUtils.createURLToActive(request, pub.getPubId()) + ">" + EmailUtils.createURLToActive(request, pub.getPubId()) +"</a>");
		
		EmailUtils.sendMail(form, request, false);
		log.info("enviando email para ativação do pub: " + pub.getName());
	}
	
	private static void sendMarketMail(Pub pub, HttpServletRequest request) {
		if (pub.getEmail() != null) {
			ContactForm form = new ContactForm();
			form.setFrom("pubanywhere@gmail.com");
			form.setTo(pub.getEmail());
			form.setDescription(getMessageMarket(pub, form));
			EmailUtils.sendMail(form, request, true);
			log.info("Enviado email marketing do pub: " + pub.getName());
		}
	}
	
	private static String getMessageMarket(Pub pub, ContactForm form) {
		StringBuilder msg = new StringBuilder();
		if (pub.getCountry().equals(Country.BRAZIL.getDescricao()) || pub.getCountry().equals(Country.BRASIL.getDescricao())) {
			form.setSubject("Bem vindo ao Pub Anywhere!");
			msg.append("<html><body><center><img src='cid:publogo'><br><br><div style='font-weight: bold; font-size: 14px;'><h2>Bem vindo ao Pub Anywhere!</h2><br><br>Pub Anywhere é um site global de bares e pubs, procurando ajudar as pessoas a encontrarem um local aproximado para apreciar uma cerveja.<br><br>Entenda melhor em: www.pubanywhere.com<br><br>Agora você tem uma página dedicada. Abuse disso, divulgue para os amigos, compartilhe no facebook e twitter, ganhe o mundo!<br><br>www.pubanywhere.com/pubs/" + pub.getPubId() + "<br><br><br><br>Obrigado<br>Thiago - Fundador<br>www.pubanywhere.com</div></center></body></html>");
		} else {
			form.setSubject("Welcome to Pub Anywhere!");
			msg.append("<html><body><center><img src='cid:publogo'><div style='font-weight: bold; font-size: 14px;'><h2>Welcome to Pub Anywhere!</h2><br><br>Pub Anywhere is a pub global website, looking for help people to find the nearest place to enjoy a beer.<br><br>Understand better in: www.pubanywhere.com<br><br>Now you have a dedicated page. Abuse it, share with your friends, share on facebook and twitter, get the world!<br><br>www.pubanywhere.com/pubs/" + pub.getPubId() + "<br><br><br><br>Best Regards<br>Thiago - Founder<br>www.pubanywhere.com</div></center></body></html>");
		}
		return msg.toString();
	}
	
	public static void confirmResetPassword(Users user, HttpServletRequest request) {
		ContactForm form = new ContactForm();
		form.setFrom("pubanywhere@gmail.com");
		form.setTo(user.getPubUser().getEmail());
		form.setSubject("Confirm Password Reset");
		form.setDescription("<div style='font-weight: bold; font-size: 14px;'><h2>Confirm your Password Reset!</h2><br><br>Click here: <a href="+ EmailUtils.createURLToResetPassword(request, user.getPubUser().getEmailHash(), user.getPubUser().getHash()) + ">" + EmailUtils.createURLToResetPassword(request, user.getPubUser().getEmailHash(), user.getPubUser().getHash()) +"</a></div>");
		EmailUtils.sendMail(form, request, false);
		log.info("Email sent to confirm password reset for: " + user.getPubUser().getEmailHash());		
	}
	
	public static void resetPassword(String email, String newPassword, HttpServletRequest request) {
		ContactForm form = new ContactForm();
		form.setFrom("pubanywhere@gmail.com");
		form.setTo(email);
		form.setSubject("Password Reset");
		form.setDescription("<div style='font-weight: bold; font-size: 14px;'><h2>Password Reset Successful!</h2><br><br>Your new password is: " + newPassword + "</div>");
		EmailUtils.sendMail(form, request, false);
		log.info("Password successful reset for: " + email);
	}
}
