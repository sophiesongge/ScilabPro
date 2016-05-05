package com.scilab.test;

import java.io.File;

public class TestString {
	public static void main(String[] args) {

		if (System.getProperty("os.name").equals("Linux")) {
			System.out.println("You are using linux");
		} else if (System.getProperty("os.name").startsWith("Windows")) {
			System.out.println("You are using windows");
		} else
			System.out.println("Your operation system is unsupported");
		String str = "/home/wangadong/Workspaces/MyEclipse/.metadata/.me_tcat/webapps/ScilabPro/ScilabResult/15813/www/15813www.txt";
		if (str.startsWith("/")) {
			String str1 = "C:/ScilabDistribution/tomcat6.0/webapps";
			System.out.println(str1 + str.split("webapps")[1]);
		}
		System.out.println(str);
		String taskQueryId = new File(str).getParentFile().getParentFile().getName()+new File(str).getParent();
		System.out.println(taskQueryId);
	}
}
