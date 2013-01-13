package br.com.pub.utils;

import java.lang.reflect.Method;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

public abstract class EnumHelper {

	private static Logger log = LoggerFactory.getLogger(EnumHelper.class);

	public static <T extends Enum<T>, V> String getDescricaoPorCodigo(Class<T> enumType, V value) {

		if (value == null) {
			return null;
		}
		
		try {
			
			Method getCodigo = enumType.getDeclaredMethod("getCodigo");
			Method getDescricao = enumType.getDeclaredMethod("getDescricao");
			
			for (T item : enumType.getEnumConstants()) {
				if (getCodigo.invoke(item).toString().equals(value.toString())) {
					return getDescricao.invoke(item).toString();
				}
			}
		} catch (NoSuchMethodException e) {
			log.error("Este enum não contém o método esperado por este Helper. Os métodos esperados são: getCodigo(), getDescricao()");
		} catch (Exception e) {
			log.error(e.getMessage());
		}
		
		//Caso não encontre o código no Enum, retorna ele mesmo
		return value.toString();
	}
}