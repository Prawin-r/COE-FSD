package IOstreams;

import java.io.File;

public class FileSize {
	public static void main(String[] args) {
		File file = new File("C:\\\\Users\\\\Prawinraj\\\\Wrapper Class.txt");

		if (file.exists()) {
			long bytes = file.length();
			double kilobytes = bytes / 1024.0;
			double megabytes = kilobytes / 1024.0;

			System.out.println("File Size:");
			System.out.println("Bytes: " + bytes);
			System.out.println("KB: " + kilobytes);
			System.out.println("MB: " + megabytes);
		} else {
			System.out.println("File does not exist.");
		}
	}
}
