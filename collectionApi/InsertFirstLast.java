package collectionApi;

import java.util.LinkedList;

public class InsertFirstLast {
	public static void main(String[] args) {
		LinkedList<String> movieList = new LinkedList<>(
				java.util.List.of("Interstellar", "Tenet", "Inception", "oppenheimer"));
		movieList.addFirst("Happiness");
		movieList.addLast("Marco");
		System.out.println(movieList);
	}
}
