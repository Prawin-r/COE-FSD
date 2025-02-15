package collectionApi;

import java.util.LinkedList;

public class FirstLastOccurrence {

	public static void main(String[] args) {

		LinkedList<String> list = new LinkedList<>(java.util.List.of("Red", "Blue", "Green", "Blue","Blue"));
		System.out.println("First Occurrence of Blue: " + list.indexOf("Blue"));
		System.out.println("Last Occurrence of Blue: " + list.lastIndexOf("Blue"));

	}
}
