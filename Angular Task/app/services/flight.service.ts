import { Injectable } from '@angular/core';
import { HttpClient } from '@angular/common/http';
import { Observable } from 'rxjs';
import { Flight } from '../models/flight.model';

@Injectable({
  providedIn: 'root',
})
export class FlightService {
  private apiUrl = 'assets/api.json';

  constructor(private http: HttpClient) {}

  getFlights(): Observable<any> {
    return this.http.get<any>('assets/api.json');
  }

  saveBooking(booking: any): void {
    const bookings = JSON.parse(localStorage.getItem('bookings') || '[]');
    bookings.push(booking);
    localStorage.setItem('bookings', JSON.stringify(bookings));
    console.log('Booking saved successfully:', booking);
  }
  getBookings(): any[] {
    const bookings = JSON.parse(localStorage.getItem('bookings') || '[]');
    console.log('Fetched bookings from localStorage:', bookings);
    return bookings;
  }

  clearBooking(index: number): void {
    const bookings = this.getBookings();
    console.log('Removing booking at index:', index, bookings[index]);
    bookings.splice(index, 1);
    localStorage.setItem('bookings', JSON.stringify(bookings));
    console.log('Booking removed successfully. Remaining bookings:', bookings);
  }
}
