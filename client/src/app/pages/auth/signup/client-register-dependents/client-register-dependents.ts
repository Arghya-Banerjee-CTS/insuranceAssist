import { Component } from '@angular/core';
import { FormArray, FormBuilder, ReactiveFormsModule, Validators, FormGroup } from '@angular/forms';
import { Router } from '@angular/router';

@Component({
  selector: 'app-client-register-dependents',
  imports: [ReactiveFormsModule],
  templateUrl: './client-register-dependents.html',
  styleUrl: './client-register-dependents.css'
})
export class ClientRegisterDependents {
  registerDependentForm: FormGroup;
  constructor(private fb: FormBuilder, private router: Router) {
    this.registerDependentForm= this.fb.group({
    dependents: this.fb.array([])
    });
    this.addDependent();
    // console.log('Dependents after add:', this.dependents.length); // Should log 1
  } 

  get dependents() {
    return this.registerDependentForm.get('dependents') as FormArray;
  }

  addDependent() {
    this.dependents.push(this.fb.group({
      name: ['', Validators.required],
      dob: ['', Validators.required],
      contact: ['', [Validators.required, Validators.pattern('^[0-9]{10}$')]],
      address: ['', Validators.required],
      gender: ['', Validators.required],
      relationshipTypeId: ['', Validators.required]
    }));
  }

  removeDependent(index: number) {
    if( this.dependents.length > 1 ){
       this.dependents.removeAt(index);
    }
  }

  nextStep() {
    console.log("workin");
    if (this.registerDependentForm.valid) {
      const dependentsList = this.registerDependentForm.value.dependents;
      localStorage.setItem('dependents', JSON.stringify(dependentsList));
      this.router.navigate(['/auth/policy-plan']);
    }
  }
}
