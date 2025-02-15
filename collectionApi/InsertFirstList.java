package collectionApi;

import java.util.LinkedList;

public class InsertFirstList {
	public static void main(String[] args) {

		LinkedList<String> movieList = new LinkedList<>(
				java.util.List.of("Interstellar", "Tenet", "Inception", "oppenheimer"));
		movieList.addFirst("Happiness");
		System.out.println(movieList);

	}
}
