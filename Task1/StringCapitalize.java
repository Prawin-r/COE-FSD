package Task1;

import java.util.Scanner;

public class StringCapitalize {
	public static String Capitalize(String s) {
		StringBuilder string = new StringBuilder();
		for (int i = 0; i < s.length(); i++) {
			if (i % 2 == 0) {
				string.append(Character.toUpperCase(s.charAt(i)));
			}
			else {
				string.append(Character.toLowerCase(s.charAt(i)));
			}
		}
		return string.toString();
	}

	public static void main(String[] args) {
		Scanner sc = new Scanner(System.in);
		String word = sc.nextLine();
		System.out.println(Capitalize(word));
	}
}
