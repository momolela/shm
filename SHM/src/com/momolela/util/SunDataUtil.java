package com.momolela.util;

import java.math.BigDecimal;

/**
 * 按照数据类型和数据长度转换数据
 * @ClassName: SunDataUtil
 * @Description: 
 * @author: momolela
 * @date 2016-9-8 上午8:52:38
 * 
 */
public class SunDataUtil {
	
	public static Object dataFormat(Object value,String dataType,int dataLength){
		if(value instanceof Double){
			double vd=Double.parseDouble(String.valueOf(value));
			if(Double.isInfinite(vd)){
				return Double.POSITIVE_INFINITY;
			}else if(Double.isNaN(vd)){
				return Double.NaN;
			}
		}
		
		Object v =null;
		if("int".equals(dataType)){
			if(value == null){
				v = 0;
			}else{
				v=new BigDecimal(SunDBObjHelper.dbObjToString(value)).setScale(0, BigDecimal.ROUND_HALF_UP);
			}
		}else if("number".equals(dataType)){
			double vd=Double.parseDouble(String.valueOf(value));
			v = Math.round(vd * Math.pow(10,dataLength)) / Math.pow(10,dataLength);
		}else{
			v = value;
		}
		return v;
	}
	
	
	public static void main(String[] args){
		
		Object v = dataFormat("0.3456","number",2);
		Object v1 = dataFormat("2.5456","int",2);
		System.out.println(v);
		System.out.println(v1);
		
	}
	
	
	
}
