package IOstreams;

import java.io.File;

public class CheckExistence {
	public static void main(String[] args) {
        File file = new File("C:\\\\Users\\\\Prawinraj");

        if (file.exists()) {
            System.out.println("Exists: " + file.getAbsolutePath());
        } else {
            System.out.println("Does not exist.");
        }
    }
}
