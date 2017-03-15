package service.other;

import java.nio.file.Files;
import java.util.ArrayList;
import java.util.List;
import java.util.Scanner;

import org.apache.ibatis.io.Resources;
import org.springframework.stereotype.Service;
@Service
public class SchoolService {
	static List<String> schools = new ArrayList<>();
	public static void init(){
		try (Scanner cin = new Scanner(new String(
				Files.readAllBytes(
						Resources.getResourceAsFile("schools.txt").toPath()),
				"utf8"))) {
			while (cin.hasNext()) {
				schools.add(cin.next());
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	
	public List<String> getSchoolsByName(String key) {
		StringBuilder builder = new StringBuilder();
		for (char c : key.toCharArray()) {
			builder.append(".*").append(c);
		}
		builder.append(".*");
		String k = builder.toString();
		List<String> a = new ArrayList<>();
		for (String i : schools) {
			if (i.matches(k)) {
				a.add(i);
				if (a.size() > 25)
					break;
			}
		}
		return a;
	}
}
