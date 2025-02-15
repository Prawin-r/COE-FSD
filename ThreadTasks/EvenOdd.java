package ThreadTasks;

public class EvenOdd extends Thread {
	public static void main(String[] args) {
		EvenThread thread1 = new EvenThread();
		OddThread thread2 = new OddThread();
		thread1.start();
		thread2.start();

	}
}

class EvenThread extends Thread {
	public void run() {
		for (int i = 2; i < 100; i += 2) {
			System.out.println("Even :"+ i);
		}
	}
}

class OddThread extends Thread {

	public void run() {
		for (int i = 1; i < 100; i += 2) {
			System.out.println("Odd :" + i);
		}
	}
}
