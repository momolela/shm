package com.momolela.util;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.MalformedURLException;
import java.net.URL;
import java.net.URLConnection;
import java.util.HashSet;
import java.util.Set;

import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.safety.Whitelist;
import org.jsoup.select.Elements;

public class TmGatherContentUtil {

	private final static Whitelist user_content_filter = Whitelist.relaxed(); 
	static {       
		//增加可信标签到白名单        
		user_content_filter.addTags("embed","object","param","span","div");     //增加可信属性    
		user_content_filter.addAttributes(":all", "style", "class", "id", "name");      
		user_content_filter.addAttributes("object", "width", "height","classid","codebase");      
		user_content_filter.addAttributes("param", "name", "value");      
		user_content_filter.addAttributes("embed", "src","quality","width","height","allowFullScreen","allowScriptAccess","flashvars","name","type","pluginspage"); 
	}  
	/**
     * 根据网页和网页编码获取网页内容.
     * 
     * @param url
     * @param encoding
     * @return
     */
    public static String getHtmlResourceByURL(String url, String encoding) {
        StringBuffer buffer = new StringBuffer();
        BufferedReader reader = null;
        InputStreamReader in = null;
        URLConnection uc = null;
        URL urlObj = null;
        try {
            urlObj = new URL(url);
            uc = urlObj.openConnection();
            uc.setRequestProperty("User-Agent", "java");
            in = new InputStreamReader(uc.getInputStream(), encoding);
            reader = new BufferedReader(in);
            String line = null;
            while ((line = reader.readLine()) != null) {
                buffer.append(line + "\r\n");
            }
        } catch (Exception e) {
            return "connection timeout....";
        } finally {
            if (in != null) {
                try {
                    in.close();
                } catch (IOException e) {
                    e.printStackTrace();
                }
            }
        }
        return buffer.toString();
    }
	//http://news.xinhuanet.com/politics/2015-05/09/c_1115229042.htm
	//politics//2015-05/09//
	
	public static void main(String[] args) throws MalformedURLException, IOException {
		String url = "http://news.qq.com/";
		String filterUrl  = "http://news.qq.com/a/";
		
		//http://www.xinhuanet.com/
		//第一步：导入解析包jsoup.jar java中的javascript+jquery
		//第二步：根据URL获取网页源代码。
		Document document = Jsoup.parse(getHtmlResourceByURL(url,"GBK"));//java.net下面api
		//第三步：抓取网页中所有需要的URL
		Elements links = document.getElementsByTag("a");
		Set<String> urls = new HashSet<String>();
		for (Element element : links) {
			String href = element.attr("href");
			if(TzStringUtils.isNotEmpty(href) && href.startsWith(filterUrl)){
				urls.add(href);
			}
		}
		
		//第四步：解析匹配出来的URL，讲需要的匹配出来
		for (String string : urls) {
			try {
				Document document2 = Jsoup.parse(getHtmlResourceByURL(string,"GBK"));
				String title = document2.getElementsByTag("h1").get(0).text();
				String content = document2.getElementById("Cnt-Main-Article-QQ").html();
				System.out.println(title);
				System.out.println(Jsoup.clean(content, Whitelist.simpleText()));
			} catch (Exception e) {
				continue;
			}
		}
		//第五步：保存数据库
		
	}
}
