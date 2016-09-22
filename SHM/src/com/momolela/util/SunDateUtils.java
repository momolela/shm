package com.momolela.util;

import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;

/**
 * 
 * @description 日期查询：季度、月份、星期等时间信息
 * @author momolela
 * @date 2016-6-23
 * 
 */
public class SunDateUtils {

	public static final String YYYYMMDD = "yyyy-MM-dd";

	public static final String YYYYMMDD_ZH = "yyyy年MM月dd日";

	public static final int FIRST_DAY_OF_WEEK = Calendar.MONDAY; // 中国周一是一周的第一天
	
	
	/**
	 * string 转 calendar 
	 * @param strDate
	 * @return
	 */
	public static Calendar parseString2Calendar(String strDate){
		Calendar cal = Calendar.getInstance();
		cal.setTime(parseDate(strDate));
		return cal;
	}
	
	/**
	 * calendar 转 string 默认时间格式 YYYYMMDD
	 * @param cal
	 * @return
	 */
	public static String  parseCalendar2String(Calendar cal){
		return formatDate(cal.getTime());
	}
	
	/**
	 * calendar 转 string
	 * @param cal
	 * @param pattern
	 * @return
	 */
	public static String  parseCalendar2String(Calendar cal,String pattern){
		return formatDate(cal.getTime(),pattern);
	}
	
	/**
	 * Date 转  calendar
	 * @param strDate
	 * @return
	 */
	public static Calendar parseDate2Calendar(Date strDate){
		Calendar cal = Calendar.getInstance();
		cal.setTime(strDate);
		return cal;
	}
	
	/**
	 * calendar 转 date
	 * @param cal
	 * @return
	 */
	public static Date parseCalendar2Date(Calendar cal){
		return cal.getTime();
	}
	
	/**
	 * string 转 date 默认时间格式 YYYYMMDD
	 * @param strDate
	 * @return
	 */
	public static Date parseDate(String strDate) {
		return parseDate(strDate, null);
	}

	/**
	 * string 转 date 
	 * @param strDate
	 * @param pattern 时间格式
	 * @return
	 */
	public static Date parseDate(String strDate, String pattern) {
		Date date = null;
		try {
			if (pattern == null) {
				pattern = YYYYMMDD;
			}
			SimpleDateFormat format = new SimpleDateFormat(pattern);
			date = format.parse(strDate);
		} catch (Exception e) {
			System.out.println("formatDate error:"+e);
		}
		return date;
	}

	/**
	 * Date转string 默认时间格式 YYYYMMDD
	 * @param date
	 * @return
	 */
	public static String formatDate(Date date) {
		return formatDate(date, null);
	}

	/**
	 * Date转string
	 * @param date 
	 * @param pattern 时间格式
	 * @return
	 */
	public static String formatDate(Date date, String pattern) {
		String strDate = null;
		try {
			if (pattern == null) {
				pattern = YYYYMMDD;
			}
			SimpleDateFormat format = new SimpleDateFormat(pattern);
			strDate = format.format(date);
		} catch (Exception e) {
			System.out.println("formatDate error:"+e);
		}
		return strDate;
	}

	/**
	 * 取得日期：年
	 * @param date
	 * @return
	 */
	public static int getYear(Date date) {
		Calendar c = Calendar.getInstance();
		c.setTime(date);
		int year = c.get(Calendar.YEAR);
		return year;
	}

	/**
	 * 取得日期：月
	 * @param date
	 * @return
	 */
	public static int getMonth(Date date) {
		Calendar c = Calendar.getInstance();
		c.setTime(date);
		int month = c.get(Calendar.MONTH);
		return month + 1;
	}

	/**
	 * 取得日期：日
	 * @param date
	 * @return
	 */
	public static int getDay(Date date) {
		Calendar c = Calendar.getInstance();
		c.setTime(date);
		int da = c.get(Calendar.DAY_OF_MONTH);
		return da;
	}

