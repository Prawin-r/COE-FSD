package weekTasks;

public class User {
	private String name;
	private int age;

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

	public User(String name, int age) {
		this.name = name;
		this.age = age;
	}

	public String toString() {
		return "The user name is " + name + " and "+ age +" years old.";

	}

	public int hashCode() {
		return name.hashCode() + age;
	}

	@Override
	public boolean equals(Object obj) {
		if (this == obj) {
			return true;
		}
		if (obj == null) {
			return false;
		}
		User user = (User) obj;
		return age == user.age && name.equals(user.name);

	}

}
