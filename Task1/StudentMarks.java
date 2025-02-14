package Task1;

import java.util.Arrays;
import java.util.Comparator;
import java.util.Scanner;

public class StudentMarks {
	String name;
	int[] marks;
	int total;
	double average;

	StudentMarks(String name, int[] marks) {
		this.name = name;
		this.marks = marks;
		this.total = Arrays.stream(marks).sum();
		this.average = total / marks.length;
	}

	@Override
	public String toString() {
		return name + " | Total: " + total + " | Average: " + String.format("%.2f", average);
	}

	public static void main(String[] args) {
		Scanner sc = new Scanner(System.in);
		System.out.println("Enter the size of the students: ");
		int n = sc.nextInt();
		StudentMarks[] students = new StudentMarks[n];

		for (int i = 0; i < n; i++) {
			System.out.print("Enter student name: ");
			String name = sc.next();

			System.out.print("Enter number of subjects: ");
			int subjects = sc.nextInt();
			int[] marks = new int[subjects];

			System.out.println("Enter marks for " + name + ":");
			for (int j = 0; j < subjects; j++) {
				marks[j] = sc.nextInt();
			}

			students[i] = new StudentMarks(name, marks);
		}
		Arrays.sort(students, Comparator.comparing(s -> -s.total));

		System.out.println("\nSorted Student List:");
		for (StudentMarks s : students) {
			System.out.println(s);
		}
		sc.close();

	}
}
