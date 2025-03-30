import { NgModule } from '@angular/core';
import { BrowserModule } from '@angular/platform-browser';
import { FormsModule } from '@angular/forms';
import { AppComponent } from './app.component';
import { HomeComponent } from './components/home/home.component';
import { FlightsComponent } from './components/flights/flights.component';
import { BookingComponent } from './components/booking/booking.component';
import { SupportComponent } from './components/support/support.component';
import { LoginComponent } from './components/login/login.component';
import { RouterModule, Routes } from '@angular/router';
import { HttpClientModule } from '@angular/common/http';
import { AuthGuard } from './guards/auth.guard';
import { MenuBarComponent } from './menu-bar/menu-bar.component';
import { ManageTripsComponent } from './components/manage-trips/manage-trips.component';
import { AppRoutingModule } from './app-routing.module';
import { CommonModule } from '@angular/common';
import { FlightFilterPipe } from './pipes/flight-filter.pipe';
import { FlightTimePipe } from './pipes/flight-time.pipe';
import { CapitalizePipe } from './pipes/capitalize.pipe';
import { ReactiveFormsModule } from '@angular/forms';

const routes: Routes = [
  { path: '', component: HomeComponent },
  { path: 'flights', component: FlightsComponent },
  { path: 'booking', component: BookingComponent, canActivate: [AuthGuard] },
  { path: 'support', component: SupportComponent },
  { path: 'login', component: LoginComponent },
];

@NgModule({
  declarations: [
    AppComponent,
    HomeComponent,
    FlightsComponent,
    BookingComponent,
    SupportComponent,
    LoginComponent,
    MenuBarComponent,
    ManageTripsComponent,
    FlightFilterPipe,
    FlightTimePipe,
    CapitalizePipe,
  
    BrowserModule,
    FormsModule,
    ReactiveFormsModule,
    HttpClientModule,
    RouterModule.forRoot(routes),
    AppRoutingModule,
    CommonModule,
  ],
  providers: [AuthGuard],
  bootstrap: [AppComponent],
})
export class AppModule {}
