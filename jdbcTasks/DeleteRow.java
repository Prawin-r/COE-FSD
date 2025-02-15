package jdbcTasks;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.util.Scanner;

public class DeleteRow {
	private static final String URL = "jdbc:mysql://localhost:3306/warehouse";
    private static final String USER = "root";
    private static final String PASSWORD = "Prawin@0105";

    public static void main(String[] args) {
        try (Connection conn = DriverManager.getConnection(URL, USER, PASSWORD);
             Scanner scanner = new Scanner(System.in)) {
            
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

        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
