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
		form.setEmail("pubanywhere@gmail.com");
		form.setSubject("Register " + pub.getName());
		form.setDescription(
				"Pub: " + pub.getName() + "<br/>" +
				"Location: " + pub.getLocal() + "<br/>" +
				"Description: " + pub.getDescricao() + "<br/><br/>" +
				"<a href="+ EmailUtils.createURL(request, pub.getPubId()) + ">" + EmailUtils.createURL(request, pub.getPubId()) +"</a>");
		
		EmailUtils.sendMail(form, request);
		log.info("enviando email para ativação do pub: " + pub.getName());
	}
	
	public static void sendUserDetailsMail(Pub pub, Users pubUser, boolean isNewUser, HttpServletRequest request) {
		if (isNewUser) {
			ContactForm form = new ContactForm();
			form.setEmail("pubanywhere@gmail.com");
			form.setTo(pub.getEmail());
			if (pub.getCountry().equals(Country.BRAZIL.getDescricao()) || pub.getCountry().equals(Country.BRASIL.getDescricao())) {
				form.setSubject("Senha de acesso ao Pub Anywhere");
				form.setDescription("<div style='font-weight: bold; font-size: 14px;'><h2>Senha de acesso ao Pub Anywhere!</h2><br><br>Você acaba de receber sua senha de acesso ao pub anywhere, através do botão login você pode:<br><br>- Alterar os dados do seu bar/pub<br>- Quantidade de vezes que seu bar/pub foi visualizado<br>- Alterar sua senha(recomendado logo após o primeiro acesso)<br><br>Caso possua dúvidas ou sugestões, sinta-se a vontade para nos contatar.<br><br>Lembre-se, divulgue para os amigos, compartilhe no facebook e twitter, ganhe o mundo!<br><br> Dados de acesso: <br><br>Usuario: " + pubUser.getUsername() + "<br>Senha: " + pubUser.getPassword() + "<br><br><br><br>Obrigado<br>Thiago - Fundador<br>www.pubanywhere.com</div>");
			} else {
				form.setSubject("Pub Anywhere access detail");
				form.setDescription("<div style='font-weight: bold; font-size: 14px;'><h2>Pub Anywhere access detail!</h2><br><br>You just received your password to pub anywhere, through login button you can:<br><br>- Change bar/pub info<br>- Number os times your bar/pub was visualized<br>- Change your password(Recommended after first login)<br><br>If you have any questions or suggestions, feel free to contact us.<br><br>Remember share with your friends, share on facebook and twitter, get the world!<br><br> Access info: <br><br>User: " + pubUser.getUsername() + "<br>Password: " + pubUser.getPassword() + "<br><br><br><br>Best Regards<br>Thiago - Founder<br>www.pubanywhere.com</div>");
			}
			EmailUtils.sendMail(form, request);
			log.info("Enviado email com detalhes do usuario ao pub: " + pub.getName());
		}
	}
	
	private static void sendMarketMail(Pub pub, HttpServletRequest request) {
		if (pub.getEmail() != null) {
			ContactForm form = new ContactForm();
			form.setEmail("pubanywhere@gmail.com");
			form.setTo(pub.getEmail());
			form.setDescription(getMessageMarket(pub, form));
			EmailUtils.sendMail(form, request);
			log.info("Enviado email marketing do pub: " + pub.getName());
		}
	}
	
	private static String getMessageMarket(Pub pub, ContactForm form) {
		StringBuilder msg = new StringBuilder();
		if (pub.getCountry().equals(Country.BRAZIL.getDescricao()) || pub.getCountry().equals(Country.BRASIL.getDescricao())) {
			form.setSubject("Bem vindo ao Pub Anywhere!");
			msg.append("<div style='font-weight: bold; font-size: 14px;'><h2>Bem vindo ao Pub Anywhere!</h2><br><br>Você recebeu este email por alguns motivos:<br><br>- Nós cadastramos seu bar/pub em nossa base de dados<br>- Você se cadastrou em nosso site<br>- Alguém que gosta do seu bar/pub, o cadastrou<br><br><br>Pub Anywhere é um site global de bares e pubs, com o intuito de ajudar as pessoas a encontrarem um local aproximado de onde estão para apreciar uma bela cerveja.<br><br>Entenda melhor em: www.pubanywhere.com<br><br>De forma totalmente gratuita, além do cadastro e visualização no mapa, você conta também com uma página dedicada ao seu bar/pub. Abuse disso, divulgue para os amigos, compartilhe no facebook e twitter, ganhe o mundo!<br><br>www.pubanywhere.com/pubs/" + pub.getPubId() + "<br><br><br><br>Obrigado<br>Thiago - Fundador<br>www.pubanywhere.com</div>");
		} else {
			form.setSubject("Welcome to Pub Anywhere!");
			msg.append("<div style='font-weight: bold; font-size: 14px;'><h2>Welcome to Pub Anywhere!</h2><br><br>You have received this mail for some reasons:<br><br>- We registered your bar/pub in our data base<br>- You have registered in our website<br>- Someone who like your bar/pub, registered it<br><br><br>Pub Anywhere is a bars/pubs global website, aiming for help people to find the nearest place of where they are to enjoy a beer.<br><br>Understand better in: www.pubanywhere.com<br><br>Completely free, beyond the registration and map visualization, you also has a dedicated page. Abuse it, share with your friends, share on facebook and twitter, get the world!<br><br>www.pubanywhere.com/pubs/" + pub.getPubId() + "<br><br><br><br>Best Regards<br>Thiago - Founder<br>www.pubanywhere.com</div>");
		}
		return msg.toString();
	}
}
