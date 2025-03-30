import { Component, OnInit } from '@angular/core';
import { FlightService } from '../../services/flight.service';
import { Flight } from '../../models/flight.model';
import { Router } from '@angular/router';

@Component({
  selector: 'app-flights',
  templateUrl: './flights.component.html',
  styleUrls: ['./flights.component.css'],
})
export class FlightsComponent implements OnInit {
  flights: Flight[] = [];
  originFilter: string = '';
  destinationFilter: string = '';
  selectedTime: string = '';
  maxPrice: number = 10000;

  constructor(private flightService: FlightService, private router: Router) {}

  ngOnInit(): void {
    this.flightService.getFlights().subscribe((data) => {
      this.flights = data.flights;
    });
  }
  bookFlight(flight: any) {
    const isLoggedIn = localStorage.getItem('isLoggedIn');
    if (isLoggedIn === 'true') {
      // Check if the user is logged in before proceeding
      localStorage.setItem('selectedFlight', JSON.stringify(flight));
      this.router.navigate(['/booking']); // Redirect to booking page
    } else {
      this.router.navigate(['/login']); // Redirect to login if not authenticated
    }
  }

  swapLocations(): void {
    const temp = this.originFilter;
    this.originFilter = this.destinationFilter;
    this.destinationFilter = temp;
  }
}
