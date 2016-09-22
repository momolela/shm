package com.momolela.util;

import java.util.HashSet;
import java.util.Iterator;
import java.util.Map;
import java.util.Map.Entry;
import java.util.Set;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import com.greenpineyu.fel.FelEngine;
import com.greenpineyu.fel.FelEngineImpl;
import com.greenpineyu.fel.context.FelContext;

public class SunExprUtil {
	
	/**
	 * FEL表达式计算引擎 --号称速率第一
	 * http://blog.csdn.net/qq584852076/article/details/51656484
	 * @param exp 表达式
	 * @param map 参数数据
	 * @param baseParam 表达式中元素集合
	 * @return
	 */
	public static Object run(String exp,Map<String,Object> map,Set<String> baseParam){
		FelEngine fel = new FelEngineImpl();
		FelContext ctx = fel.getContext();
		if(map!=null && baseParam!=null){
			Iterator<String> it = baseParam.iterator();
			while(it.hasNext()){
				String key = it.next();
				if(map.containsKey(key)){
					ctx.set(key, map.get(key));
				}else{
					ctx.set(key, 0);
				}
				
			}
		}
		Object result = fel.eval(exp);
		System.out.println("fel result:"+result); 
		return result;
	}
	
	
	/**
	 * FEL表达式计算引擎 --号称速率第一
	 * http://blog.csdn.net/qq584852076/article/details/51656484
	 * @param exp 表达式
	 * @param map 参数
	 * @return
	 */
	public static Object run(String exp,Map<String,Object> map){
		FelEngine fel = new FelEngineImpl();
		FelContext ctx = fel.getContext();
		if(map!=null){
			for(Entry<String,Object> entry : map.entrySet()){
				String key = entry.getKey();
				Object value = entry.getValue();
				if(value==null)
					ctx.set(key, 0);
				else
					ctx.set(key, value);
			}
		}
		Object result = fel.eval(exp);
		System.out.println("fel result:"+result); 
		return result;
	}
	
	/**
	 * 解析表达式
	 * @param exp 表达式
	 * @return Set<String>
	 */
	public static Set<String> parseExpr(String exp){
		Set<String> paramSet = new HashSet<String>();
		Pattern p = Pattern.compile("\\[[^]]+\\]|<(.*?)>");
		Matcher m = p.matcher(exp);
		while (m.find()) {
			String item=m.group();
			item = item.replace("[", "").replace("]", "").replace("<", "").replace(">", "");
			System.out.println(item);
			paramSet.add(item);
		}
		return paramSet;
	}
	
	/*public static void main(String[] args){
		String exp1 = "([a]-([a+2])+b)+[c]";
		String exp2 = "(<a>-(<a+2>)+b)+<c2>";
		String exp3 = "[a]/<d>";
		String exp4 = "([INDC000053]+120)/[INDB000052]+[[INDC000053]*[INDB000010]]";
		// String exp4 =
		// "([INDC000053]+120)/[INDB000052]+[INDC000053]*[INDB000010]";
		// parseExpr(exp1);
		// parseExpr(exp2);
		// parseExpr(exp4);
		// String exp = "(a-(a+2)+b)+c";
		String exp = "(a+b)/c";
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("a", 12);
		map.put("b", 12);
		// map.put("c", null);
		Set<String> s = new HashSet<String>();
		s.add("a");
		s.add("b");
		s.add("c");
		Object obj = run(exp, map, s);
		if (obj instanceof Double) {
			System.out.println("ss" + 1);
			if ((Double) obj == Double.POSITIVE_INFINITY) {
				System.out.println("asdfasdf");
			}
		}

		double l = Double.POSITIVE_INFINITY;
		System.out.println("ss" + obj);

		// run(exp,map);
	}*/
	
}
