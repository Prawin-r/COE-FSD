import { Component } from '@angular/core';

@Component({
  selector: 'app-support',
  templateUrl: './support.component.html',
  styleUrls: ['./support.component.css'],
})
export class SupportComponent {
  showSuccessMessage: boolean = false;

  onSubmit(event: Event) {
    event.preventDefault();
    this.showSuccessMessage = true;
    setTimeout(() => {
      this.showSuccessMessage = false;
    }, 3000);
  }
}
