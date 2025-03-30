import { Pipe, PipeTransform } from '@angular/core';
import { Flight } from '../models/flight.model';

@Pipe({
  name: 'flightFilter',
})
export class FlightFilterPipe implements PipeTransform {
  transform(
    flights: Flight[],
    originFilter: string,
    destinationFilter: string,
    maxPrice: number
  ): Flight[] {
    if (!flights) return [];

    return flights.filter((flight) => {
      const origin = flight.origin?.toLowerCase() || ''; // Ensure it's a valid string
      const destination = flight.destination?.toLowerCase() || ''; // Ensure it's a valid string

      const matchesOrigin = origin.includes(originFilter?.toLowerCase() || '');
      const matchesDestination = destination.includes(
        destinationFilter?.toLowerCase() || ''
      );
      const matchesPrice = flight.price <= maxPrice;

      return matchesOrigin && matchesDestination && matchesPrice;
    });
  }
}
