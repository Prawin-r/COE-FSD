package collectionApi;

import java.util.ArrayList;

public class CopyArrayList {
public static void main(String[] args) {
	ArrayList<String> colorsNames = new ArrayList<>(java.util.List.of("Red", "Blue", "Green", "Yellow","Black","White"));
	ArrayList<String> colors=new ArrayList<String>(colorsNames);
	System.out.println(colors);
}
}
