import { CommonModule } from '@angular/common';
import { Component, OnInit } from '@angular/core';
import { FormsModule } from '@angular/forms';
import { HttpClient } from '@angular/common/http';
import { environment } from '../../../../environments/environment.development';

interface Dependent {
  id?: any;
  name: any;
  dob: any;
  phone: any;
  address: any;
  relationName: any;
  gender: any;
  email: any;
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
export class DependentsDetails implements OnInit {
  dependents: Dependent[] = [];

  relationOptions = [
    { label: 'Father', value: 1 },
    { label: 'Mother', value: 2 },
    { label: 'Brother', value: 3 },
    { label: 'Sister', value: 4 },
    { label: 'Wife', value: 5 },
    { label: 'Husband', value: 6 },
    { label: 'Son', value: 7 },
    { label: 'Daughter', value: 8 },
    { label: 'Gaurdian', value: 9 },
  ];

  constructor(private http: HttpClient) {}

  ngOnInit() {
    const clientId = localStorage.getItem('userId');
    const getUrl = `${environment.apiUrl}/private/dependent/get/${clientId}`;
    this.http.get<Dependent[]>(getUrl).subscribe(data => {
      this.dependents = data;
    });
  }

  addDependent() {
    this.dependents.push({
      name: '',
      dob: '',
      phone: '',
      address: '',
      relationName: '',
      gender: '',
      email: '',
      editing: true,
      isNew: true,
      temp: {
        name: '',
        dob: '',
        phone: '',
        address: '',
        relationName: '',
        gender: '',
        email: ''
      }
    });
  }

  edit(dep: Dependent) {
    dep.editing = true;
    dep.temp = { ...dep };
  }

  save(dep: Dependent) {
    const clientId = localStorage.getItem('userId');

    if (dep.isNew) {
      const createUrl = `${environment.apiUrl}/private/dependent/create`;
      const payload = {
        name: dep.temp?.name,
        dob: dep.temp?.dob,
        phone: dep.temp?.phone,
        address: dep.temp?.address,
        relationTypeId: dep.temp?.relationName,
        gender: dep.temp?.gender,
        email: dep.temp?.email,
        clientId: clientId
      };

      this.http.post<Dependent>(createUrl, payload).subscribe(newDep => {
        Object.assign(dep, newDep);
        dep.editing = false;
        dep.isNew = false;
      });
    } else {
      const updateUrl = `${environment.apiUrl}/private/dependent/update/${dep.id}`;
      const payload = {
        name: dep.temp?.name,
        dob: dep.temp?.dob,
        phone: dep.temp?.phone,
        address: dep.temp?.address,
        gender: dep.temp?.gender,
        email: dep.temp?.email
      };

      this.http.put<Dependent>(updateUrl, payload).subscribe(updatedDep => {
        Object.assign(dep, updatedDep);
        dep.editing = false;
      });
    }
  }

  cancel(dep: Dependent) {
    if (dep.isNew) {
      this.dependents = this.dependents.filter(d => d !== dep);
    } else {
      dep.editing = false;
    }
  }

  // getRelationLabel(value: number): string {
  //   const match = this.relationOptions.find(opt => opt.value === value);
  //   return match ? match.label : 'Unknown';
  // }
}