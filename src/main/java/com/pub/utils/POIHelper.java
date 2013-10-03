package com.pub.utils;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.lang.reflect.Field;
import java.lang.reflect.InvocationTargetException;
import java.util.List;

import org.apache.commons.beanutils.BeanUtils;
import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.Row;

import com.pub.annotation.XlsMapper;
import com.pub.enumeration.ContentTypeEnum;
import com.pub.service.AmazonService;


public class POIHelper {
	
	public static <T> void exportListToXls(Class<T> clazz, List<T> list, String fileName) {
		
		try {
			
			File file = new File(fileName);
			FileOutputStream fop = new FileOutputStream(file);
			
			HSSFWorkbook wb = new HSSFWorkbook();
			HSSFSheet s = wb.createSheet(clazz.getCanonicalName());
			
			int row = 1;
			int cell = 0;
			Row r1 = s.createRow(0);
			
			for (int i = 0; i < 1; i++) {
				for (Field f : clazz.getDeclaredFields()) {
					if (f.isAnnotationPresent(XlsMapper.class)) {
						Cell c = r1.createCell(cell);
						c.setCellValue(f.getName());
						cell++;
					}
				}
			}
			
			for (T item : list) {
				Row r2 = s.createRow(row);
				for (Field f : clazz.getDeclaredFields()) {
					if (f.isAnnotationPresent(XlsMapper.class)) {
						for (Cell cr1 : r1) {
							if (cr1.getStringCellValue().equals(f.getName())) {
								Cell c = r2.createCell(cr1.getColumnIndex());
								c.setCellValue(BeanUtils.getProperty(item, f.getName()));
								break;
							}
						}
					}
				}
				row++;
			}
			
			wb.write(fop);
			AmazonService.uploadFile(file, file.getName(), ContentTypeEnum.XLS, true);
			fop.close();
			file.delete();
			
		} catch (SecurityException e) {
			e.printStackTrace();
		} catch (IllegalAccessException e) {
			e.printStackTrace();
		} catch (InvocationTargetException e) {
			e.printStackTrace();
		} catch (NoSuchMethodException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	/*public static <T> List<T> retrieveListFromXls(Class<T> clazz, String fileName) {
		
		try {
			
			final S3Object file = AmazonService.getFileFromAmazon(fileName);
			HSSFWorkbook wb = new HSSFWorkbook(file.getDataInputStream());
		
		} catch (IOException e) {
			e.printStackTrace();
		} catch (ServiceException e) {
			e.printStackTrace();
		}
		
		return null;
	}*/
}
