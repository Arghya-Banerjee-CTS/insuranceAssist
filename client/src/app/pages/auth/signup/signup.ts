import { Component, inject } from '@angular/core';
import { FormBuilder, FormGroup, Validators, ReactiveFormsModule } from '@angular/forms';
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

  ngOnInit(){
    const saved = localStorage.getItem('signupDetails');
    const parsed = saved ? JSON.parse(saved) : [];

    this.signupForm = this.fb.group({
          name: ['', Validators.required],
          // username: ['', Validators.required],
          email: ['', [Validators.required, Validators.email]],
          confirmEmail: ['', [Validators.required, Validators.email]],
          dob: ['', Validators.required],
          gender: ['', Validators.required],
          address: ['', Validators.required],
          phone: ['', [Validators.required, Validators.pattern('^[0-9]{10}$')]],
          password: ['', [Validators.required, Validators.minLength(6)]],
          confirmPassword: ['', [Validators.required, Validators.minLength(6)]],
      });

    if (saved) {
          this.signupForm = this.fb.group(JSON.parse(saved));
    }

    this.signupForm.valueChanges.subscribe(val => {
        localStorage.setItem('signupDetails', JSON.stringify(val));
    });
  }

  onSignup() {
      if(this.signupForm.valid){
        localStorage.setItem('signupDetails', JSON.stringify(this.signupForm.value));
        this.router.navigateByUrl('/auth/dependents-nomination');
      }
  }
}

