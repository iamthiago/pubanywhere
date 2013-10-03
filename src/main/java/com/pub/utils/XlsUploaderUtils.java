package com.pub.utils;
/*package br.com.pub.utils;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.lang.reflect.Field;
import java.lang.reflect.InvocationTargetException;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

import org.apache.commons.beanutils.BeanUtils;
import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.xssf.usermodel.XSSFSheet;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;
import org.hibernate.mapping.KeyValue;

import br.com.pub.annotation.XlsMapper;

public class XlsUploaderUtils {
	
	private static final String XLS = ".xls";
	private static final String XLSX = ".xlsx";
	
	public static <T> List<T> getBeanListFromXls(Class<T> clazz, File file) {
		
		List<T> list = new ArrayList<T>();
		
		String extension = file.getName().substring(file.getName().lastIndexOf("."));
		
		try {
			
			FileInputStream xls = new FileInputStream(file);
			
			if (extension.equals(XLS)) {
				HSSFWorkbook workbook = new HSSFWorkbook(xls);
				HSSFSheet sheet = workbook.getSheetAt(0);
				getContentUsingReflection(clazz, list, sheet);
				
			} else if (extension.equals(XLSX)) {
				XSSFWorkbook workbook = new XSSFWorkbook(xls);
				XSSFSheet sheet = workbook.getSheetAt(0);
				getContentUsingReflection(clazz, list, sheet);
			}
			
			xls.close();
			
		} catch (SecurityException e) {
			e.printStackTrace();
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		} catch (IllegalAccessException e) {
			e.printStackTrace();
		} catch (IllegalArgumentException e) {
			e.printStackTrace();
		} catch (InvocationTargetException e) {
			e.printStackTrace();
		} catch (InstantiationException e) {
			e.printStackTrace();
		}
		
		return list;
	}

	private static <T, K extends Sheet> void getContentUsingReflection(Class<T> clazz, List<T> list, K sheet) throws InstantiationException,
			IllegalAccessException, InvocationTargetException {
		
		int header = 0;
		int content = 1;
		
		Iterator<Row> rowIterator = sheet.rowIterator();
		while (rowIterator.hasNext()) {
			
			if (sheet.getRow(content) != null) {
				T obj = clazz.newInstance();
				
				Row row = (Row) rowIterator.next();
				Iterator<Cell> cellIterator = row.cellIterator();
				while (cellIterator.hasNext()) {
					Cell cell = (Cell) cellIterator.next();
						
					String xlsHeader = sheet.getRow(header).getCell(cell.getColumnIndex()).getStringCellValue();
					
					for (Field f : clazz.getDeclaredFields()) {
						if(f.isAnnotationPresent(XlsMapper.class)){
							XlsMapper mapper = f.getAnnotation(XlsMapper.class);
							if (mapper != null) {
								if(mapper.value().equals(xlsHeader)){
									BeanUtils.setProperty(obj, f.getName(), returnCellValue(sheet.getRow(content).getCell(cell.getColumnIndex())));
								}
							}
						}
					}
				}
				
				list.add(obj);
				content++;
			} else {
				break;
			}
		}
	}

	private static <T extends Sheet> void getContent(List<KeyValue> list, T sheet) {
		int header = 0;
		int content = 1;
		
		Iterator<Row> rowIterator = sheet.rowIterator();
		while (rowIterator.hasNext()) {
			Row row = (Row) rowIterator.next();
			Iterator<Cell> cellIterator = row.cellIterator();
			while (cellIterator.hasNext()) {
				Cell cell = (Cell) cellIterator.next();
				if (sheet.getRow(content) != null) {
					KeyValue keyValue = new KeyValue();
					keyValue.setKey(sheet.getRow(header).getCell(cell.getColumnIndex()).getStringCellValue());
					keyValue.setValue(returnCellValue(sheet.getRow(content).getCell(cell.getColumnIndex())));
					list.add(keyValue);
				}
			}
			content++;
		}
	}

	private static Object returnCellValue(Cell cell) {
		switch (cell.getCellType()) {
			case Cell.CELL_TYPE_BOOLEAN:
				return cell.getBooleanCellValue();
			case Cell.CELL_TYPE_NUMERIC:
				return cell.getNumericCellValue();
			case Cell.CELL_TYPE_STRING:
				return cell.getStringCellValue();
		}
		return null;
	}	
}
*/