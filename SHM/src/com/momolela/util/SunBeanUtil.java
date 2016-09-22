package com.momolela.util;

import java.beans.BeanInfo;
import java.beans.IntrospectionException;
import java.beans.Introspector;
import java.beans.PropertyDescriptor;
import java.lang.reflect.Field;
import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Method;
import java.util.ArrayList;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

/**
 * javabean map互转
 * @author Administrator
 *
 */
public class SunBeanUtil {
	/**
	 * map转javaBean
	 * @param type
	 * @param map
	 * @return
	 * @throws IntrospectionException
	 * @throws IllegalAccessException
	 * @throws InstantiationException
	 * @throws InvocationTargetException
	 */
	@SuppressWarnings("rawtypes")
	public static <T>T transMap2Bean(Class<T> c, Map map)
            throws IntrospectionException, IllegalAccessException,
            InstantiationException, InvocationTargetException {
        BeanInfo beanInfo = Introspector.getBeanInfo(c); // 获取类属性
        T obj = c.newInstance(); // 创建 JavaBean 对象
        // 给 JavaBean 对象的属性赋值
        PropertyDescriptor[] propertyDescriptors =  beanInfo.getPropertyDescriptors();
        for (int i = 0; i< propertyDescriptors.length; i++) {
            PropertyDescriptor descriptor = propertyDescriptors[i];
            String propertyName = descriptor.getName();

            if (map.containsKey(propertyName)) {
                // 下面一句可以 try 起来，这样当一个属性赋值失败的时候就不会影响其他属性赋值。
                Object value = map.get(propertyName);

                Object[] args = new Object[1];
                args[0] = value;

                descriptor.getWriteMethod().invoke(obj, args);
            }
        }
        return obj;
    }
	
	/**
	 * List<map>转List<javaBean>
	 * @param type
	 * @param mapList
	 * @return
	 * @throws IllegalAccessException
	 * @throws InstantiationException
	 * @throws InvocationTargetException
	 * @throws IntrospectionException
	 */
	@SuppressWarnings({ "unchecked", "rawtypes" })
	public static  List transMapList2BeanList(Class type,List<Map<String,Object>> mapList){  
		List<Object> beanList = new ArrayList<Object>();
		try {
			for(Map<String,Object> map : mapList){
				Object bean = transMap2Bean(type,map);
				beanList.add(bean);
			}
		} catch (IllegalAccessException e) {
			e.printStackTrace();
		} catch (InstantiationException e) {
			e.printStackTrace();
		} catch (InvocationTargetException e) {
			e.printStackTrace();
		} catch (IntrospectionException e) {
			e.printStackTrace();
		}catch(Exception e){
			e.printStackTrace();
		}
		return beanList;
	}
	
	
	/**
	 * javaBean转Map
	 * @param obj
	 * @return
	 */
	public static Map<String,Object> transBean2Map(Object obj){  
        Map<String,Object> map = new LinkedHashMap<String,Object>();  
        Field[] fields = obj.getClass().getDeclaredFields();  
        for(int i=0; i<fields.length; i++){  
            String field = fields[i].toString();  
            String[] keys = field.split("\\.");  
            String key = keys[keys.length-1];  
            char toUpperCase = (char)(key.charAt(0)-32);  
            String keyUpper = key.replaceFirst(new String(new char[]{key.charAt(0)}) ,new String(new char[]{toUpperCase}) );//key.replace(key.charAt(0),toUpperCase);  
            Method getMethod;  
            try {  
            	if(keyUpper.equals("SerialVersionUID"))
            		continue;
                getMethod = obj.getClass().getDeclaredMethod("get"+keyUpper);//根据 field得到对应的get方法  
                Object value = getMethod.invoke(obj);  
                map.put(key, value);  
            } catch (NoSuchMethodException e) {  
                e.printStackTrace();  
            } catch (SecurityException e) {  
                e.printStackTrace();  
            }catch (IllegalAccessException e) {  
                e.printStackTrace();  
            } catch (IllegalArgumentException e) {  
                e.printStackTrace();  
            } catch (InvocationTargetException e) {  
                e.printStackTrace();  
            }         
        }  
        return map;  
    } 
	
	/**
	 * List<javaBean>转List<Map>
	 * @param obj
	 * @return
	 */
	public static List<Map<String,Object>> transBeanList2MapList(List<Object> objList){  
		List<Map<String, Object>> list = new ArrayList<Map<String, Object>>();
		if(objList!=null && objList.size()>0){
			for(Object dim:objList){
				list.add(SunBeanUtil.transBean2Map(dim));
			}
		}
		return list;
	}
	
	
}
