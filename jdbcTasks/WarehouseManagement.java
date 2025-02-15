package jdbcTasks;

import java.sql.*;
import java.util.Scanner;

public class WarehouseManagement {
	static String URL = "jdbc:mysql://localhost:3306/warehouse";
	static String USER = "root";
	static String PASSWORD = "Prawin@0105";

	public static void insertRow(Connection conn, Scanner scanner) throws SQLException {
		String query = "INSERT INTO Warehouse (product_name, quantity, price) VALUES (?, ?, ?)";
		PreparedStatement pstmt = conn.prepareStatement(query);

		System.out.print("Enter product name: ");
		String name = scanner.next();
		System.out.print("Enter quantity: ");
		int quantity = scanner.nextInt();
		System.out.print("Enter price: ");
		double price = scanner.nextDouble();

		pstmt.setString(1, name);
		pstmt.setInt(2, quantity);
		pstmt.setDouble(3, price);
		pstmt.executeUpdate();
		System.out.println("Row inserted successfully!");
	}

	public static void updateRow(Connection conn, Scanner scanner) throws SQLException {
		System.out.print("Enter Product ID to update: ");
		int id = scanner.nextInt();
		System.out.print("Enter new quantity: ");
		int quantity = scanner.nextInt();
		System.out.print("Enter new price: ");
		double price = scanner.nextDouble();

		String query = "UPDATE Warehouse SET quantity = ?, price = ? WHERE id = ?";
		PreparedStatement pstmt = conn.prepareStatement(query);
		pstmt.setInt(1, quantity);
		pstmt.setDouble(2, price);
		pstmt.setInt(3, id);

		int rowsUpdated = pstmt.executeUpdate();
		if (rowsUpdated > 0) {
			System.out.println("Row updated successfully!");
		} else {
			System.out.println("No row found with the given ID.");
		}
	}

	public static void deleteRow(Connection conn, Scanner scanner) throws SQLException {
		System.out.print("Enter Product ID to delete: ");
		int id = scanner.nextInt();

		String query = "DELETE FROM Warehouse WHERE id = ?";
		PreparedStatement pstmt = conn.prepareStatement(query);
		pstmt.setInt(1, id);

		int rowsDeleted = pstmt.executeUpdate();
		if (rowsDeleted > 0) {
			System.out.println("Row deleted successfully!");
		} else {
			System.out.println("No row found with the given ID.");
		}
	}

	public static void selectRow(Connection conn, Scanner scanner) throws SQLException {
		System.out.print("Enter Product ID to fetch: ");
		int id = scanner.nextInt();

		String query = "SELECT * FROM Warehouse WHERE id = ?";
		PreparedStatement pstmt = conn.prepareStatement(query);
		pstmt.setInt(1, id);

		ResultSet rs = pstmt.executeQuery();
		while (rs.next()) {
			System.out.println("ID: " + rs.getInt("id"));
			System.out.println("Product: " + rs.getString("product_name"));
			System.out.println("Quantity: " + rs.getInt("quantity"));
			System.out.println("Price: " + rs.getDouble("price"));
		}
	}

	public static void main(String[] args) {
		try (Connection conn = DriverManager.getConnection(URL, USER, PASSWORD);
				Scanner scanner = new Scanner(System.in)) {

			while (true) {
				System.out.println("\nMenu:");
				System.out.println("1. Insert a new Row");
				System.out.println("2. Update a Row");
				System.out.println("3. Delete a Row");
				System.out.println("4. Select a Row");
				System.out.println("5. Exit");
				System.out.print("Enter choice: ");

				int choice = scanner.nextInt();
				switch (choice) {
				case 1 -> insertRow(conn, scanner);
				case 2 -> updateRow(conn, scanner);
				case 3 -> deleteRow(conn, scanner);
				case 4 -> selectRow(conn, scanner);
				case 5 -> {
					System.out.println("Exiting...");
					return;
				}
				default -> System.out.println("Invalid choice. Try again.");
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}
