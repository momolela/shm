package com.momolela.util;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
//import java.util.List;

public class TzFunctions {

	
	/**
	 * 
	 * 方法名：toMap
	 * 创建人：xuchengfei 时间：2015年4月16日-上午12:42:53 
	 * @param content  17#安徽省#1.00000#2.00000
	 * @return String <a href="javascript:void(0)" class='h_maps_area' data-x='1' data-y='2'>安徽省<\\/a>
	 * @exception 
	 * @since  1.0.0
	 */
	public static String toMap(String content){
		if(TzStringUtils.isEmpty(content))return null;
		String[] areas =  content.split("#");
		return "<a href='javascript:void(0)' data-id='"+areas[0]+"' class='area-items' data-x='"+areas[2]+"' data-y='"+areas[3]+"'>"+areas[1]+"</a>";
	}
	
	/**
	 * 格式化日期的自定义函数
	 * 方法名：dateFormat<BR>
	 * 创建人：潭州学院-keke <BR>
	 * 时间：2014年11月11日-下午9:57:18 <BR>
	 * @param dateString
	 * @param format
	 * @return String<BR>
	 * @exception <BR>
	 * @since  1.0.0
	 * System.out.println(dateFormat("2014-12-14 12:12:12", "yyyy"));年份
		System.out.println(dateFormat("2014-12-14 12:12:12", "MM"));月份
		System.out.println(dateFormat("2014-12-14 12:12:12", "dd"));天
		System.out.println(dateFormat("2014-12-14 12:12:12", "HH:mm:ss"));24小时制
		System.out.println(dateFormat("2014-12-14 12:12:12", "hh:mm:ss"));12小时制
		System.out.println(dateFormat("2014-12-14 12:12:12", "yyyy-MM-dd"));年月日
		System.out.println(dateFormat("2014-12-14 12:12:12", "yyyy-MM-dd HH:mm"));年月日 时分
		System.out.println(dateFormat("2014-12-14 12:12:12", "yyyy-MM-dd HH:mm:ss"));年月日 时分秒
	 */
	public static String dateFormat(String dateString,String format){
		if(TzStringUtils.isEmpty(dateString))return "";
		try {
			Date date = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").parse(dateString);
			String ds =  new SimpleDateFormat(format).format(date);
			return ds;
		} catch (ParseException e) {
			return "";
		}
	}
	
	/**
	 * 
	 * 方法名：formateDate<BR>
	 * 创建人：潭州学院-keke <BR>
	 * 时间：2014年11月23日-上午2:29:40 <BR>
	 * @param date
	 * @param format
	 * @return String<BR>
	 * @exception <BR>
	 * @since  1.0.0
	 */
	public static String formateDate(Date date,String format){
		if(date==null)return "";
		String ds =  new SimpleDateFormat(format).format(date);
		return ds;
	}
	
	/**
	 * 获取集合的长度
	 * 方法名：length<BR>
	 * 创建人：潭州学院-keke <BR>
	 * 时间：2014年11月23日-下午11:33:53 <BR>
	 * @param list
	 * @return int<BR>
	 * @exception <BR>
	 * @since  1.0.0
	 */
	@SuppressWarnings("rawtypes")
	public static int getLength(java.util.Collection collection){
		if(collection==null)return 0;
		return collection.size();
	}
}
