package IOstreams;

import java.io.File;

public class ListOfFile {

	public static void main(String[] args) {
		File directory = new File("C:\\\\Users\\\\Prawinraj"); // Change the path accordingly

		if (directory.exists() && directory.isDirectory()) {
			String[] fileList = directory.list();
			System.out.println("Files and Directories:");
			for (String file : fileList) {
				System.out.println(file);
			}
		} else {
			System.out.println("Invalid directory path.");
		}
	}
}
