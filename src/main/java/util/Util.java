package util;

import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Paths;
import java.util.Collection;
import java.util.Enumeration;
import java.util.Scanner;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.Part;

public class Util {
	public static void deleteFile(String path) {
		try {
			Files.deleteIfExists(Paths.get(path));
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	public static long getLoadTime(HttpServletRequest req, String key,
			int beg) {
		Long time = System.currentTimeMillis();
		if (beg == 0) {
			req.getSession().setAttribute(key, time);
		} else {
			if (req.getSession().getAttribute(key) != null) {
				time = (Long) req.getSession().getAttribute(key);
			}
		}
		return time;
	}

	public static Long getCookieAsLong(HttpServletRequest req, String key) {
		Cookie[] cookies = req.getCookies();
		Long ans = null;
		for (Cookie i : cookies) {
			if (i.getName().equals(key)) {
				ans = Long.parseLong(i.getValue());
			}
		}
		return ans;
	}
	public static Long getUserId(HttpServletRequest req) {
		return 1L;// getCookieAsLong(req, "userId");
	}
	public static String getCookie(HttpServletRequest req, String key) {
		Cookie[] cookies = req.getCookies();
		String ans = null;
		for (Cookie i : cookies) {
			if (i.getName().equals(key)) {
				ans = i.getValue();
			}
		}
		return ans;
	}
	public static boolean isMobile(HttpServletRequest req) {
		return isMobile(req.getHeader("user-agent"));
	}
	public static boolean isMobile(String userAgent) {
		if (userAgent.contains("Windows"))
			return false;
		String[] mobiles = "nokia sony ericsson mot samsung htc sgh lg sharp philips panasonic alcatel lenovo iphone ipod blackberry meizu android netfront symbian ucweb windowsce palm operamini operamobi opera mobi openwave nexusone cldc midp wap mobile"
				.split(" ");
		for (String i : mobiles) {
			if (userAgent.contains(i))
				return true;
		}
		return false;
	}
	public static String debug(HttpServletRequest req) {
		StringBuilder builder = new StringBuilder();
		builder.append("===========headers=========");
		Enumeration<String> headerNames = req.getHeaderNames();
		while (headerNames.hasMoreElements()) {
			String k = headerNames.nextElement();
			System.out.println(k + " : " + req.getHeader(k));
		}
		builder.append("==========something ==========");
		builder.append(req.getMethod() + " method\n");
		builder.append(req.getRemoteUser() + " remote user\n");
		builder.append(req.getRemoteAddr() + " remote Address\n");
		builder.append(req.getRemoteHost() + " remote host\n");
		builder.append(req.getContentType() + " content type\n");
		builder.append(req.getContentLength() + " content length\n");
		builder.append("===========attributes============\n");

		Enumeration<String> a = req.getAttributeNames();
		while (a.hasMoreElements()) {
			String i = a.nextElement();
			builder.append(i).append(":").append(req.getParameter(i))
					.append("\n");
		}
		builder.append("================parameters==============\n");
		a = req.getParameterNames();
		while (a.hasMoreElements()) {
			String i = a.nextElement();
			String j = req.getParameter(i);
			builder.append(i + ":" + j + "\n");
		}
		if (req.getMethod().compareToIgnoreCase("post") == 0) {
			builder.append("================parts==============\n");
			try {
				Collection<Part> b = req.getParts();
				builder.append(b.size() + ": part count\n");
				for (Part i : b) {
					builder.append(i.getName()).append("\n");
				}
				Scanner cin = new Scanner(req.getInputStream());
				while (cin.hasNext()) {
					builder.append(cin.nextLine()).append("\n");
				}
				cin.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		builder.append("===========cookies========\n");
		Cookie cookie[] = req.getCookies();
		if (cookie != null) {
			for (Cookie i : cookie) {
				builder.append(i.getName() + " : " + i.getValue() + " : "
						+ i.getMaxAge() + " \n");
			}
		}
		System.out.println(builder.toString());
		return builder.toString();
	}
}
