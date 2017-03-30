package com.menu.util;

import java.io.IOException;
import java.util.Properties;

/**
 * JdbcProperties
 * @author 闫飞
 *
 */
public class JdbcProperties {

	public static Properties properties = new Properties();
	
	static {
		try {
			properties.load(JdbcProperties.class.getClassLoader().getResourceAsStream("jdbc.properties"));
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	public static String getValue(String key){
		
		return properties.getProperty(key);
	}
}