	/**
	 * 取得当天日期是周几
	 * @param date
	 * @return
	 */
	public static int getWeekDay(Date date) {
		Calendar c = Calendar.getInstance();
		c.setTime(date);
		int week_of_year = c.get(Calendar.DAY_OF_WEEK);
		return week_of_year - 1;
	}

	/**
	 * 取得一年的第几周
	 * @param date
	 * @return
	 */
	public static int getWeekOfYear(Date date) {
		Calendar c = Calendar.getInstance();
		c.setTime(date);
		c.setFirstDayOfWeek(FIRST_DAY_OF_WEEK);
		int week_of_year = c.get(Calendar.WEEK_OF_YEAR);
		return week_of_year;
	}
	
	/**
	 * 取得一年有周的总数
	 * @param year
	 * @return
	 */
	public static int getWeekNumOfYear(int year){
		Calendar c = Calendar.getInstance();
		int weeks_of_year = c.getWeeksInWeekYear();
		return weeks_of_year;
	}

	/**
	 * 根据日期取得对应周的开始和结束日期
	 * @param date
	 * @param pattern
	 * @return
	 */
	public static String getWeekBeginAndEndDate(Date date, String pattern) {
		Date monday = getMondayOfWeek(date);
		Date sunday = getSundayOfWeek(date);
		return formatDate(monday, pattern) + " - "+ formatDate(sunday, pattern);
	}

	/**
	 * 根据日期取得对应周周一日期
	 * @param date
	 * @return
	 */
	public static Date getMondayOfWeek(Date date) {
		Calendar monday = Calendar.getInstance();
		monday.setTime(date);
		monday.setFirstDayOfWeek(FIRST_DAY_OF_WEEK);
		monday.set(Calendar.DAY_OF_WEEK, Calendar.MONDAY);
		return monday.getTime();
	}

	/**
	 * 根据日期取得对应周周日日期
	 * @param date
	 * @return
	 */
	public static Date getSundayOfWeek(Date date) {
		Calendar sunday = Calendar.getInstance();
		sunday.setTime(date);
		sunday.setFirstDayOfWeek(FIRST_DAY_OF_WEEK);
		sunday.set(Calendar.DAY_OF_WEEK, Calendar.SUNDAY);
		return sunday.getTime();
	}

	/**
	 * 取得月的剩余天数
	 * @param date
	 * @return
	 */
	public static int getRemainDayOfMonth(Date date) {
		int dayOfMonth = getDayOfMonth(date);
		int day = getPassDayOfMonth(date);
		return dayOfMonth - day;
	}

	/**
	 * 取得月已经过的天数
	 * @param date
	 * @return
	 */
	public static int getPassDayOfMonth(Date date) {
		Calendar c = Calendar.getInstance();
		c.setTime(date);
		return c.get(Calendar.DAY_OF_MONTH);
	}

	/**
	 * 取得月天数
	 * @param date
	 * @return
	 */
	public static int getDayOfMonth(Date date) {
		Calendar c = Calendar.getInstance();
		c.setTime(date);
		return c.getActualMaximum(Calendar.DAY_OF_MONTH);
	}

	/**
	 * 取得月第一天
	 * @param date
	 * @return
	 */
	public static Date getFirstDateOfMonth(Date date) {
		Calendar c = Calendar.getInstance();
		c.setTime(date);
		c.set(Calendar.DAY_OF_MONTH, c.getActualMinimum(Calendar.DAY_OF_MONTH));
		return c.getTime();
	}

	/**
	 * 取得月最后一天
	 * @param date
	 * @return
	 */
	public static Date getLastDateOfMonth(Date date) {
		Calendar c = Calendar.getInstance();
		c.setTime(date);
		c.set(Calendar.DAY_OF_MONTH, c.getActualMaximum(Calendar.DAY_OF_MONTH));
		return c.getTime();
	}

	/**
	 * 取得季度第一天
	 * @param date
	 * @return
	 */
	public static Date getFirstDateOfSeason(Date date) {
		return getFirstDateOfMonth(getSeasonDate(date)[0]);
	}

