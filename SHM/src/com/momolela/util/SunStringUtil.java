package com.momolela.util;

import java.text.MessageFormat;

public class SunStringUtil {
	
	/**
	 * StringBuffer替换字符串
	 * @param sb
	 * @param oldStr
	 * @param newStr
	 * @return
	 */
	public static StringBuffer stringBufferReplace(StringBuffer sb, String oldStr,String newStr) {
		int i = sb.indexOf(oldStr);
        int oldLen = oldStr.length();
        int newLen = newStr.length();
        while (i > -1) {
            sb.delete(i, i + oldLen);
            sb.insert(i, newStr);
            i = sb.indexOf(oldStr, i + newLen);
        }
		return sb;
	}
	
	/**
	 * 按照位置顺序替换字符串
	 * @param str 
	 * @param Object...objects
	 * @return
	 */
	public static String stringReplaceIndexStr(String str,Object...objects){
		return str = MessageFormat.format(str, objects);
	}
	
	
	
	public static void main(String[] args){
		StringBuffer sb = new StringBuffer("trsstrcccctrnnntr1");
		sb = stringBufferReplace(sb,"tr","HHH");
		System.out.println(sb.toString());
		String s1 = stringReplaceIndexStr("trsstrcc{0}cctrn{1}nntr1", "WWW","OOO");
		System.out.println(s1);
	}
	
}
