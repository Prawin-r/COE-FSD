package collectionApi;

import java.util.ArrayList;

public class InsertAtFirst {
public static void main(String[] args) {
	ArrayList<String> names=new ArrayList<>(java.util.List.of("Prawin","Joseph","Antony"));
	names.add(0,"David");
	System.out.println(names);
}
}
