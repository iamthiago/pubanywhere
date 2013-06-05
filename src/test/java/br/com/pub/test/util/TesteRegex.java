package br.com.pub.test.util;

public class TesteRegex {

	public static void main(String[] args) {

		System.out.println(retiraAcentoRegex("À partir de"));
		System.out.println(retiraAcentoRegex("é isso ai"));
		System.out.println(retiraAcentoRegex("oblíquo"));
		System.out.println(retiraAcentoRegex("olha isso vovô"));
		System.out.println(retiraAcentoRegex("útima chamada"));
		System.out.println(retiraAcentoRegex("caçador de vampiros"));
		System.out.println(retiraAcentoRegex("não vamos mais"));
		System.out.println(retiraAcentoRegex("O'Donoghues Bar"));
	}

	private static String retiraAcentoRegex(String string) {
		return string
			.replaceAll("[áàâãª]", "a")
			.replaceAll("[ÁÀÂÃ]", "A")
			.replaceAll("[éèêë]", "e")
			.replaceAll("[ÉÈÊË]", "E")
			.replaceAll("[íìî]", "i")
			.replaceAll("[ÍÌÎ]", "I")
			.replaceAll("[óòôõº]", "o")
			.replaceAll("[ÓÒÔÕ]", "O")
			.replaceAll("[úùû]", "u")
			.replaceAll("[ÚÙÛ]", "U")
			.replaceAll("[ç]", "c")
			.replaceAll("[Ç]", "C")
			.replaceAll(" ", "")
			.replaceAll("'", "");
	}
}
