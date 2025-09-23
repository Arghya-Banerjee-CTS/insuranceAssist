import { CommonModule } from '@angular/common';
import { Component, OnInit } from '@angular/core';
import { FormsModule } from '@angular/forms';
import { HttpClient } from '@angular/common/http';
import { environment } from '../../../../environments/environment.development';

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
    const clientId = localStorage.getItem('userId');
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
    const clientId = localStorage.getItem('userId');
    const updateUrl = `${environment.apiUrl}/private/profile/update/${clientId}`;
    
    const payload = {
      address: this.temp.address,
      phone: this.temp.phone
    };

    this.http.put(updateUrl, payload)
      .subscribe(updatedPeronalDetails => {
        Object.assign(this.personal, updatedPeronalDetails);
        this.editing = false;
      });
  }
  cancel() {
    this.editing = false;
  }
}