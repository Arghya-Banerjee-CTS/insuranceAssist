import { CommonModule } from '@angular/common';
import { Component, OnInit } from '@angular/core';
import { FormsModule } from '@angular/forms';
import { HttpClient } from '@angular/common/http';

@Component({
  selector: 'app-agent-personal-details',
  standalone: true,
  imports: [CommonModule, FormsModule],
  templateUrl: './personal-details.html',
  styleUrls: ['./personal-details.css']
})
export class PersonalDetails implements OnInit {
  editing = false;
  personal = {
    name: '',
    email: '',
    address: '',
    dob: '',
    phone: '',
    gender: ''
  };
  temp = { ...this.personal };

  constructor(private http: HttpClient) {}

  ngOnInit() {
    this.http.get<any>('https://api.example.com/profile')
      .subscribe(data => {
        this.personal = data;
        this.temp = { ...data };
      });
  }

  edit() {
    this.editing = true;
    this.temp = { ...this.personal };
  }
  save() {
    this.http.put('https://api.example.com/profile', this.temp)
      .subscribe(updated => {
        this.personal = { ...this.temp };
        this.editing = false;
      });
  }
  cancel() {
    this.editing = false;
  }
}