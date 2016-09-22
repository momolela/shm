package com.momolela.util;

import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.ByteArrayInputStream;
import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.google.common.collect.Maps;

public class SunFileOperate {

	private static final int BUFFEREDSIZE = 1024 * 1024;

	// public static List<String> list= new ArrayList<String>();
	/**
	 * 转化文件为字节流
	 * 
	 * @param file
	 * @return
	 * @throws Exception
	 * @throws HAIException
	 */
	public static byte[] File2ByteStream(File file) throws Exception {
		// String fileName = file.getName();

		BufferedInputStream in = null;
		ByteArrayOutputStream out = null;
		FileInputStream fis = null;
		try {
			fis = new FileInputStream(file);
			in = new BufferedInputStream(fis);
			out = new ByteArrayOutputStream();
			byte[] temp = new byte[BUFFEREDSIZE];
			int size = 0;
			while ((size = in.read(temp)) != -1) {
				out.write(temp, 0, size);
			}
			out.flush();
		} finally {
			fis.close();
			in.close();
			out.close();
		}
		return out.toByteArray();
	}

	/**
	 * 转化字节流转为文件
	 * 
	 * @param by
	 * @param file
	 * @throws Exception
	 * @throws HAIException
	 */
	public static void ByteStream2File(byte[] by, File file) throws Exception {
		// if (!file.exists())
		createFolder(file);
		ByteArrayInputStream in = null;
		BufferedOutputStream out = null;
		FileOutputStream fos = null;
		try {

			fos = new FileOutputStream(file);
			in = new ByteArrayInputStream(by);
			out = new BufferedOutputStream(fos);
			byte[] buff = new byte[BUFFEREDSIZE];
			int size = 0;
			while ((size = in.read(buff)) != -1) {
				out.write(buff, 0, size);
			}
			out.flush();
		} finally {
			if (fos != null)
				fos.close();
			if (in != null)
				in.close();
			if (out != null)
				out.close();
		}
	}

	/**
	 * 通过文件夹读取文件，传入文件名、文件日期、文件大小
	 */
	public static Map<String, Object> readFile(String path) {
		File myFile = new File(path);
		Map<String, Object> fMap = new HashMap<String, Object>();
		for (int i = 0; i < scanFile(myFile).size(); i++) {
			File file = (File) scanFile(myFile).get(i);
			String fName = file.getName();
			String fDate = String.valueOf(file.lastModified());
			String fLength = String.valueOf(file.length());
			fMap.put(fName, fDate + fLength);
		}
		return fMap;
	}

	/**
	 * 递归删除文件
	 * 
	 * @param file
	 */
	public static void deleteFile(File file) {
		if (file.exists())
			file.delete();
	}

	/**
	 * 删除文件夹
	 * 
	 * @param file
	 * @return
	 */
	public static void deleteFolder(File file) {
		if (file.isDirectory()) {
			File[] files = file.listFiles();
			for (File f : files) {
				deleteFolder(f);
			}
		}
		file.delete();

	}

	/**
	 * 获取文件夹下所有的文件夹名
	 * 
	 * @param file
	 * @return
	 */
	public static List<String> getDirectory(File file) {
		List<String> list = new ArrayList<String>();
		if (file.isDirectory()) {
			for (File f : file.listFiles()) {
				getDirectory(f, list);
			}
		}
		return list;
	}

	private static void getDirectory(File file, List<String> list) {
		if (file.isDirectory()) {
			File[] files = file.listFiles();
			for (File f : files) {
				getDirectory(f, list);
			}
			list.add(file.getAbsolutePath());
		}
	}

	/**
	 * 建立文件夹
	 * 
	 * @param path
	 * @param fName
	 */
	public static void createFolder(File file) {
		String separator = "";
		if (SunOSUtil.getOsType() == SunOSUtil.OSType.WINDWODS) {
			separator = "\\\\";
		} else if (SunOSUtil.getOsType() == SunOSUtil.OSType.LIUNX) {
			separator = "/";
		}
		String folders[] = file.getAbsolutePath().split(separator);
		String p = "";
		for (int i = 0; i < folders.length; i++) {
			if (p != "") {
				p = p + File.separator + folders[i] + File.separator;
			} else {
				p += folders[i] + File.separator;
			}
			File newfile = new File(p);
			if (!newfile.exists()) {
				if (!SunFileOperate.isFile(file) || i < folders.length - 1)
					newfile.mkdirs();
			}
		}
	}

