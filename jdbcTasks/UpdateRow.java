package jdbcTasks;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.util.Scanner;

public class UpdateRow {
	static String URL = "jdbc:mysql://localhost:3306/warehouse";
	static String USER = "root";
	static String PASSWORD = "Prawin@0105";

	public static void main(String[] args) {
		try {
			Connection conn = DriverManager.getConnection(URL, USER, PASSWORD);
			Scanner sc = new Scanner(System.in);
			System.out.println("Enter product id:");
			int id=sc.nextInt();
			System.out.println("Enter quantity:");
			int quantity=sc.nextInt();
			System.out.println("Enter new price: ");
			double price=sc.nextDouble();
			
			String query = "UPDATE Warehouse SET quantity = ?, price = ? WHERE id = ?";
            PreparedStatement pstmt = conn.prepareStatement(query);
            pstmt.setInt(1,quantity);
            pstmt.setDouble(2,price);
            pstmt.setInt(3,id);
            
            int rowsUpdated=pstmt.executeUpdate();
            if(rowsUpdated>0) {
            	System.out.println("Rows updated successfully");
            }
            else {
            	System.out.println("No row found with given id");
            }

		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
	}
}
