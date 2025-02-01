package weekTasks;

public class SecondUser {
	// private user variables
	private String name;
	private int age;

	// Getters and setters
	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public int getAge() {
		return age;
	}

	public void setAge(int age) {
		this.age = age;
	}

	public SecondUser(String name, int age) {
		this.name = name;
		this.age = age;
	}

	public static void main(String[] args) {
		// Creating objects of User class
		User user1 = new User("Prawin", 21);
		User user2 = new User("Prawin", 21);
		System.out.println(user1);

		// Creating objects of SecondUser class
		SecondUser secondUser1 = new SecondUser("Pratin", 21);
		SecondUser secondUser2 = new SecondUser("Pratin", 21);
		System.out.println(secondUser1);

		// Comparing objects using equals()
		// True (overridden)
		System.out.println(user1.equals(user2));
		// False (default Object.equals())
		System.out.println(secondUser1.equals(secondUser2));

		// comparing hashcodes
		System.out.println("\nUser class hash codes:");
		System.out.println(user1.hashCode());
		System.out.println(user2.hashCode());

		System.out.println("\nSecondUser class hash codes:");
		System.out.println(secondUser1.hashCode());
		System.out.println(secondUser2.hashCode());
	}
}
