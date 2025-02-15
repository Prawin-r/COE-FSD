package collectionApi;

import java.util.ArrayList;

public class RetrieveElement {
	public static void main(String[] args) {
		ArrayList<String> names = new ArrayList<>(java.util.List.of("Prawin", "Joseph", "Antony"));
		System.out.println(names.get(0));
	}
}
