package weekTasks;

public class Divide {
	public static void main(String[] args) {
		// Initializing two integers
		int userInput1 = 10;
		int userInput2 = 5;
		int rem = 0; // Variable to store the remainder

		// This loop is supposed to run while userInput2 is greater than userInput2,
		// but since the condition (userInput2 > userInput1) is false (5 > 10 is false), it never
		// executes.
		while (userInput2 > userInput1) {
			rem = rem - userInput2;
		}

		// Calculating divisor as difference between userInput1 and rem
		int divisor = userInput1 - rem;
		int quotient = 0;

		// This loop performs division by repeated subtraction
		while (divisor > 0) {
			divisor = divisor - userInput2; 
			quotient++; 
		}

		System.out.println("The Quotient is"+quotient);
		System.out.println("The Remainder is "+rem);
	}
}
