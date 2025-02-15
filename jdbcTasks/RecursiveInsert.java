package jdbcTasks;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.Scanner;

public class RecursiveInsert {
	static String URL = "jdbc:mysql://localhost:3306/warehouse";
	static String USER = "root";
	static String PASSWORD = "Prawin@0105";

	public static void insertRows(Scanner scanner, Connection conn) throws SQLException {
		String query = "INSERT INTO Warehouse (id,product_name, quantity, price) VALUES (?,?, ?, ?)";
		PreparedStatement pstmt = conn.prepareStatement(query);
		System.out.println("Enter id: ");
		int id = scanner.nextInt();
		System.out.print("Enter product name: ");
		String name = scanner.next();
		System.out.print("Enter quantity: ");
		int quantity = scanner.nextInt();
		System.out.print("Enter price: ");
		double price = scanner.nextDouble();
		pstmt.setInt(1, id);
		pstmt.setString(2, name);
		pstmt.setInt(3, quantity);
		pstmt.setDouble(4, price);
		pstmt.executeUpdate();
		System.out.println("Row inserted successfully!");

		System.out.print("Do you want to insert another row? (yes/no): ");
		String choice = scanner.next();
		if (choice.equalsIgnoreCase("yes")) {
			insertRows(scanner, conn);
		}
	}

	public static void main(String[] args) {
		try (Connection conn = DriverManager.getConnection(URL, USER, PASSWORD);
				Scanner scanner = new Scanner(System.in)) {
			insertRows(scanner, conn);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}
