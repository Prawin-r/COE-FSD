package collectionApi;

import java.util.LinkedList;

public class InsertMultipleElements {
	public static void main(String[] args) {
		LinkedList<String> list = new LinkedList<>(java.util.List.of("Red", "Green"));
		list.add(1, "Blue");
		list.add(2, "Yellow");

		System.out.println(list);
	}

}
