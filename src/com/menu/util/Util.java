package com.menu.util;

public class Util {

	
	public static boolean isEmpty(String str){
		
		if(str != null && !"".equals(str)){
			return false;
		}
		return true;
	}
	
	public static boolean isNotEmpty(String str){
		
		return !isEmpty(str);
	}
	
	public static Integer toInt(Number number){
		
		return number.intValue();
	}
}
