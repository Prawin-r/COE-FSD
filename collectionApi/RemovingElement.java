package collectionApi;

import java.util.ArrayList;

public class RemovingElement {
	public static void main(String[] args) {
		ArrayList<String> names = new ArrayList<>(java.util.List.of("Prawin", "Joseph", "Antony", "Jeffery"));
		names.remove(3);
		System.out.println(names);
	}
}