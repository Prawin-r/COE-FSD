package IOstreams;

import java.io.File;

public class CheckFileOrDirectory {
	public static void main(String[] args) {
		File file = new File("C:\\\\Users\\\\Prawinraj");

		if (file.exists()) {
			if (file.isDirectory()) {
				System.out.println("It is a directory.");
			} else {
				System.out.println("It is a file.");
			}
		} else {
			System.out.println("Path does not exist.");
		}
	}
}
