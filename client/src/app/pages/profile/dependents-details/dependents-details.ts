import { CommonModule } from '@angular/common';
import { Component, OnInit } from '@angular/core';
import { FormsModule } from '@angular/forms';
import { HttpClient } from '@angular/common/http';

interface Dependent {
  id?: string;
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
export class DependentsDetails implements OnInit {
  dependents: Dependent[] = [];

  constructor(private http: HttpClient) {}

  ngOnInit() {
    this.http.get<Dependent[]>('https://api.example.com/dependents')
      .subscribe(data => {
        this.dependents = data;
      });
  }

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
    if (dep.isNew) {
      this.http.post<Dependent>('https://api.example.com/dependents', dep.temp)
        .subscribe(newDep => {
          Object.assign(dep, newDep);
          dep.editing = false;
          dep.isNew = false;
        });
    } else {
      this.http.put<Dependent>(`https://api.example.com/dependents/${dep.id}`, dep.temp)
        .subscribe(updatedDep => {
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
}