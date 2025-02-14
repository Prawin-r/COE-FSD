package Task1;

import java.util.Arrays;
import java.util.Objects;

public class MethodDemonstration {
public static void main(String[] args) {
	int [] arr1= {1,2,3};
	int [] arr2= {1,2,3};
	
	int [][] array1= {{1,2},{3,4}};
	int [][]array2= {{1,2},{3,4}};
	
	System.out.println(Arrays.equals(arr1, arr2));// comparing elements
	System.out.println(arr1.equals(arr2));//comparing objects
	
	System.out.println(Arrays.deepEquals(array1, array2));// comparing nested array elements
	System.out.println(Objects.deepEquals(array1, array2));// comparing nested arrays objects
}
}
