package com.momolela.util;

import java.io.BufferedReader;
import java.io.File;
import java.io.IOException;
import java.io.InputStreamReader;
import java.text.SimpleDateFormat;
import java.util.Date;

import org.apache.commons.io.FileUtils;

public class TzAutoProjectUtil {
	
	private static String domainName = "momolela";
	
	private static String dbName = "shm";
	private static String dbUserName = "root";
	private static String dbPassword = "";
	
	private static String author = "momolela";
	private static  String description = "超级管理员";
	private static  String date = new SimpleDateFormat("yyyy年MM月dd日 HH:mm:ss").format(new Date());
	private static  String entity = "Admin";
	private static  String lowEntity = "admin";
	
	//定义所有模板目录
	/**
	 * 创建实体类方法
	 * 方法名：createEntity
	 * @throws IOException 
	 */
	public static void createEntity() throws IOException{
		String newClassName = getPath("src\\com\\"+domainName+"\\model")+"\\"+entity+".java";
		String actionTempContent = getPath("template\\entity.txt");
		String fileName = entity+".java";
		String entitypackage = getPath("src\\com\\"+domainName+"\\model\\");
		isExitAndCreateFile(newClassName, actionTempContent, fileName, entitypackage);
	}
	
	/**
	 * 创建dao接口方法
	 * 方法名：createDao
	 * @throws IOException 
	 */
	public static void createDao() throws IOException{
		String newClassName = getPath("src\\com\\"+domainName+"\\dao\\"+lowEntity)+"\\"+"I"+entity+"Dao.java";
		String actionTempContent = getPath("template\\dao.txt");
		String fileName = "I"+entity+"Dao.java";
		String entitypackage = getPath("src\\com\\"+domainName+"\\dao\\"+lowEntity);
		isExitAndCreateFile(newClassName, actionTempContent, fileName, entitypackage);
	}
	

	/**
	 * 创建dao接口的实现方法
	 * 方法名：createDaoImpl
	 * @throws IOException 
	 */
	public static void createDaoImpl() throws IOException{
		String newClassName = getPath("src\\com\\"+domainName+"\\dao\\"+lowEntity+"\\impl")+"\\"+entity+"DaoImpl.java";
		String actionTempContent = getPath("template\\daoImpl.txt");
		String fileName = entity+"DaoImpl.java";
		String entitypackage = getPath("src\\com\\"+domainName+"\\dao\\"+lowEntity+"\\impl");
		isExitAndCreateFile(newClassName, actionTempContent, fileName, entitypackage);
	}
	
	/**
	 * 创建service接口方法
	 * 方法名：createService
	 * @throws IOException 
	 */
	public static void createService() throws IOException{
		String newClassName = getPath("src\\com\\"+domainName+"\\service\\"+lowEntity)+"\\"+"I"+entity+"Service.java";
		String actionTempContent = getPath("template\\service.txt");
		String fileName = "I"+entity+"Service.java";
		String entitypackage = getPath("src\\com\\"+domainName+"\\service\\"+lowEntity);
		isExitAndCreateFile(newClassName, actionTempContent, fileName, entitypackage);
	}
	
	/**
	 * 创建service接口实现的方法
	 * 方法名：createServiceImpl
	 * @throws IOException 
	 */
	public static void createServiceImpl() throws IOException{
		String newClassName = getPath("src\\com\\"+domainName+"\\service\\"+lowEntity+"\\impl")+"\\"+entity+"ServiceImpl.java";
		String actionTempContent = getPath("template\\serviceImpl.txt");
		String fileName = entity+"ServiceImpl.java";
		String entitypackage = getPath("src\\com\\"+domainName+"\\service\\"+lowEntity+"\\impl");
		isExitAndCreateFile(newClassName, actionTempContent, fileName, entitypackage);
	}
	
	/**
	 * 创建相关模块对象的初始化action
	 * 方法名：createAction
	 * @throws IOException 
	 */
	public static void createAction() throws IOException{
		String newClassName = getPath("src\\com\\"+domainName+"\\web\\"+lowEntity)+"\\"+entity+"Action.java";
		String actionTempContent = getPath("template\\action.txt");
		String fileName = entity+"Action.java";
		String entitypackage = getPath("src\\com\\"+domainName+"\\web\\"+lowEntity);
		isExitAndCreateFile(newClassName, actionTempContent, fileName, entitypackage);
	}
	
