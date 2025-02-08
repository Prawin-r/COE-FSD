package LibraryManagement;

public class Book {
	private String title;
	private String author;
	private String ISBN;
	private boolean isBorrowed;

	public Book(String title, String author, String ISBN) {
		this.title = title;
		this.author = author;
		this.ISBN = ISBN;
		this.isBorrowed = false;
	}

	public String getISBN() {
		return ISBN;
	}

	public String getTitle() {
		return title;
	}

	public boolean isBorrowed() {
		return isBorrowed;
	}

	public void borrow() {
		isBorrowed = true;
	}

	public void returnBook() {
		isBorrowed = false;
	}

	@Override
	public String toString() {
		return "Book{" + "Title='" + title + "', Author='" + author + "', ISBN='" + ISBN + "', Borrowed=" + isBorrowed
				+ "}";
	}
}
