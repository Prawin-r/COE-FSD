package weekTasks;

public class PrimitiveReference {
	public static void modifyValues(int num, int arr[]) {
		
		// Modifying the integer (primitive type)
		num = num + 10;
		
        // Modifying the array (reference type)
		arr[0] = arr[0] + 10;
		System.out.println("Inside method - num: " + num);
		System.out.println("Inside method - arr[0]: " + arr[0]);
	}

	public static void main(String[] args) {
		int number = 5;
		int[] array = { 1, 2, 3, 4, 5 };
		System.out.println("Before Method call- " + number);
		System.out.println("Before Method call- " + array[0]);
		modifyValues(number, array);
		System.out.println("After Method Call- " + number);
		System.out.println("After Method call- " + array[0]);
	}
}