	/**
	 * 取得季度最后一天
	 * @param date
	 * @return
	 */
	public static Date getLastDateOfSeason(Date date) {
		return getLastDateOfMonth(getSeasonDate(date)[2]);
	}

	/**
	 * 取得季度天数
	 * @param date
	 * @return
	 */
	public static int getDayOfSeason(Date date) {
		int day = 0;
		Date[] seasonDates = getSeasonDate(date);
		for (Date date2 : seasonDates) {
			day += getDayOfMonth(date2);
		}
		return day;
	}

	/**
	 * 取得季度剩余天数
	 * @param date
	 * @return
	 */
	public static int getRemainDayOfSeason(Date date) {
		return getDayOfSeason(date) - getPassDayOfSeason(date);
	}

	/**
	 * 取得季度已过天数
	 * @param date
	 * @return
	 */
	public static int getPassDayOfSeason(Date date) {
		int day = 0;

		Date[] seasonDates = getSeasonDate(date);

		Calendar c = Calendar.getInstance();
		c.setTime(date);
		int month = c.get(Calendar.MONTH);

		if (month == Calendar.JANUARY || month == Calendar.APRIL
				|| month == Calendar.JULY || month == Calendar.OCTOBER) {// 季度第一个月
			day = getPassDayOfMonth(seasonDates[0]);
		} else if (month == Calendar.FEBRUARY || month == Calendar.MAY
				|| month == Calendar.AUGUST || month == Calendar.NOVEMBER) {// 季度第二个月
			day = getDayOfMonth(seasonDates[0])
					+ getPassDayOfMonth(seasonDates[1]);
		} else if (month == Calendar.MARCH || month == Calendar.JUNE
				|| month == Calendar.SEPTEMBER || month == Calendar.DECEMBER) {// 季度第三个月
			day = getDayOfMonth(seasonDates[0]) + getDayOfMonth(seasonDates[1])
					+ getPassDayOfMonth(seasonDates[2]);
		}
		return day;
	}

	/**
	 * 取得季度月
	 * @param date
	 * @return
	 */
	public static Date[] getSeasonDate(Date date) {
		Date[] season = new Date[3];

		Calendar c = Calendar.getInstance();
		c.setTime(date);

		int nSeason = getSeason(date);
		if (nSeason == 1) {// 第一季度
			c.set(Calendar.MONTH, Calendar.JANUARY);
			season[0] = c.getTime();
			c.set(Calendar.MONTH, Calendar.FEBRUARY);
			season[1] = c.getTime();
			c.set(Calendar.MONTH, Calendar.MARCH);
			season[2] = c.getTime();
		} else if (nSeason == 2) {// 第二季度
			c.set(Calendar.MONTH, Calendar.APRIL);
			season[0] = c.getTime();
			c.set(Calendar.MONTH, Calendar.MAY);
			season[1] = c.getTime();
			c.set(Calendar.MONTH, Calendar.JUNE);
			season[2] = c.getTime();
		} else if (nSeason == 3) {// 第三季度
			c.set(Calendar.MONTH, Calendar.JULY);
			season[0] = c.getTime();
			c.set(Calendar.MONTH, Calendar.AUGUST);
			season[1] = c.getTime();
			c.set(Calendar.MONTH, Calendar.SEPTEMBER);
			season[2] = c.getTime();
		} else if (nSeason == 4) {// 第四季度
			c.set(Calendar.MONTH, Calendar.OCTOBER);
			season[0] = c.getTime();
			c.set(Calendar.MONTH, Calendar.NOVEMBER);
			season[1] = c.getTime();
			c.set(Calendar.MONTH, Calendar.DECEMBER);
			season[2] = c.getTime();
		}
		return season;
	}

