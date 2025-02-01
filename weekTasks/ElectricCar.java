package weekTasks;

public class ElectricCar extends Car {
	private int batteryRange;

	public ElectricCar(String make, String model, int year, int batteryRange) {
		super(make, model, year);
		this.batteryRange = batteryRange;
	}
    // Getter and setter for batteryRange
	public int getBatteryRange() {
		return batteryRange;
	}

	public void setBatteryRange(int batteryRange) {
		this.batteryRange = batteryRange;
	}
	
    // Method to charge the battery

	public void chargeBattery() {
		System.out.println("The battery is getting charged");
	}

}
