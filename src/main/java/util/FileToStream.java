package util;

import java.io.File;
import java.io.FileInputStream;
import java.io.OutputStream;

public class FileToStream {
	static public void writeAndClose(OutputStream cout, String path) {
		File file = new File(path);
		try (FileInputStream cin = new FileInputStream(path);) {
			byte[] buffer = new byte[(int) file.length()];
			int x = cin.read(buffer);
			cout.write(buffer, 0, x);
			cin.close();
			cout.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}
