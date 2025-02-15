package collectionApi;

import java.util.Collections;
import java.util.LinkedList;

public class ReverseIterateLinkedList {
	public static void main(String[] args) {
		LinkedList<Integer> number = new LinkedList<>(java.util.List.of(10, 20, 30, 40, 50, 60, 70));
        Collections.reverse(number);
        System.out.println(number);
	}
}
