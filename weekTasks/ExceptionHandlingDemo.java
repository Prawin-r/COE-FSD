package weekTasks;

import java.util.Scanner;

public class ExceptionHandlingDemo {
	public static void processInput() {
		Scanner scanner = new Scanner(System.in);

		try {
			System.out.println("Enter a number:");
			double number = scanner.nextDouble();

			// Checking if the number is zero to avoid division by zero
			if (number == 0) {
				throw new ArithmeticException("Division by zero is not allowed.");
			}

			// Calculating Reciprocal
			double reciprocal = 1 / number;
			System.out.println("Reciprocal :" + reciprocal);

		} catch (java.util.InputMismatchException e) {

			// Handling invalid (non-numerical) input

			System.out.println("Error:Invalid input.Please enter the valid number");

		} catch (ArithmeticException e) {

			// Handling division by zero

			System.out.println("Error :" + e.getMessage());

		} finally {
			
			// Closing scanner to avoid resource leak
			scanner.close();
			System.out.println("Process completed");
		}
	}

	public static void main(String[] args) {
		processInput();
	}
}