	// 搜索文件夹下的文件，返回文件列表
	public static List<File> scanFile(File root) {
		List<File> fileInfo = new ArrayList<File>();
		if (root.exists()) {
			if (root.isFile())// loanin 如果是一个文件，则直接返回该文件
				fileInfo.add(root);
			else {
				File[] files = root.listFiles();
				if (files == null && !root.isDirectory()) {
					fileInfo.add(root);
				} else if (files != null) {
					for (File file : files) {// 逐个遍历文件
						if (file.isDirectory()) { // 如果是文件夹，则进一步遍历，递归调用
							List<File> ff = scanFile(file);
							fileInfo.addAll(ff);
						} else {
							fileInfo.add(file);
						}
					}
				}
			}
		}
		return fileInfo;
	}

	/**
	 * 复制文件夹
	 * 
	 * @param sourceDir
	 * @param targetDir
	 * @throws IOException
	 */
	public static void copyDirectiory(String sourceDir, String targetDir) throws IOException {
		if (!new File(sourceDir).exists())
			return;
		createFolder(new File(targetDir));
		File[] file = (new File(sourceDir)).listFiles();
		for (int i = 0; i < file.length; i++) {
			if (file[i].isFile()) {
				File sourceFile = file[i];
				File targetFile = new File(new File(targetDir).getAbsolutePath() + File.separator + file[i].getName());
				copyFile(sourceFile, targetFile);
			}
			if (file[i].isDirectory()) {
				String dir1 = sourceDir + File.separator + file[i].getName();
				String dir2 = targetDir + File.separator + file[i].getName();
				copyDirectiory(dir1, dir2);
			}
		}
	}

	/**
	 * 复制文件
	 * 
	 * @param sourceFile
	 * @param targetFile
	 * @throws IOException
	 */
	public static void copyFile(File sourceFile, File targetFile) throws IOException {
		BufferedInputStream inBuff = null;
		BufferedOutputStream outBuff = null;
		createFolder(targetFile);
		try {
			// 新建文件输入流并对它进行缓冲
			inBuff = new BufferedInputStream(new FileInputStream(sourceFile));

			// 新建文件输出流并对它进行缓冲
			outBuff = new BufferedOutputStream(new FileOutputStream(targetFile));
			outBuff.flush();
			// 缓冲数组
			byte[] b = new byte[1024 * 5];
			int len;
			while ((len = inBuff.read(b)) != -1) {
				outBuff.write(b, 0, len);
			}
			// 刷新此缓冲的输出流
			outBuff.flush();
			// 关闭流
		} finally {
			// 关闭流
			if (inBuff != null)
				inBuff.close();
			if (outBuff != null)
				outBuff.close();
		}
	}

	public static boolean isFile(File file) {
		// if(file.exists())
		// return file.isFile();
		return isFile(file.getAbsolutePath());
	}

	public static boolean isFile(String filename) {
		if ((filename != null) && (filename.length() > 0)) {
			String separator = "";
			if (SunOSUtil.getOsType() == SunOSUtil.OSType.WINDWODS) {
				separator = "\\\\";
			} else if (SunOSUtil.getOsType() == SunOSUtil.OSType.LIUNX) {
				separator = "/";
			}
			String folders[] = filename.split(separator);
			if (folders.length > 0) {
				filename = folders[folders.length - 1];
				int dot = filename.lastIndexOf('.');
				if (dot > -1) {
					return true;
				}
			}
		}
		return false;
	}

	public static String getExtensionName(String filename) {
		if ((filename != null) && (filename.length() > 0)) {
			int dot = filename.lastIndexOf('.');
			if ((dot > -1) && (dot < (filename.length() - 1))) {
				return filename.substring(dot + 1);
			}
		}
		return filename;
	}
	
	
	
	/**
	 * 判断文件是否存在，返回map，带两参：1.type 2.File
	 * type = true(存在)，false(不存在)
	 * 例   ：传入   pathandfilename = XMLSource\XMLSource
	 * 例   ：传入filename = AAA.xml
	 * @param path
	 * @param filename
	 * @return map.put("type", boolea);map.put("File", File);
	 */
	public static Map<String,Object> isFileExists(String path,String filename){
			if(path.endsWith("\\")){
				path.substring(0,path.length()-1);
			}
			return isFileExists(path+File.separator+filename);
	}
	
	/**
	 * 判断文件是否存在,返回map，带两参：1.type 2.File
	 * type = true(存在)，false(不存在)
	 * 例   ：传入   pathandfilename = XMLSource\AAA.xml
	 * @param pathandfilename
	 * @return map.put("type", boolea);map.put("File", File);
	 */
	public static Map<String,Object> isFileExists(String pathandfilename){
			Map<String,Object> map = Maps.newHashMap();
			File f = new File(pathandfilename);
			if(!f.exists()){
				map.put("type", false);
				map.put("File", f);
				return map;			
			}else{
				map.put("type", true);
				map.put("File", f);
				return map;	
			}

	}
}
