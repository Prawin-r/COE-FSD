package weekTasks;

public class CarDemo {
	public static void main(String[] args) {

		// Creating an array of Car objects (polymorphism)

		Car[] cars = new Car[3];
		cars[0] = new Car("Toyota", "Camry", 2022);
		cars[1] = new ElectricCar("Tesla", "Model S", 2023, 400);
		cars[2] = new Car("Honda", "Civic", 2021);

		// Looping through the array and calling startEngine() method

		for (Car car : cars) {
			car.startEngine();
		}

	}

}
