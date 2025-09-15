import { CommonModule } from '@angular/common';
import { Component, OnInit } from '@angular/core';
import { FormsModule } from '@angular/forms';
import { HttpClient } from '@angular/common/http';

@Component({
  selector: 'app-policy-details',
  standalone: true,
  imports: [CommonModule, FormsModule],
  templateUrl: './policy-details.html',
  styleUrls: ['./policy-details.css']
})
export class PolicyDetails implements OnInit {
  policy = {
    id: '',
    type: '',
    startDate: '',
    endDate: '',
    premium: '',
    coverage: ''
  };

  constructor(private http: HttpClient) {}

  ngOnInit() {
    this.http.get<any>('https://api.example.com/policy')
      .subscribe(data => {
        this.policy = data;
      });
  }
}