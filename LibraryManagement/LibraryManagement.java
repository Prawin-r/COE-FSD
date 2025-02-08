package LibraryManagement;

public class LibraryManagement {
	public static void main(String[] args) {
        Library library = new Library();

        // Adding Books & Users
        library.addBook(new Book("Java Programming", "James Gosling", "123456"));
        library.addBook(new Book("Python Basics", "Guido van Rossum", "654321"));
        library.addUser(new User("Alice", "U001"));
        library.addUser(new User("Bob", "U002"));

        // Borrowing & Returning Books
        library.borrowBook("123456", "U001");
        library.borrowBook("654321", "U002");
        library.returnBook("123456", "U001");

        // Searching for a book
        Book foundBook = library.findBook("123456");
        if (foundBook != null) System.out.println("Book Found: " + foundBook);
        else System.out.println("Book Not Found.");
    }
}
