package collectionApi;

import java.util.ArrayList;

public class UpdateElement {
	public static void main(String[] args) {
		ArrayList<String> names=new ArrayList<>(java.util.List.of("Prawin","Joseph","Antony"));
		names.set(1,"Vijay");
		System.out.println(names);
}
}