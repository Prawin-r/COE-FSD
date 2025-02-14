package ExceptionHandling;

import java.io.File;
import java.io.FileNotFoundException;
import java.util.Scanner;

public class CheckEmptyFile {
	public static void readFile(String filePath) throws FileNotFoundException, EmptyFileException {
		File file = new File(filePath);
		Scanner scanner = new Scanner(file);

		if (!scanner.hasNextLine()) {
			scanner.close();
			throw new EmptyFileException("Error: The file is empty.");
		}

		System.out.println("File is not empty. Reading contents...");
		while (scanner.hasNextLine()) {
			System.out.println(scanner.nextLine());
		}
		scanner.close();
	}

	public static void main(String[] args) {
		try {
			readFile("C:\\\\Users\\\\Prawinraj\\\\Wrapper Class.txt"); // Change path accordingly
		} catch (FileNotFoundException e) {
			System.out.println("Exception caught: File not found.");
		} catch (EmptyFileException e) {
			System.out.println(e.getMessage());
		}
	}
}