package Task2;

import java.util.Scanner;

public class EmployeeLoanCheck {
	public static void main(String[] args) {
		Scanner sc = new Scanner(System.in);
		Employee emp = new Employee();

		// Taking input
		System.out.print("Enter Employee ID: ");
		int id = sc.nextInt();
		sc.nextLine(); // Consume newline

		System.out.print("Enter Employee Name: ");
		String name = sc.nextLine();

		System.out.print("Enter Monthly Salary: ");
		double salary = sc.nextDouble();

		System.out.print("Enter Years of Service: ");
		int years = sc.nextInt();

		// Setting employee details
		emp.setEmployeeDetails(id, name, salary, years);

		// Displaying employee details and loan eligibility
		emp.getEmployeeDetails();

		sc.close();
	}
}
