package WarehouseInventoryManagement;

import java.util.List;

public class Order {
	String id;
	List<String> productIDs;
	int priority; // Lower value means higher priority

	public Order(String id, List<String> productIDs, int priority) {
		this.id = id;
		this.productIDs = productIDs;
		this.priority = priority;
	}
}
