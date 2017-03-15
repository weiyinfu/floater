package service.other;

import java.nio.file.DirectoryStream;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.ArrayList;
import java.util.List;

import org.springframework.stereotype.Service;

import util.Sky;
@Service
public class TopicIconService {
	final static List<String> icons = new ArrayList<>();
	public static void init() {
		Path path = Paths.get(Sky.resPath + "topicIcon");
		try (DirectoryStream<Path> files = Files.newDirectoryStream(path)) {
			for (Path i : files) {
				icons.add("topicIcon/" + i.getFileName().toString());
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	public List<String> getIcons(int beg, int len) {
		int end = Math.min(icons.size(), beg + len);
		List<String> ans = null;
		if (beg < icons.size())
			ans = icons.subList(beg, end);
		return ans;
	}
}
