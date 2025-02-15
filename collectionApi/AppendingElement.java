package collectionApi;

import java.util.LinkedList;

public class AppendingElement  {
	    public static void main(String[] args) {
	        LinkedList<String> MoviesList = new LinkedList<>();
	        MoviesList.add("The Pursuit of Happines");
	        MoviesList.add("Ford vs Ferrari");
	        MoviesList.addLast("Interstellar");

	        System.out.println(MoviesList);
	    }
	}

