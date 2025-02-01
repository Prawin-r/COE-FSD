package utility;

public class NumberUtils {

	public static int numberLength(int number) {
		// Static method to find the length of an integer
		return String.valueOf(Math.abs(number)).length();

	}
}
