package Task2;

public class Employee {
	private int empId;
	private String empName;
	private double salary;
	private int yearsOfService;

	public void setEmployeeDetails(int empId, String empName, double salary, int yearsOfService) {
		this.empId = empId;
		this.empName = empName;
		this.salary = salary;
		this.yearsOfService = yearsOfService;
	}

	public void getEmployeeDetails() {
		System.out.println("\nEmployee Details:");
		System.out.println("ID: " + empId);
		System.out.println("Name: " + empName);
		System.out.println("Salary: " + salary);
		System.out.println("Years of Service: " + yearsOfService);
		System.out.println("Loan Eligibility: " + getLoanEligibility());
	}

	public String getLoanEligibility() {
		if (yearsOfService <= 5) {
			return "Not eligible : minimum requirement 6 years";
		}
		double annualSalary = salary * 12;
		double loanAmount = 0;

		if (annualSalary >= 15_00_000) {
			loanAmount = 7_00_000;
		} else if (annualSalary >= 10_00_000) {
			loanAmount = 5_00_000;
		} else if (annualSalary >= 6_00_000) {
			loanAmount = 2_00_000;
		} else {
			return "Not eligible for loan amount";
		}
		return "Eligible for loan amount is ₹ " + loanAmount;

	}

}
