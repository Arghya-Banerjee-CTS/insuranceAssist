import { CommonModule } from '@angular/common';
import { Component } from '@angular/core';
import { FormsModule } from '@angular/forms';

@Component({
  selector: 'app-policy-details',
  standalone: true,
  imports: [CommonModule, FormsModule],
  templateUrl: './policy-details.html',
  styleUrls: ['./policy-details.css']
})
export class PolicyDetails {
  policy = {
    id: 'POL123456',
    type: 'Health Insurance',
    startDate: '2024-01-01',
    endDate: '2025-01-01',
    premium: '₹12,000',
    coverage: '₹5,00,000'
  };
}