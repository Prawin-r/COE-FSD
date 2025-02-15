package collectionApi;

import java.util.LinkedList;

public class IterateLinkedList {
	public static void main(String[] args) {
		LinkedList<Integer> number = new LinkedList<>(java.util.List.of(10, 20, 30, 40, 50, 60, 70));
        for(int i:number) {
        	System.out.println(i);
        }
	}
}
