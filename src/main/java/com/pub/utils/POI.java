package com.pub.utils;

import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Method;
import java.util.LinkedHashMap;
import java.util.LinkedList;
import java.util.List;
import java.util.Map;

import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.CellStyle;
import org.apache.poi.ss.usermodel.Font;
import org.apache.poi.ss.usermodel.Row;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

/**
 *
 * <code>POIHelper</code> criada para auxiliar na exportação de documentos no
 * formato XLS utilizando o POI.
 *
 * @author thiago pereira
 *
 */
public class POI {

	private static final Logger log = LoggerFactory.getLogger(POI.class);

	/**
	 *
	 * <p>Para que o documento seja criado corretamente, é necessário que
	 * o <code>mapHeaderxGetter</code>, contenha o cabeçalho como chave e
	 * os nomes dos getters como valor do map.
	 * Ideal que o map seja do tipo {@link LinkedHashMap} para manter ordenado.
	 * </p>
	 *
	 * <p>
	 * Ex:
	 *
	 * <blockquote>
	 * <pre>
	 * Map<String, String> map = new LinkedHashMap<String, String>();
	 * map.put("Header ID", "getHeaderId");
	 * map.put("Header Desc", "getHeaderDesc");
	 * </pre>
	 * </blockquote>
	 *
	 * </p>
	 *
	 * @param clazz Classe que representa os objetos de sua lista.
	 * @param mapHeaderxGetter Map com o cabeçalho como chave e gets do bean como valor
	 * @param contentList Lista com os objetos a serem preenchidos no documento xls.
	 * @param sheetName Nome da planilha do documento xls.
	 *
	 * @return Retorna um objeto do tipo {@link HSSFWorkbook} preenchido.
	 *
	 */
	public static <T> HSSFWorkbook exportXlsWithParams(Class<T> clazz,
			Map<String, String> mapHeaderxGetter, List<T> contentList, String sheetName) {

		HSSFWorkbook wb = new HSSFWorkbook();
		HSSFSheet s = wb.createSheet(sheetName);

		try {
			setContentFromGenericList(contentList, s, getHeaderAndMethods(clazz, mapHeaderxGetter, wb, s));
		} catch (IllegalAccessException e) {
			log.error(e.getMessage(), e);
		} catch (InvocationTargetException e) {
			log.error(e.getMessage(), e);
		} catch (NoSuchMethodException e) {
			log.error(e.getMessage(), e);
		}

		return wb;
	}

	/**
	 * @param contentList Lista com os objetos a serem preenchidos no documento xls.
	 * @param s {@link HSSFSheet}
	 * @param methods Lista de {@link Method}
	 * @throws IllegalAccessException
	 * @throws InvocationTargetException
	 */
	private static <T> void setContentFromGenericList(List<T> contentList,
			HSSFSheet s, List<Method> methods) throws IllegalAccessException,
			InvocationTargetException {

		int row = 0;

		for (T item : contentList) {
			int cellCount = 0;
			Row r2 = s.createRow(row + 1);
			for (Method m : methods) {
				if (m.getName().startsWith("get")) {
					if (m.invoke(item) == null) {
						r2.createCell(cellCount).setCellValue("");
					} else {
						r2.createCell(cellCount).setCellValue(m.invoke(item).toString());
					}
					cellCount++;
				}
			}
			row++;
		}
	}

	/**
	 * @param clazz Classe a ser passada para recuperação dos métodos get
	 * @param mapHeaderxGetter Map com cabeçalho e getter da clazz
	 * @param wb {@link HSSFWorkbook}
	 * @param s {@link HSSFSheet}
	 * @return Retorna uma lista <code>List<Method></code>
	 * @throws NoSuchMethodException
	 */
	private static <T> List<Method> getHeaderAndMethods(Class<T> clazz,
			Map<String, String> mapHeaderxGetter, HSSFWorkbook wb, HSSFSheet s)
			throws NoSuchMethodException {

		int cellHeader = 0;
		Row r1 = s.createRow(0);

		List<Method> methods = new LinkedList<Method>();

		for (Map.Entry<String, String> entry : mapHeaderxGetter.entrySet()) {
			Cell c = r1.createCell(cellHeader);
			setStyle(wb, c);
			c.setCellValue(entry.getKey());

			Method m = clazz.getDeclaredMethod(entry.getValue());
			methods.add(m);

			cellHeader++;
		}
		return methods;
	}

	/**
	 * @param wb {@link HSSFWorkbook}
	 * @param c {@link Cell}
	 */
	private static void setStyle(HSSFWorkbook wb, Cell c) {
		CellStyle cs = wb.createCellStyle();
		Font font = wb.createFont();
		font.setBoldweight(Font.BOLDWEIGHT_BOLD);
		cs.setFont(font);
		c.setCellStyle(cs);
	}
}
