package WarehouseInventoryManagement;

import java.util.Arrays;

public class WarehouseSystem {
	 public static void main(String[] args) {
	        InventoryManager inventory = new InventoryManager();

	        // Add Products
	        inventory.addProduct(new Product("P1", "Laptop", 5, new Location(1, 2, 5)));
	        inventory.addProduct(new Product("P2", "Phone", 3, new Location(2, 1, 3)));

	        // Display Initial Inventory
	        System.out.println("Initial Inventory:");
	        inventory.displayInventory();

	        // Place Orders
	        inventory.placeOrder(new Order("O1", Arrays.asList("P1", "P2"), 2));
	        inventory.placeOrder(new Order("O2", Arrays.asList("P1"), 1));
	        
	        // Process Orders
	        inventory.processOrders();

	        // Display Updated Inventory
	        System.out.println("\nUpdated Inventory:");
	        inventory.displayInventory();
	    }
}