	/**
	 * 创建页面的方法
	 * 方法名：createList
	 * @throws IOException 
	 */
	public static void createList() throws IOException{
		String newClassName = getPath("WebRoot\\WEB-INF\\pages\\"+lowEntity)+"\\"+"list.jsp";
		String actionTempContent = getPath("template\\list.txt");
		String fileName = "list.jsp";
		String entitypackage = getPath("WebRoot\\WEB-INF\\pages\\"+lowEntity);
		isExitAndCreateFile(newClassName, actionTempContent, fileName, entitypackage);
	}
	
	/**
	 * listtemplate页面
	 * 方法名：createListTemplate
	 * @throws IOException 
	 */
	public static void createListTemplate() throws IOException{
		String newClassName = getPath("WebRoot\\WEB-INF\\pages\\"+lowEntity)+"\\"+"listTemplate.jsp";
		String actionTempContent = getPath("template\\listTemplate.txt");
		String fileName = "listTemplate.jsp";
		String entitypackage = getPath("WebRoot\\WEB-INF\\pages\\"+lowEntity);
		isExitAndCreateFile(newClassName, actionTempContent, fileName, entitypackage);
	}
	
	/**
	 * js
	 * 方法名：createJs
	 * @throws IOException 
	 */
	public static void createJs() throws IOException{
		String newClassName = getPath("WebRoot\\js\\admin\\"+lowEntity)+"\\"+"mo_"+lowEntity+".js";
		String actionTempContent = getPath("template\\js.txt");
		String fileName = "mo_"+lowEntity+".js";
		String entitypackage = getPath("WebRoot\\js\\admin\\"+lowEntity);
		isExitAndCreateFile(newClassName, actionTempContent, fileName, entitypackage);
	}
	
	/**
	 * edit.jsp
	 * 方法名：createAdd
	 * @throws IOException 
	 */
	public static void createAdd() throws IOException{
		String newClassName = getPath("WebRoot\\WEB-INF\\pages\\"+lowEntity)+"\\"+"edit.jsp";
		String actionTempContent = getPath("template\\edit.txt");
		String fileName = "edit.jsp";
		String entitypackage = getPath("WebRoot\\WEB-INF\\pages\\"+lowEntity);
		isExitAndCreateFile(newClassName, actionTempContent, fileName, entitypackage);
	}
	
	/**
	 * web.xml文件生成
	 * 方法名：createWebXml
	 * @throws IOException 
	 */
	public static void createWebXml() throws IOException{
		String newClassName = getPath("WebRoot\\WEB-INF")+"\\"+"web.xml";
		String actionTempContent = getPath("template\\webXml.txt");
		String fileName = "web.xml";
		String entitypackage = getPath("WebRoot\\WEB-INF");
		isExitAndCreateFile(newClassName, actionTempContent, fileName, entitypackage);
	}
	
	/**
	 * applicationContext.xml文件生成
	 * 方法名：createDbProperties
	 * @throws IOException 
	 */
	public static void createApplicationContext() throws IOException{
		String newClassName = getPath("config")+"\\"+"applicationContext.xml";
		String actionTempContent = getPath("template\\applicationContext.txt");
		String fileName = "applicationContext.xml";
		String entitypackage = getPath("config");
		isExitAndCreateFile(newClassName, actionTempContent, fileName, entitypackage);
	}
	
	/**
	 * log4j.properties文件生成
	 * 方法名：createLog4jProperties
	 * @throws IOException 
	 */
	public static void createLog4jProperties() throws IOException{
		String newClassName = getPath("config")+"\\"+"log4j.properties";
		String actionTempContent = getPath("template\\log4jProperties.txt");
		String fileName = "log4j.properties";
		String entitypackage = getPath("config");
		isExitAndCreateFile(newClassName, actionTempContent, fileName, entitypackage);
	}
	
	/**
	 * db.properties文件生成
	 * 方法名：createDbProperties
	 * @throws IOException 
	 */
	public static void createDbProperties() throws IOException{
		String newClassName = getPath("config")+"\\"+"db.properties";
		String actionTempContent = getPath("template\\dbProperties.txt");
		String fileName = "db.properties";
		String entitypackage = getPath("config");
		isExitAndCreateFile(newClassName, actionTempContent, fileName, entitypackage);
	}
	
