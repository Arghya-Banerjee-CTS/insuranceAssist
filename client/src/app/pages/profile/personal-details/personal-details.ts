import { CommonModule } from '@angular/common';
import { Component } from '@angular/core';
import { FormsModule } from '@angular/forms';

@Component({
  selector: 'app-personal-details',
  standalone: true,
  imports: [CommonModule, FormsModule],
  templateUrl: './personal-details.html',
  styleUrls: ['./personal-details.css']
})
export class PersonalDetails {
  editing = false;
  personal = {
    name: 'John Doe',
    email: 'john.doe@email.com',
    dob: '1990-01-01',
    phone: '9876543210',
    gender: 'Male',
    address: '123 Main St, City, Country'
  };
  temp = { ...this.personal };

  edit() {
    this.editing = true;
    this.temp = { ...this.personal };
  }
  save() {
    this.personal = { ...this.temp };
    this.editing = false;
  }
  cancel() {
    this.editing = false;
  }
}