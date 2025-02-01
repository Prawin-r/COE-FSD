package weekTasks;

public class EnumDemo {
	public static void main(String[] args) {
		
		checkHolidays(DaysOfWeek.SUNDAY);
		checkHolidays(DaysOfWeek.SATURDAY);
		checkHolidays(DaysOfWeek.WEDNESDAY);
		
	}

public static void checkHolidays(DaysOfWeek day) {
	switch(day){
	case SUNDAY:
	case SATURDAY:
	System.out.println(day + " is a holiday");
	break;
	default:
		System.out.println(day +" is not a holiday");
	}
}
}
