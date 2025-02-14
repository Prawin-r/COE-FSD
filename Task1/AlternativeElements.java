package Task1;

import java.util.Arrays;

public class AlternativeElements {
	public static void main(String[] args) {
		int[] array = { 1, 2, 3, 4, 5 };
		int newSize = (array.length + 1) / 2;
		int[] copiedElements = new int[newSize];
		int index = 0;
		for (int i = 0; i < array.length; i += 2) {
			copiedElements[index++] = array[i];
		}
		System.out.println(Arrays.toString(copiedElements));
	}
}
