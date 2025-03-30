import { Component, OnInit } from '@angular/core';
import { FlightService } from '../../services/flight.service';

@Component({
  selector: 'app-manage-trips',
  templateUrl: './manage-trips.component.html',
  styleUrls: ['./manage-trips.component.css'],
})
export class ManageTripsComponent implements OnInit {
  bookings: any[] = [];

  constructor(private flightService: FlightService) {}

  ngOnInit(): void {
    this.loadBookings();
  }

  loadBookings(): void {
    console.log('Loading bookings from localStorage...');
    this.bookings = this.flightService.getBookings();
    console.log('Bookings loaded:', this.bookings);
  }

  clearBooking(index: number): void {
    if (confirm('Are you sure you want to cancel this booking?')) {
      console.log('Attempting to clear booking at index:', index);
      this.flightService.clearBooking(index);
      this.loadBookings();
    }
  }
}
