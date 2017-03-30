package com.menu.util;

import java.io.IOException;
import java.util.Properties;

/**
 * ConfigProperties
 * @author 闫飞
 *
 */
public class ConfigProperties {

	public static Properties properties = new Properties();
	
	static {
		try {
			properties.load(ConfigProperties.class.getClassLoader().getResourceAsStream("config.properties"));
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	public static String getValue(String key){
		
		return properties.getProperty(key);
	}
}
