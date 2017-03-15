package util;

import java.io.IOException;
import java.sql.SQLException;

import org.mybatis.generator.exception.InvalidConfigurationException;
import org.mybatis.generator.exception.XMLParserException;

public class MyGenerator {
	public static void main(String[] args)
			throws IOException, XMLParserException,
			InvalidConfigurationException, SQLException, InterruptedException {
		org.mybatis.generator.api.ShellRunner.main(new String[]{"-configfile",
				"src/util/generator2.xml", "-overwrite"});
	}
}
