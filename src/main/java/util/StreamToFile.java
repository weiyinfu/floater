package util;

import java.io.FileOutputStream;
import java.io.InputStream;
import java.net.URL;

public class StreamToFile {
	static public void fromNet(String url, String path) {
		try {
			InputStream cin = new URL(url).openStream();
			writeAndClose(cin, path);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	public static void writeAndClose(InputStream cin, String path) {
		try (FileOutputStream cout = new FileOutputStream(path);) {
			byte[] buffer = new byte[1024];
			while (true) {
				int len = cin.read(buffer);
				if (len == -1)
					break;
				cout.write(buffer, 0, len);
			}
			cin.close();
			cout.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}
