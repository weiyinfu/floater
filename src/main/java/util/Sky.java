package util;

import java.io.IOException;
import java.util.Properties;

public class Sky {
	public static final String resPath;
	public static final String[] mediaFolder = "textImage/ audio/ video/"
			.split(" ");
	static {
		Properties properties = new Properties();
		try {
			properties.load(Sky.class.getResourceAsStream("../folder.properties"));
		} catch (IOException e) {
			e.printStackTrace();
		}
		resPath = properties.getProperty("resPath");
	}
	public static void main(String[] args) {
		System.out.println(resPath);
	}
}
