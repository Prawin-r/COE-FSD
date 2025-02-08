package WarehouseInventoryManagement;

public class Location {
	int aisle, shelf, bin;

	public Location(int aisle, int shelf, int bin) {
		this.aisle = aisle;
		this.shelf = shelf;
		this.bin = bin;
	}

	public String toString() {
		return "Aisle " + aisle + ", Shelf " + shelf + ", Bin " + bin;
	}
}
