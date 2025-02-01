package weekTasks;

public class TrailingZeros {
	public static void main(String[] args) {

		// Input: The factorial number to find the trailing zeros
		int userInput = 925;

		// count of trailing zeros
		int countOfZeros = 0;

		// Keep dividing n by powers of 5 and add the quotient to count
		while (userInput >= 5) {
			userInput /= 5;
			countOfZeros += userInput;
		}

		System.out.println("The trailing zeros count is "+countOfZeros);
	}

}
