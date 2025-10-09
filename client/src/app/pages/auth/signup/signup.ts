import { Component, inject } from '@angular/core';
import { FormBuilder, FormGroup, Validators, ReactiveFormsModule, AbstractControl, ValidationErrors, ValidatorFn } from '@angular/forms';
import { Router } from '@angular/router';

@Component({
  selector: 'app-signup',
  imports: [ ReactiveFormsModule],
  templateUrl: './signup.html',
  styleUrl: './signup.css'
})

export class Signup {

  private router = inject(Router);
  private fb = inject(FormBuilder);

  signupForm: FormGroup = new FormGroup({});
  maxDate: String = "";

  ngOnInit(){
    const saved = localStorage.getItem('signupDetails');
    const parsed = saved ? JSON.parse(saved) : [];

    const today = new Date();
    today.setFullYear(today.getFullYear() - 3); // subtract 3 years
    this.maxDate = today.toISOString().split('T')[0]; // format yyyy-MM-dd

    this.signupForm = this.fb.group({
      name: ['', [Validators.required, Validators.pattern('^[a-zA-Z ]+$')]],
      // username: ['', Validators.required],
      email: ['', [Validators.required, Validators.email]],
      confirmEmail: ['', [Validators.required, Validators.email]],
      dob: ['', Validators.required],
      gender: ['', Validators.required],
      address: ['', Validators.required],
      phone: ['', [Validators.required, Validators.pattern('^[6-9]{1}[0-9]{9}$')]],
      password: ['', [Validators.required, Validators.minLength(6)]],
      confirmPassword: ['', [Validators.required, Validators.minLength(6)]],
      }, {
      validators: [
      matchFieldsValidator('email', 'confirmEmail', 'emailMismatch'),
      matchFieldsValidator('password', 'confirmPassword', 'passwordMismatch')
    ]
    });

    // if (saved) {
    //       this.signupForm = this.fb.group(JSON.parse(saved));
    // }

    // this.signupForm.valueChanges.subscribe(val => {
    //     localStorage.setItem('signupDetails', JSON.stringify(val));
    // });
  }

  onSignup() {
      if(this.signupForm.valid){
        localStorage.setItem('signupDetails', JSON.stringify(this.signupForm.value));
        this.router.navigateByUrl('/auth/dependents-nomination');
      }else {
        this.signupForm.markAllAsTouched();
      }
  }
}

export function matchFieldsValidator(field1: string, field2: string, errorKey: string): ValidatorFn {
  return (group: AbstractControl): ValidationErrors | null => {
    const f1 = group.get(field1)?.value;
    const f2 = group.get(field2)?.value;
    return f1 === f2 ? null : { [errorKey]: true };
  };
}

