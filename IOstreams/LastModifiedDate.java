package IOstreams;

import java.io.File;
import java.text.SimpleDateFormat;
import java.util.Date;

public class LastModifiedDate {
	public static void main(String[] args) {
		File file = new File("C:\\\\Users\\\\Prawinraj\\\\Wrapper Class.txt");

		if (file.exists()) {
			long lastModified = file.lastModified();
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
			System.out.println("Last Modified Date: " + sdf.format(new Date(lastModified)));
		} else {
			System.out.println("File does not exist.");
		}
	}
}
