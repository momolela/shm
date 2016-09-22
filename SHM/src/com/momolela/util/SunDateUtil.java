package com.momolela.util;

import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.GregorianCalendar;

/**
 * @author momolela
 * @date 2014年7月11日
 * @describe 时间处理工具类
 */
public class SunDateUtil {

	// private static SimpleDateFormat dateFormatT6 = new
	// SimpleDateFormat("HH:mm:ss");
	// private static SimpleDateFormat dateFormatD8 = new
	// SimpleDateFormat("yyyy-MM-dd");
	// private static SimpleDateFormat dateFormatDT15 = new
	// SimpleDateFormat("yyyy-MM-dd'T'HH:mm:ss");
	// private static SimpleDateFormat dateFormatDT10 = new
	// SimpleDateFormat("MM-dd HH:mm:ss");
	
	
	/**
	 * date 转 string 默认格式yyyy-MM-dd HH:mm:ss
	 * @param date
	 * @return
	 */
	public static String dateFormat(Date date) {
		SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		if(date==null){
			return null;
		}
		return dateFormat.format(date);
	}
	
	/**
	 * date 转 string 默认格式yyyy-MM-dd
	 * @param date
	 * @return
	 */
	public static String dateFormatDay(Date date) {
		SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
		if(date==null){
			return null;
		}
		return dateFormat.format(date);
	}
	
	/**
	 * date 转 string 默认格式yyyy-MM-dd'T'HH:mm:ss
	 * @param date
	 * @return
	 */
	public static String dateFormatDT15(Date date) {
		SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd'T'HH:mm:ss");
		if(date==null){
			return null;
		}
		return dateFormat.format(date);
	}


	/**string 转 date
	 * 这个函数负责建 各种不规范的时间字符串转换为java的时间类型
	 * @param value 
	 * @return
	 * @throws Exception
	 */
	public synchronized static Date stringToDate(String value) throws Exception {// 将
		String df = "";
		if (value.length() == 15) {
			df = "yyyyMMdd'T'HHmmss";
		} else if (value.length() == 8) {
			df = "yyyyMMdd";
		} else {
			boolean isHasT = false;
			// 时间字符串转为时间
			// String valueString = "2014-2-3 12:3:2";
			String[] di = null;
			if (value.contains("T")) {// 有T的用T截断
				di = value.split("T");
				isHasT = true;
			} else
				di = value.split(" ");

			if (di.length >= 1) {
				int c = di[0].split("-").length;
				if (c >= 1)
					df += "yyyy";
				if (c >= 2)
					df += "-MM";
				if (c >= 3)
					df += "-dd";
			}
			if (di.length >= 2) {
				if (isHasT)
					df += "'T'";
				int c = di[1].split(":").length;
				if (c >= 1)
					df += "HH";
				if (c >= 2)
					df += ":mm";
				if (c >= 3)
					df += ":ss";
			}
		}
		SimpleDateFormat sdf = new SimpleDateFormat(df);
		return sdf.parse(value);
	}
	
	/**
	 * 新增date的年(在某一年中的某一天的日期)
	 * @param date
	 * @param year
	 * @return Date
	 */
	@SuppressWarnings("static-access")
	public static Date addDateToYear(Date date, int year) {
		Date da = (Date) date.clone();
		Calendar calendar = new GregorianCalendar();
		calendar.setTime(da);
		calendar.add(calendar.YEAR, year);
		da = calendar.getTime();
		return da;
	}
	/**
	 * 新增date的月份(在某一月中的某一天的日期)
	 * @param date
	 * @param month
	 * @return Date
	 */
	@SuppressWarnings("static-access")
	public static Date addDateToMonth(Date date, int month) {
		Date da = (Date) date.clone();
		Calendar calendar = new GregorianCalendar();
		calendar.setTime(da);
		calendar.add(calendar.MONTH, month);
		da = calendar.getTime();
		return da;
	}
	
	/**
	 * 新增date的日
	 * @param date
	 * @param day
	 * @return Date
	 */
	@SuppressWarnings("static-access")
	public static Date addDateToDay(Date date, int day) {
		Date da = (Date) date.clone();
		Calendar calendar = new GregorianCalendar();
		calendar.setTime(da);
		calendar.add(calendar.DATE, day);// 把日期往后增加一天.整数往后推,负数往前移动
		da = calendar.getTime(); // 这个时间就是日期往后推一天的结果
		return da;
	}
	
