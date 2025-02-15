package collectionApi;

import java.util.ArrayList;

public class SearchElement {
	public static void main(String[] args) {
		ArrayList<Integer> numbers=new ArrayList<>(java.util.List.of(1,2,3,4,5,6,7,8,9,10));
		System.out.println(numbers.contains(4));
}
}