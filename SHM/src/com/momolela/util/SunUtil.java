package com.momolela.util;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

public class SunUtil {

	//替换字符串
	public static String multiReplace(String source, Object[] arr) {
		for (int i = 0; i < arr.length; i++) {
			String regex = "{" + i + "}";
			source = source.replace(regex, arr[i] == null ? null : arr[i].toString());
		}
		return source;
	}
	
	//list去重复
	public static List<Map<String,Object>> getNewList(List<Map<String,Object>> li){
		List<Map<String,Object>> list = new ArrayList<Map<String,Object>>();
		for(int i=0; i<li.size(); i++){
			Map<String, Object> map = li.get(i); //获取传入集合对象的每一个元素
			if(!list.contains(map)){ //查看新集合中是否有指定的元素，如果没有则加入
				list.add(map);
			}
		}
		return list; //返回集合
	}

	
	/**
	 * 取两个数组公共元素
	 * @param aList
	 * @param bList
	 * @return
	 */
	public static List<String> findCommonList(List<String> aList, List<String> bList){
		if(aList==null||aList.size()==0){
			return bList;
		}
        List<String> commonList = new ArrayList<String>();// 保存a和b共同元素的list
        // 循环a数组
        for (String aValue : aList) {
            // 判断b中是否包含元素aValue,包含则增加为a和b的共元素
            if (bList.contains(aValue)) {
                commonList.add(aValue);
            }
        }
        return commonList;
	}
}
