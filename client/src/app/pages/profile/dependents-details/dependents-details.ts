import { CommonModule } from '@angular/common';
import { Component } from '@angular/core';
import { FormsModule } from '@angular/forms';

interface Dependent {
  name: string;
  dob: string;
  contact: string;
  address: string;
  relation: string;
  gender: string;
  editing?: boolean;
  temp?: Partial<Dependent>;
  isNew?: boolean;
}

@Component({
  selector: 'app-dependents-details',
  standalone: true,
  imports: [CommonModule, FormsModule],
  templateUrl: './dependents-details.html',
  styleUrls: ['./dependents-details.css']
})
export class DependentsDetails {
  dependents: Dependent[] = [
    {
      name: 'Jane Doe',
      dob: '2010-05-12',
      contact: '9876543211',
      address: '123 Main St, City, Country',
      relation: 'Daughter',
      gender: 'Female'
    },
    {
      name: 'Sam Doe',
      dob: '2012-08-22',
      contact: '9876543212',
      address: '123 Main St, City, Country',
      relation: 'Son',
      gender: 'Male'
    }
  ];

  addDependent() {
    this.dependents.push({
      name: '',
      dob: '',
      contact: '',
      address: '',
      relation: '',
      gender: '',
      editing: true,
      isNew: true,
      temp: {
        name: '',
        dob: '',
        contact: '',
        address: '',
        relation: '',
        gender: ''
      }
    });
  }

  edit(dep: Dependent) {
    dep.editing = true;
    dep.temp = { ...dep };
  }

  save(dep: Dependent) {
    Object.assign(dep, dep.temp);
    dep.editing = false;
    dep.isNew = false;
    // TODO: Add backend API call here later
  }

  cancel(dep: Dependent) {
    if (dep.isNew) {
      this.dependents = this.dependents.filter(d => d !== dep);
    } else {
      dep.editing = false;
    }
  }
}