	/**
	 * 新增date的小时
	 * @param date
	 * @param hour
	 * @return
	 */
	@SuppressWarnings("static-access")
	public static Date addDateToHour(Date date, int hour) {
		Date da = (Date) date.clone();
		Calendar calendar = new GregorianCalendar();
		calendar.setTime(da);
		calendar.add(calendar.HOUR, hour);
		da = calendar.getTime();
		return da;
	}
	/**
	 * 求时间段的间隔
	 * @param startDate 开始时间
	 * @param endDate 结束时间
	 * @param totalType 计算类型
	 * @return int 
	 */
	public static int distanceDateByType(String startDate,String endDate,String totalType){
		Date sd=null;
		Date ed=null;
		try {
			sd = stringToDate(startDate);
			ed = stringToDate(endDate);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return distanceDateByType(sd,ed,totalType);
	}
	
	/**
	 * 求时间段的间隔
	 * @param startDate 开始时间
	 * @param endDate 结束时间
	 * @param totalType 计算类型
	 * @return int
	 */
	public static int distanceDateByType(Date startDate,Date endDate,String totalType){
		int distance = 0;
		switch(totalType){
			case "byday" : 
				distance =  distanceDay(startDate,endDate)+1;
				break;
			case "bymonth" : 
				distance = distanceMonth(startDate,endDate)+1;
				break;
			case "byseason" : 
				distance = distanceSeason(startDate,endDate)+1;
				break;
			case "byyear" : 
				distance = distanceYearn(startDate,endDate)+1;
				break;
		}
		return distance;
	}
	
	/**
	 * 求时间段的间隔天数
	 * @param startDate
	 * @param endDate
	 * @return
	 */
	public static int distanceDay(Date startDate,Date endDate){
		   long intervalMilli = startDate.getTime() - endDate.getTime();
	       return Math.abs((int) (intervalMilli / (24 * 60 * 60 * 1000)));
	}
	
	
	public static  int compareDate(String date1, String date2){
		Date startDate = SunDateUtils.parseDate(date1);
		Date endDate = SunDateUtils.parseDate(date2);
		return startDate.compareTo(endDate);
	}
	
	/**
	 * 求时间段的间隔月数
	 * @param startDate
	 * @param endDate
	 * @return
	 */
	public static int distanceMonth(Date startDate,Date endDate){
		Calendar sCalendar = Calendar.getInstance();
	    sCalendar.setTime(startDate);
	    Calendar eCalendar = Calendar.getInstance();
	    eCalendar.setTime(endDate);
	    int syear = sCalendar.get(Calendar.YEAR);
	    int smonth = sCalendar.get(Calendar.MONTH);
	    int eyear = eCalendar.get(Calendar.YEAR);
	    int emonth = eCalendar.get(Calendar.MONTH);
	    int dis =0;
	    dis = Math.abs((eyear-syear))*12+(emonth-smonth);
		return dis;
	}
	
	/**
	 * 求时间段的间隔季度数
	 * @param startDate
	 * @param endDate
	 * @return
	 */
	public static int distanceSeason(Date startDate,Date endDate){
		Calendar sCalendar = Calendar.getInstance();
	    sCalendar.setTime(startDate);
	    Calendar eCalendar = Calendar.getInstance();
	    eCalendar.setTime(endDate);
	    int syear = sCalendar.get(Calendar.YEAR);
	    int eyear = eCalendar.get(Calendar.YEAR);
	    
		int sseason = SunDateUtils.getSeason(startDate);
		int eseason = SunDateUtils.getSeason(endDate);
		
		int dis =0;
		dis = Math.abs((eyear-syear))*4+(eseason-sseason);
		return dis;
	}
	
	/**
	 * 求时间段的间隔年数
	 * @param startDate
	 * @param endDate
	 * @return
	 */
	public static int distanceYearn(Date startDate,Date endDate){
		Calendar sCalendar = Calendar.getInstance();
	    sCalendar.setTime(startDate);
	    Calendar eCalendar = Calendar.getInstance();
	    eCalendar.setTime(endDate);
	    int syear = sCalendar.get(Calendar.YEAR);
	    int eyear = eCalendar.get(Calendar.YEAR);
		int dis =0;
		 dis = Math.abs((eyear-syear));
		return dis;
	}
	
	/** 
     * 获取随机日期 
     *  
     * @param beginDate 
     *            起始日期，格式为：yyyy-MM-dd 
     * @param endDate 
     *            结束日期，格式为：yyyy-MM-dd 
     * @return 
     */  
    public static Date randomDate(String beginDate, String endDate) {  
        try {  
            SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");  
            Date start = format.parse(beginDate);// 构造开始日期  
            Date end = format.parse(endDate);// 构造结束日期  
            // getTime()表示返回自 1970 年 1 月 1 日 00:00:00 GMT 以来此 Date 对象表示的毫秒数。  
            if (start.getTime() >= end.getTime()) {  
                return null;  
            }  
            long date = random(start.getTime(), end.getTime());  
            return new Date(date);  
        } catch (Exception e) {  
            e.printStackTrace();  
        }  
        return null;  
    }  
    
    /**
     * 求指定范围的随机数
     * @param begin
     * @param end
     * @return
     */
    public static long random(long begin, long end) {  
        long rtn = begin + (long) (Math.random() * (end - begin));  
        // 如果返回的是开始时间和结束时间，则递归调用本函数查找随机值  
        if (rtn == begin || rtn == end) {  
            return random(begin, end);  
        }  
        return rtn;  
    }  
	
	
	public static void main(String[] args) throws Exception {
		// System.out.println(SunDateUtil.dateFormatDT15(new Date()));
		// System.out.println(SunDateUtil.addDateToYear(new Date(),2012));
		// System.out.println(SunDateUtil.addDateToMonth(new Date(),6));
		// int dis = distanceDateByType("2015-12-03","2016-03-31","byseason");
		// System.out.println(dis);
		// int ss = SunDateUtil.compareDate("2016-02-02","2016-02-02");
		// System.out.println("ss:"+ss);

	}
	
	
	
}
