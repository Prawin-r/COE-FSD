package ExceptionHandling;

class EmptyFileException extends Exception {
    public EmptyFileException(String message) {
        super(message);
    }
}
