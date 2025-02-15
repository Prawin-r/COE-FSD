package collectionApi;

import java.util.ArrayList;
import java.util.Collections;

public class SortingArray {
public static void main(String[] args) {
	ArrayList<Integer> numbers=new ArrayList<>(java.util.List.of(10,4,2,8,5,6,3,7,1,9));
	Collections.sort(numbers);
	System.out.println(numbers);
	//System.out.println(numbers.stream().sorted().collect(Collectors.toList()));

}
}
