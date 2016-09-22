package com.momolela.util;

import java.io.File;

import org.dom4j.Document;
import org.dom4j.DocumentException;
import org.dom4j.DocumentHelper;
import org.dom4j.io.SAXReader;

/**
 * 
 * @description 
 *
 * @author shenwb
 * @date 2016-5-23
 */
public class SunXmlUtil {

	public static Document readFile(String filePath) {
		Document doc = null;
		SAXReader reader = new SAXReader();
		try {
			doc = reader.read(new File(filePath));
		} catch (DocumentException e) {
			System.out.println("读取配置文件【" + filePath + "】出错！");
			e.printStackTrace();
		}
		return doc;
	}
	
	public static Document readFile(File file) {
		Document doc = null;
		SAXReader reader = new SAXReader();
		try {
			doc = reader.read(file);
		} catch (DocumentException e) {
			System.out.println("读取配置文件【" + file.getName() + "】出错！");
			e.printStackTrace();
		}
		return doc;
	}

	public static Document convertToXML(String text) {
		Document doc = null;
		try {
			doc = DocumentHelper.parseText(text);
		} catch (DocumentException e) {
			System.out.println("转换XML失败!");
			e.printStackTrace();
		}
		return doc;
	}
	
}
