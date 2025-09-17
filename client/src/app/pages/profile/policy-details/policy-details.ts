import { CommonModule } from '@angular/common';
import { Component, OnInit } from '@angular/core';
import { FormsModule } from '@angular/forms';
import { HttpClient } from '@angular/common/http';
import { environment } from '../../../../environments/environment.development';

@Component({
  selector: 'app-policy-details',
  standalone: true,
  imports: [CommonModule, FormsModule],
  templateUrl: './policy-details.html',
  styleUrls: ['./policy-details.css']
})
export class PolicyDetails implements OnInit {
  policy: any;

  constructor(private http: HttpClient) {}

  ngOnInit() {
    const clientId = '8e373dfa-0335-406b-a0b9-081819b3da0d';
    const url = `${environment.apiUrl}/v1/private/policy/get/${clientId}`;
    this.http.get(url).subscribe(data => {
      this.policy = data;
    });
  }
}