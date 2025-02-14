package Task1;

import java.util.Arrays;

public class ArrayCopyRangeExample {
public static void main(String[] args) {
	int [] oringinalArray= {1,2,3,4,5,6,7};
	int [] copiedArray=Arrays.copyOfRange(oringinalArray, 2, 4);
	System.out.println(Arrays.toString(copiedArray));
}
}
