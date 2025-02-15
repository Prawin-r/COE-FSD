package collectionApi;

import java.util.LinkedList;

public class InsertAtPosition {
	public static void main(String[] args) {
		LinkedList<String> movieList = new LinkedList<>(
				java.util.List.of("Interstellar", "Tenet", "Inception", "oppenheimer"));
		movieList.add(0, "Chernobyl");
		System.out.println(movieList);
	}
}