	/**
	 * struts.properties文件生成
	 * 方法名：createStrutsProperties
	 * @throws IOException 
	 */
	public static void createStrutsProperties() throws IOException{
		String newClassName = getPath("config")+"\\"+"struts.properties";
		String actionTempContent = getPath("template\\strutsProperties.txt");
		String fileName = "struts.properties";
		String entitypackage = getPath("config");
		isExitAndCreateFile(newClassName, actionTempContent, fileName, entitypackage);
	}
	
	/**
	 * 替换用的函数
	 * @param path
	 * @return
	 * @throws IOException
	 */
	public static String replaceModel(String path) throws IOException{
		String result = FileUtils.readFileToString(new File(path),"UTF-8");
		result = result.replaceAll("\\[domainName\\]", domainName)
				.replaceAll("\\[dbName\\]", dbName)
				.replaceAll("\\[dbUserName\\]", dbUserName)
				.replaceAll("\\[dbPassword\\]", dbPassword)
				.replaceAll("\\[entity\\]", entity)
				.replaceAll("\\[lowEntity\\]", lowEntity)
				.replaceAll("\\[author\\]", author)
				.replaceAll("\\[description\\]", description)
				.replaceAll("\\[date\\]", date);
		return result;
	}
	
	/**
	 * 获取模版文件的地址
	 * 不难很简单---javase学习的IO流+模板替换
	 * @param appendPath
	 * @return
	 */
	public static String getPath(String appendPath){
		String path = System.getProperty("user.dir");
		if(TzStringUtils.isEmpty(appendPath)){
			return path;
		}else{
			return path+"\\"+appendPath;
		}
	}
	
	/**
	 * 生成文件的过程的函数
	 * @param actionTempContent 模版文件的路径
	 * @param fileName 要生成的文件名字
	 * @param entitypackage entity存放的位置
	 */
	public static void bulidClass(String actionTempContent, String fileName, String entitypackage){
		try {
			//模板页面
			String daoTemplate = actionTempContent;	// getPath("template\\entity.txt")
			//写入到磁盘里面去
			String result = replaceModel(daoTemplate);
			//要生成的根目录
			String daoRoot =  entitypackage;	// getPath("src\\com\\"+domainName+"\\model\\")
			File rootPath  = new File(daoRoot);
			//如果不存在那么久创建
			if(!rootPath.exists())rootPath.mkdirs();
			//产生接口文件
			File daoJava = new File(rootPath, fileName);
			//讲模板中替换好的数据通过写入目录中去
			FileUtils.writeStringToFile(daoJava, result, "UTF-8");
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	/**
	 * 判断是否存在，并且创建文件
	 * @param newClassName 要生成的文件的路径
	 * @param actionTempContent 模版文件的路径
	 * @param fileName 要生成的文件名字
	 * @param entitypackage entity存放的位置
	 * @throws IOException
	 */
	public static void isExitAndCreateFile(String newClassName,String actionTempContent,String fileName,String entitypackage) throws IOException{
		if(!TmFileUtil.isExist(newClassName)){
			// 生成文件的过程
			bulidClass(actionTempContent, fileName, entitypackage);
			System.out.println("[TM构建类][Entity]===>  " +newClassName+"  [OK]");
		}else{
			System.out.println("[TM构建类][Entity]===>  " +fileName+" 该文件已经存在是否覆盖[y/n]!");
			BufferedReader reader = new BufferedReader(new InputStreamReader(System.in));
			String line = reader.readLine();
			if(line!=null && line.equalsIgnoreCase("y")){
				// 生成文件的过程
				bulidClass(actionTempContent, fileName, entitypackage);
				System.out.println("[TM构建类][Entity]===>  " +newClassName+"  [覆盖OK]");
			}
		}
	}
	
	public static void main(String[] args) throws IOException {
		// Properties properties = System.getProperties();
		// for (Map.Entry<Object, Object> entry: properties.entrySet()) {
		// System.out.println(entry.getKey()+"==="+entry.getValue());
		// }
//		 createWebXml();
//		 createDbProperties();
//		 createApplicationContext();
//		 createLog4jProperties();
//		 createStrutsProperties();
		 createEntity();
//		 createDao();
//		 createDaoImpl();
//		 createService();
//		 createServiceImpl();
//		 createAction();
//		 createList();
//		 createListTemplate();
//		 createJs();
//		 createAdd();
	}
}
