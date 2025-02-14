package IOstreams;

import java.io.File;

public class CheckPermissions {
	public static void main(String[] args) {
		File file = new File("C:\\\\Users\\\\Prawinraj");

		if (file.exists()) {
			System.out.println("Readable: " + file.canRead());
			System.out.println("Writable: " + file.canWrite());
		} else {
			System.out.println("File does not exist.");
		}
	}
}
