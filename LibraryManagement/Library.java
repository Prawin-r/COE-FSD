package LibraryManagement;

import java.util.ArrayList;
import java.util.List;

public class Library {
	private List<Book> books = new ArrayList<>();
	private List<User> users = new ArrayList<>();

	public void addBook(Book book) {
		books.add(book);
	}

	public void addUser(User user) {
		users.add(user);
	}

	public void borrowBook(String ISBN, String userID) {
		Book book = findBook(ISBN);
		User user = findUser(userID);

		if (book != null && user != null && !book.isBorrowed()) {
			user.borrowBook(book);
			System.out.println(userID + " borrowed " + book.getTitle());
		} else {
			System.out.println("Book not available or User not found.");
		}
	}

	public void returnBook(String ISBN, String userID) {
		Book book = findBook(ISBN);
		User user = findUser(userID);

		if (book != null && user != null && user.getBorrowedBooks().contains(book)) {
			user.returnBook(book);
			System.out.println(userID + " returned " + book.getTitle());
		} else {
			System.out.println("Invalid return operation.");
		}
	}

	public Book findBook(String ISBN) {
		for (Book book : books) {
			if (book.getISBN().equals(ISBN))
				return book;
		}
		return null;
	}

	public User findUser(String userID) {
		for (User user : users) {
			if (user.getUserID().equals(userID))
				return user;
		}
		return null;
	}
}
