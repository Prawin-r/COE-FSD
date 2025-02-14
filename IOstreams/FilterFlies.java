package IOstreams;

import java.io.File;
import java.io.FilenameFilter;

public class FilterFlies {
	public static void main(String[] args) {
		File dir = new File("C:\\\\Users\\\\Prawinraj"); // Change the path accordingly
		String extension = ".txt"; // Change as needed

		FilenameFilter filter = (dir1, name) -> name.endsWith(extension);
		File[] files = dir.listFiles(filter);

		if (files != null) {
			System.out.println("Files with extension " + extension + ":");
			for (File file : files) {
				System.out.println(file.getName());
			}
		}
	}
}
