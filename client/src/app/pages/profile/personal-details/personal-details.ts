import { CommonModule } from '@angular/common';
import { Component, OnInit } from '@angular/core';
import { FormsModule } from '@angular/forms';
import { HttpClient } from '@angular/common/http';
import { environment } from '../../../../environments/environment.development';

@Component({
  selector: 'app-personal-details',
  standalone: true,
  imports: [CommonModule, FormsModule],
  templateUrl: './personal-details.html',
  styleUrls: ['./personal-details.css']
})
export class PersonalDetails implements OnInit {
  editing = false;
  personal = {
    username: '',
    name: '',
    gender: '',
    dob: '',
    address: '',
    email: '',
    phone: ''
  };
  temp = { ...this.personal };

  constructor(private http: HttpClient) {}

  ngOnInit() {
    const clientId = localStorage.getItem('clientId');
    const getUrl = `${environment.apiUrl}/private/profile/get/${clientId}`;
    this.http.get<any>(getUrl)
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