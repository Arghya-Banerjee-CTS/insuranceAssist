import { CommonModule } from '@angular/common';
import { Component } from '@angular/core';
import { PersonalDetails } from './personal-details/personal-details';
import { PolicyDetails } from './policy-details/policy-details';
import { DependentsDetails } from './dependents-details/dependents-details';

@Component({
  selector: 'app-profile',
  standalone: true,
  imports: [CommonModule, PersonalDetails, PolicyDetails, DependentsDetails],
  templateUrl: './profile.html',
  styleUrls: ['./profile.css']
})
export class Profile {
  activeTab: 'personal' | 'policy' | 'dependents' = 'personal';
}