	/**
	 * 1 第一季度 2 第二季度 3 第三季度 4 第四季度
	 * @param date
	 * @return
	 */
	public static int getSeason(Date date) {

		int season = 0;

		Calendar c = Calendar.getInstance();
		c.setTime(date);
		int month = c.get(Calendar.MONTH);
		switch (month) {
		case Calendar.JANUARY:
		case Calendar.FEBRUARY:
		case Calendar.MARCH:
			season = 1;
			break;
		case Calendar.APRIL:
		case Calendar.MAY:
		case Calendar.JUNE:
			season = 2;
			break;
		case Calendar.JULY:
		case Calendar.AUGUST:
		case Calendar.SEPTEMBER:
			season = 3;
			break;
		case Calendar.OCTOBER:
		case Calendar.NOVEMBER:
		case Calendar.DECEMBER:
			season = 4;
			break;
		default:
			break;
		}
		return season;
	}

	/**
	 * 取得年第一天
	 * @param date
	 * @return
	 */
	public static Date getLastDateOfYear(Date date) {
		Calendar c = Calendar.getInstance();
		c.setTime(date);
		c.set(Calendar.DAY_OF_YEAR, c.getActualMaximum(Calendar.DAY_OF_YEAR));
		return c.getTime();
	}

	/**
	 * 取得年最后一天
	 * @param date
	 * @return
	 */
	public static Date getFirstDateOfYear(Date date) {
		Calendar c = Calendar.getInstance();
		c.setTime(date);
		c.set(Calendar.DAY_OF_YEAR, c.getActualMinimum(Calendar.DAY_OF_YEAR));
		return c.getTime();
	}

	public static void main(String[] args) {

		String strDate = "2016-06-23";

		Date date = parseDate(strDate);

		System.out.println(strDate + " 今天是哪一年？" + getYear(date));
		System.out.println(strDate + " 今天是哪个月？" + getMonth(date));
		System.out.println(strDate + " 今天是几号？" + getDay(date));
		System.out.println(strDate + " 今天是周几？" + getWeekDay(date));
		System.out.println(strDate + " 是一年的第几周？" + getWeekOfYear(date));
		System.out.println(strDate + " 所在周起始结束日期？"
				+ getWeekBeginAndEndDate(date, "yyyy年MM月dd日"));
		System.out.println(strDate + " 所在周周一是？"
				+ formatDate(getMondayOfWeek(date)));
		System.out.println(strDate + " 所在周周日是？"
				+ formatDate(getSundayOfWeek(date)));

		System.out.println(strDate + " 当月第一天日期？"
				+ formatDate(getFirstDateOfMonth(date)));
		System.out.println(strDate + " 当月最后一天日期？"
				+ formatDate(getLastDateOfMonth(date)));
		System.out.println(strDate + " 当月天数？" + getDayOfMonth(date));
		System.out.println(strDate + " 当月已过多少天？" + getPassDayOfMonth(date));
		System.out.println(strDate + " 当月剩余多少天？" + getRemainDayOfMonth(date));

		System.out.println(strDate + " 所在季度第一天日期？"
				+ formatDate(getFirstDateOfSeason(date)));
		System.out.println(strDate + " 所在季度最后一天日期？"
				+ formatDate(getLastDateOfSeason(date)));
		System.out.println(strDate + " 所在季度天数？" + getDayOfSeason(date));
		System.out.println(strDate + " 所在季度已过多少天？" + getPassDayOfSeason(date));
		System.out
				.println(strDate + " 所在季度剩余多少天？" + getRemainDayOfSeason(date));
		System.out.println(strDate + " 是第几季度？" + getSeason(date));
		System.out.println(strDate + " 所在季度月份？"
				+ formatDate(getSeasonDate(date)[0], "yyyy年MM月") + "/"
				+ formatDate(getSeasonDate(date)[1], "yyyy年MM月") + "/"
				+ formatDate(getSeasonDate(date)[2], "yyyy年MM月"));

		System.out.println(strDate + " 当年第一天日期？"
				+ formatDate(getFirstDateOfYear(date)));
		System.out.println(strDate + " 当年最后一天日期？"
				+ formatDate(getLastDateOfYear(date)));
	}
}