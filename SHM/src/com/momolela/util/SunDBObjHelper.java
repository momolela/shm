package com.momolela.util;

import java.math.BigDecimal;
import java.util.Date;

/**
 * obj对象向其他类型的转换
 * @ClassName: SunDBObjHelper
 * @Description: 
 * @author: momolela
 * @date 2016-9-8 上午9:31:46
 * 
 */
public class SunDBObjHelper {
	
	public static float dbObjToFloat(Object object) {
		String value = dbObjToString(object);
		if (value != null && value != "")
			return Float.valueOf(value);
		return 0;
	}

	public static int dbObjToInt(Object object) {
		String value = dbObjToString(object);
		if (value != null && value != "")
			return Integer.valueOf(value);
		return 0;
	}

	public static String dbObjToString(Object object) {
		if (object != null)
			return object.toString();
		return "";
	}

	public static Date dbObjToDate(Object object) {
		if (object != null)
			return (Date) object;
		return null;
	}

	public static boolean dbObjToBool(Object object) {
		return dbObjToString(object).equals("1");
	}
	
	public static BigDecimal dbObjToDecimal(Object object) {
		return BigDecimal.valueOf(dbObjToInt(object));
	}
}
