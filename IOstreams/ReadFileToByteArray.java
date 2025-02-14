package IOstreams;

import java.io.File;
import java.io.IOException;
import java.nio.file.Files;

public class ReadFileToByteArray {
	public static void main(String[] args) {
		File file = new File("C:\\\\Users\\\\Prawinraj\\\\Wrapper Class.txt");

		if (file.exists()) {
			try {
				byte[] fileData = Files.readAllBytes(file.toPath());
				System.out.println("File read successfully. Byte array length: " + fileData.length);
			} catch (IOException e) {
				System.out.println("Error reading file: " + e.getMessage());
			}
		} else {
			System.out.println("File does not exist.");
		}
	}
}
