package WarehouseInventoryManagement;

public class Product {
	String id, name;
	int quantity;
	Location location;

	public Product(String id, String name, int quantity, Location location) {
		this.id = id;
		this.name = name;
		this.quantity = quantity;
		this.location = location;
	}

	public synchronized boolean reduceStock(int amount) {
		if (quantity >= amount) {
			quantity -= amount;
			return true;
		}
		return false;
	}

	public String toString() {
		return name + " (ID: " + id + ") - Qty: " + quantity + " @ " + location;
	}
}
